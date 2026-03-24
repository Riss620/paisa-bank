package com.acebank.lite.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigLoader {
    private static final Properties properties = new Properties();

    static {
        // Select properties file based on active profile (SPRING_PROFILES_ACTIVE env var)
        String profile = System.getenv("SPRING_PROFILES_ACTIVE");
        String propsFile = (profile != null && profile.equalsIgnoreCase("prod"))
                ? ConfigKeys.PROD_PROPERTIES
                : ConfigKeys.DEV_PROPERTIES;

        try (InputStream is = ConfigLoader.class.getClassLoader()
                .getResourceAsStream(propsFile)) {

            if (is == null) {
                throw new RuntimeException("Could not find " + propsFile);
            }
            properties.load(is);

        } catch (IOException e) {
            throw new RuntimeException("Failed to load configuration", e);
        }
    }

    /**
     * Retrieves a property value.
     * Priority 1: Railway-specific env var aliases for DB keys.
     * Priority 2: Generic env var derived from the property key (dots → underscores, uppercase).
     * Priority 3: Value from the loaded properties file.
     */
    public static String getProperty(String key) {
        // Priority 1: Railway MySQL env var aliases
        // Railway injects MYSQL_URL, MYSQLHOST, MYSQLPORT, MYSQLDATABASE, MYSQLUSER, MYSQLPASSWORD
        // but the app uses db.url, db.user, db.password — map them explicitly.
        if (ConfigKeys.DB_URL.equals(key)) {
            String mysqlUrl = System.getenv("MYSQL_URL");
            if (mysqlUrl != null) return mysqlUrl;

            // Construct from individual Railway variables if MYSQL_URL is not set
            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            if (host != null && port != null && database != null) {
                return "jdbc:mysql://" + host + ":" + port + "/" + database;
            }
        }
        if (ConfigKeys.DB_USER.equals(key)) {
            String mysqlUser = System.getenv("MYSQLUSER");
            if (mysqlUser != null) return mysqlUser;
        }
        if (ConfigKeys.DB_PWD.equals(key)) {
            String mysqlPassword = System.getenv("MYSQLPASSWORD");
            if (mysqlPassword != null) return mysqlPassword;
        }

        // Priority 2: Generic env var (e.g. db.url → DB_URL)
        String envValue = System.getenv(key.replace(".", "_").toUpperCase());
        if (envValue != null) return envValue;

        // Priority 3: Properties file fallback
        return properties.getProperty(key);
    }
}