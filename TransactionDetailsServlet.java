package concer;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransactionDetailsServlet")

public class TransactionDetailsServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve Payment ID from the request
        String paymentId = request.getParameter("payment_id");
        
        // Check if Payment ID is provided
        if (paymentId == null || paymentId.trim().isEmpty()) {
            request.setAttribute("error", "Payment ID is required!");
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
            return;
        }

        // Update the transaction status and date
        String updateTransactionStatusSql = "UPDATE transaction_details SET transaction_status = 'Success', transaction_date = NOW() WHERE payment_id = ?";
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");
             PreparedStatement psUpdate = con.prepareStatement(updateTransactionStatusSql)) {
            
            psUpdate.setString(1, paymentId);  // Set the payment_id parameter for the update query
            int rowsAffected = psUpdate.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Transaction status updated to 'Success' for Payment ID: " + paymentId);
            } else {
                System.out.println("No matching transaction found for Payment ID: " + paymentId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating the transaction status.");
        }

        // Retrieve Payment and Transaction Details from the database
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");
            
            // SQL query to fetch payment and transaction details
            String sql = "SELECT p.payment_id, p.booking_id, p.payment_mode, p.amount, p.upi_id, p.bank_account, p.payment_status, p.payment_date, " +
                         "       t.transaction_status, t.transaction_date " +
                         "FROM payment_details p " +
                         "LEFT JOIN transaction_details t ON p.payment_id = t.payment_id " +
                         "WHERE p.payment_id = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, paymentId); // Set the payment_id parameter
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                // Retrieve data from the result set and set attributes for the JSP page
                request.setAttribute("paymentId", rs.getString("payment_id"));
                request.setAttribute("bookingId", rs.getString("booking_id"));
                request.setAttribute("paymentMode", rs.getString("payment_mode"));
                request.setAttribute("amount", rs.getDouble("amount"));
                request.setAttribute("upi", rs.getString("upi_id"));
                request.setAttribute("bankAmount", rs.getDouble("bank_account"));
                request.setAttribute("transactionStatus", rs.getString("transaction_status"));
                request.setAttribute("transactionDate", rs.getString("transaction_date"));
            } else {
                // If no data is found, set error message
                request.setAttribute("error", "No details found for the provided Payment ID.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while retrieving the data.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward to the JSP page to display the results
        request.getRequestDispatcher("transaction.jsp").forward(request, response);
    }
}
