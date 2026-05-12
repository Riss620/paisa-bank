# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Tomcat
FROM tomcat:10.1-jdk21
# Clear out default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy the built WAR file from Stage 1 into Tomcat
COPY --from=build /app/target/LaceBank.war /usr/local/tomcat/webapps/ROOT.war
# Expose the web port
EXPOSE 8080
# Activate the production profile so ConfigLoader picks up application-prod.properties
# and resolves Railway's MySQL environment variables (MYSQL_URL, MYSQLUSER, MYSQLPASSWORD, etc.)
ENV SPRING_PROFILES_ACTIVE=prod
# Start Tomcat
CMD ["catalina.sh", "run"]