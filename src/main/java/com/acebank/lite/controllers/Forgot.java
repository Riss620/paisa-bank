package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.java.Log;
import java.io.IOException;

@Log
@WebServlet(name = "Forgot", urlPatterns = "/Forgot")
public class Forgot extends HttpServlet {
    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "sendOTP"; // default
        }

        jakarta.servlet.http.HttpSession session = request.getSession();

        if ("sendOTP".equals(action)) {
            String email = request.getParameter("email");
            String otp = bankService.generateAndSendOTP(email);

            if (otp != null) {
                log.info("OTP sent to: " + email);
                session.setAttribute("resetEmail", email);
                session.setAttribute("resetOtp", otp);
                response.sendRedirect("verify-otp.jsp");
            } else {
                log.warning("Recovery failed: Email not found - " + email);
                response.sendRedirect("forgot-password.jsp?error=not_found");
            }
        } else if ("verifyOTP".equals(action)) {
            String inputOtp = request.getParameter("otp");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String sessionOtp = (String) session.getAttribute("resetOtp");
            String sessionEmail = (String) session.getAttribute("resetEmail");

            if (sessionOtp != null && sessionOtp.equals(inputOtp) && sessionEmail != null) {
                if (newPassword != null && newPassword.equals(confirmPassword)) {
                    boolean updated = bankService.updatePasswordByEmail(sessionEmail, newPassword);
                    if (updated) {
                        session.removeAttribute("resetOtp");
                        session.removeAttribute("resetEmail");
                        response.sendRedirect("login.jsp?msg=Password+Reset+Successfully");
                    } else {
                        response.sendRedirect("verify-otp.jsp?error=update_failed");
                    }
                } else {
                    response.sendRedirect("verify-otp.jsp?error=password_mismatch");
                }
            } else {
                response.sendRedirect("verify-otp.jsp?error=invalid_otp");
            }
        }
    }
}