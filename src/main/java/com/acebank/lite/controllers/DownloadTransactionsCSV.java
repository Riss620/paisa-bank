package com.acebank.lite.controllers;

import com.acebank.lite.models.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.List;

@Log
@WebServlet("/download-transactions")
public class DownloadTransactionsCSV extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Security Check
        if (session == null || session.getAttribute("accountNumber") == null) {
            log.warning("Unauthorized access attempt to /download-transactions");
            response.sendRedirect("login.jsp");
            return;
        }

        int accountNumber = (int) session.getAttribute("accountNumber");
        List<Transaction> transactions = (List<Transaction>) session.getAttribute("transactionDetailsList");

        if (transactions == null) {
            log.warning("Transactions not found in session for account: " + accountNumber);
            response.sendRedirect("home");
            return;
        }

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"transactions_" + accountNumber + ".csv\"");

        String fromDateStr = request.getParameter("fromDate");
        String toDateStr = request.getParameter("toDate");
        LocalDate fromDate = null;
        LocalDate toDate = null;

        try {
            if (fromDateStr != null && !fromDateStr.trim().isEmpty()) {
                fromDate = LocalDate.parse(fromDateStr);
            }
            if (toDateStr != null && !toDateStr.trim().isEmpty()) {
                toDate = LocalDate.parse(toDateStr);
            }
        } catch (Exception e) {
            log.warning("Error parsing date parameters: " + e.getMessage());
        }

        try (PrintWriter writer = response.getWriter()) {
            writer.println("Date,Description,Amount,Type,Status");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            for (Transaction tx : transactions) {
                if (tx.createdAt() != null) {
                    LocalDate txDate = tx.createdAt().toLocalDate();
                    if (fromDate != null && txDate.isBefore(fromDate))
                        continue;
                    if (toDate != null && txDate.isAfter(toDate))
                        continue;
                }

                String date = tx.createdAt() != null ? tx.createdAt().format(formatter) : "";

                // Format for Excel string evaluation to avoid #### due to formatting widths
                // issues
                date = "=\"" + date + "\"";

                String description = "";
                if ("TRANSFER".equals(tx.txType())) {
                    if (tx.senderAccount() != null && tx.senderAccount() == accountNumber) {
                        description = "To " + tx.receiverAccount();
                    } else {
                        description = "From " + tx.senderAccount();
                    }
                } else {
                    description = tx.remark() != null ? tx.remark() : "";
                }

                // Escape commas in description or remark
                description = "\"" + description.replace("\"", "\"\"") + "\"";

                String amountStr = String.valueOf(tx.amount());
                if ("DEPOSIT".equals(tx.txType()) || ("TRANSFER".equals(tx.txType()) && tx.receiverAccount() != null
                        && tx.receiverAccount() == accountNumber)) {
                    amountStr = "+" + amountStr;
                } else {
                    amountStr = "-" + amountStr;
                }

                String type = tx.txType() != null ? tx.txType() : "";
                String status = "Completed";

                writer.println(date + "," + description + "," + amountStr + "," + type + "," + status);
            }
        } catch (Exception e) {
            log.severe("Error generating CSV: " + e.getMessage());
        }
    }
}
