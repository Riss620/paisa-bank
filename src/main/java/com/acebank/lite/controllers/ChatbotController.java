package com.acebank.lite.controllers;

import com.acebank.lite.models.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/api/chatbot")
public class ChatbotController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if (session == null || session.getAttribute("accountNumber") == null) {
            String jsonResponse = "{\"reply\": \"Your session has expired. Please log in again.\"}";
            out.print(jsonResponse);
            out.flush();
            return;
        }

        String userMessage = request.getParameter("message");
        if (userMessage == null || userMessage.trim().isEmpty()) {
            out.print("{\"reply\": \"I didn't quite catch that. How can I help you today?\"}");
            out.flush();
            return;
        }

        userMessage = userMessage.toLowerCase().trim();
        StringBuilder botReply = new StringBuilder();

        if (userMessage.contains("balance")) {
            BigDecimal balance = (BigDecimal) session.getAttribute("balance");
            botReply.append("Your current available balance is ₹")
                    .append(balance != null ? balance.toPlainString() : "0.00").append(".");
        } else if (userMessage.contains("account number") || userMessage.contains("acct num")) {
            Integer accNum = (Integer) session.getAttribute("accountNumber");
            botReply.append("Your account number is ").append(accNum).append(".");
        } else if (userMessage.contains("transaction") || userMessage.contains("history")
                || userMessage.contains("recent")) {
            List<Transaction> transactions = (List<Transaction>) session.getAttribute("transactionDetailsList");
            if (transactions != null && !transactions.isEmpty()) {
                botReply.append("Here are your 3 most recent transactions:<br/>");
                botReply.append("<ul class='list-disc pl-4 mt-2 space-y-1 text-sm'>");
                int count = 0;
                for (Transaction tx : transactions) {
                    if (count >= 3)
                        break;
                    String txDate = tx.createdAt() != null ? tx.createdAt().toLocalDate().toString() : "";
                    String type = tx.txType();
                    BigDecimal amount = tx.amount();
                    String sign = ("DEPOSIT".equals(type) || ("TRANSFER".equals(type) && tx.receiverAccount() != null
                            && tx.receiverAccount().equals(session.getAttribute("accountNumber")))) ? "+" : "-";
                    botReply.append("<li>").append(txDate).append(": ").append(type).append(" of ₹").append(sign)
                            .append(amount).append("</li>");
                    count++;
                }
                botReply.append("</ul>");
                botReply.append("<br/>You can download your full transaction history from the Dashboard.");
            } else {
                botReply.append("I couldn't find any recent transactions for your account.");
            }
        } else if (userMessage.contains("loan") || userMessage.contains("borrow")) {
            botReply.append(
                    "You can view your active loans and apply for new ones by clicking the 'Loans' link in the sidebar menu.");
        } else if (userMessage.contains("password") || userMessage.contains("reset pass")) {
            botReply.append("You can change your password by clicking 'Reset Password' in the sidebar menu.");
        } else if (userMessage.contains("hi") || userMessage.contains("hello") || userMessage.contains("hey")) {
            String firstName = (String) session.getAttribute("firstName");
            if (firstName == null)
                firstName = "there";
            botReply.append("Hello ").append(firstName).append(
                    "! I'm your Ace Bank virtual assistant. You can ask me about your balance, recent transactions, or account details.");
        } else {
            botReply.append(
                    "I'm sorry, I don't quite understand that yet. You can ask me things like 'What is my balance?', 'Show my recent transactions', or 'What is my account number?'.");
        }

        // Escape JSON string for safe output
        String escapedReply = botReply.toString().replace("\"", "\\\"");
        String jsonResponse = "{\"reply\": \"" + escapedReply + "\"}";
        out.print(jsonResponse);
        out.flush();
    }
}
