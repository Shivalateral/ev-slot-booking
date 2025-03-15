package concer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
@WebServlet("/TransactionServlet")
 

public class TransactionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get the form data from the request
        String bookingId = request.getParameter("bookingId");
        String paymentMode = request.getParameter("paymentMode");
        String amount = request.getParameter("amount");
        
        // Optional fields based on the payment method
        String upiId = request.getParameter("upiId");
        String bankAccount = request.getParameter("bankAccount");
        
        // Validate inputs
        if (bookingId == null || bookingId.isEmpty() || amount == null || amount.isEmpty()) {
            out.println("<p class='error'>Booking ID and Amount are required.</p>");
            return;
        }

        // Payment status (Assuming it's a successful payment for now)
        String paymentStatus = "Success";

        // Database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");

            // Insert booking into the database
            String query = "INSERT INTO  payment_details (booking_id, payment_mode, amount, upi_id, bank_account, payment_status) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, bookingId);
                stmt.setString(2, paymentMode);
                stmt.setBigDecimal(3, new java.math.BigDecimal(amount));

                if ("UPI".equals(paymentMode)) {
                    stmt.setString(4, upiId);
                    stmt.setNull(5, Types.VARCHAR);
                } else if ("Bank Transfer".equals(paymentMode)) {
                    stmt.setNull(4, Types.VARCHAR);
                    stmt.setString(5, bankAccount);
                } else {
                    stmt.setNull(4, Types.VARCHAR);
                    stmt.setNull(5, Types.VARCHAR);
                }

                stmt.setString(6, paymentStatus);
                int rowsInserted = stmt.executeUpdate();

                if (rowsInserted > 0) {
                	out.println("<!DOCTYPE html>");
                	out.println("<html lang='en'>");
                	out.println("<head>");
                	out.println("<meta charset='UTF-8'>");
                	out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                	out.println("<title>Payment Status</title>");
                	out.println("<style>");
                	out.println("body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; background: linear-gradient(to right, #4facfe, #00f2fe); color: #333; }");
                	out.println(".container { background: #fff; padding: 2rem; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); text-align: center; width: 90%; max-width: 600px; }");
                	out.println("h3 { color: #2ecc71; margin-bottom: 1rem; }");
                	out.println("p { font-size: 1rem; margin: 0.5rem 0; }");
                	out.println("form { margin-top: 1rem; }");

                	/* Button base styling */
                	out.println("button { ");
                	out.println("    background-color: #007bff; color: white; border: none; padding: 0.75rem 1.5rem; border-radius: 5px; cursor: pointer; font-size: 1rem;");
                	out.println("    transition: background-color 0.3s ease, transform 0.2s ease; position: relative; overflow: hidden; }");

                	/* Hover effect */
                	out.println("button:hover { background-color: #0056b3; }");

                	/* Click effect */
                	out.println("button:active { background-color: #004080; transform: scale(0.98); }");

                	/* Motion effect: Wave animation */
                	out.println("button::before { ");
                	out.println("    content: ''; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%) scale(0);");
                	out.println("    width: 300%; height: 300%; background: rgba(255, 255, 255, 0.5);");
                	out.println("    border-radius: 50%; transition: transform 0.6s ease; pointer-events: none; }");
                	out.println("button:active::before { transform: translate(-50%, -50%) scale(1); }");

                	out.println(".error { color: #e74c3c; font-weight: bold; }");
                	out.println("</style>");
                	out.println("</head>");
                	out.println("<body>");
                	out.println("<div class='container'>");
                	out.println("<h3>Payment Processed Successfully</h3>");
                	out.println("<p>Booking ID: " + bookingId + "</p>");
                	out.println("<p>Payment Mode: " + paymentMode + "</p>");
                	out.println("<p>Amount Paid: " + amount + "</p>");
                	out.println("<p>Status: " + paymentStatus + "</p>");
                	   out.println("<form action='dashboard.jsp' method='get'>");
                       out.println("<button type='submit'>Go to Dashboard</button>");
                       out.println("</form>");
                	out.println("<form action='CancelBookingServlet' method='post'>");
                	out.println("<input type='hidden' name='bookingId' value='" + bookingId + "'>");
                	out.println("<button type='submit'>Cancel Booking</button>");
                	out.println("</form>");
                	out.println("</div>");
                	out.println("</body>");
                	out.println("</html>");

                    
                } else {
                    out.println("<p class='error'>Failed to process payment.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p class='error'>Database error occurred.</p>");
            } finally {
                // Close the connection (always)
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p class='error'>Database driver not found.</p>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p class='error'>Database connection error.</p>");
        }
    }

    @Override
    public void init() throws ServletException {
        // Initialization code, if any
    }

    @Override
    public void destroy() {
        // Cleanup code, if any
    }
}

