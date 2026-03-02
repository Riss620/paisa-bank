package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

import java.io.IOException;

@Log
@WebServlet(name = "Loan", urlPatterns = "/Loan")
public class Loan extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Safety Check: Is user logged in?
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        Integer accountNo = (Integer) session.getAttribute("accountNumber");
        String loanType = request.getParameter("loanType");
        String firstName = (String) session.getAttribute("firstName");
        String email = (String) session.getAttribute("email");

        log.info("Processing " + loanType + " application for: " + email);

        // Call the Service Layer to handle the "Business Logic" of the loan application
        boolean isApplied = bankService.applyForLoan(accountNo, firstName, email, loanType);

        if (isApplied) {
            response.sendRedirect("home?msg=Loan+Application+Submitted");
        } else {
            log.warning("Loan application failed for: " + email);
            response.sendRedirect("error.jsp?error=Loan+Application+Failed");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the hidden JSP in WEB-INF
        request.getRequestDispatcher("/WEB-INF/views/Loan.jsp").forward(request, response);
    }
}