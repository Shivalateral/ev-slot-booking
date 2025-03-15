 package concer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewSlotBookingServlet")
public class ViewSlotBookingServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Adding CSS styles
        out.println("<style>");
        out.println("body {font-family: Arial, sans-serif; background-color: green; margin: 0; padding: 0; height: 100vh; display: flex; justify-content: center; align-items: center;}");
        out.println(".container {width: 90%; max-width: 800px; background-color: orange; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); text-align: center;}");
        out.println("h2 {color: #333;}");
        out.println("ul {list-style-type: none; padding: 0;}");
        out.println("li {background-color: #f9f9f9; margin: 5px 0; padding: 10px; border: 1px solid #ddd; border-radius: 5px;}");
        out.println("h3 {color: red;}");
        out.println("button {padding: 10px 20px; font-size: 16px; background-color:yellow ; color: white; border: none; border-radius: 5px; cursor: pointer; margin-top: 10px;}");
        out.println("button:hover {background-color: red;}");
        out.println("</style>");

        out.println("<div class='container'>");

        // Retrieving bookingId and phone from the request
        String bookingId = request.getParameter("bookingId");
        String phone = request.getParameter("phone");

        if (bookingId == null || phone == null || bookingId.isEmpty() || phone.isEmpty()) {
            out.println("<h3>Booking ID and Phone number are required!</h3>");
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");

            // Query to retrieve booking details
            String query = "SELECT * FROM BookingDetails WHERE booking_id = ? AND phone = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, bookingId);
            ps.setString(2, phone);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Booking details found, display them
                out.println("<h2>Booking Details</h2>");
                out.println("<ul>");
                out.println("<li>Booking ID: " + rs.getString("booking_id") + "</li>");
                out.println("<li>Name: " + rs.getString("name") + "</li>");
                out.println("<li>Phone: " + rs.getString("phone") + "</li>");
                out.println("<li>Location: " + rs.getString("location") + "</li>");
                out.println("<li>Slot Time: " + rs.getString("slot_time") + "</li>");
                out.println("</ul>");

                // Add button to proceed to transaction or dashboard
                out.println("<form action='payment.jsp' method='get'>");
                out.println("<button type='submit'>Proceed to payment</button>");
                out.println("</form>");
                out.println("<form action='dashboard.jsp' method='get'>");
                out.println("<button type='submit'>Go to Dashboard</button>");
                out.println("</form>");
            } else {
                // No booking found
                out.println("<h3>No booking found for the given ID and phone number.</h3>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.println("</div>");
            out.close();
        }
    }
}
