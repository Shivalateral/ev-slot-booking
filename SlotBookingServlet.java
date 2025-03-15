package concer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SlotBookingServlet")
public class SlotBookingServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        try {
            if ("getOtp".equals(action)) {
                // OTP Generation
                String phone = request.getParameter("phone");
                if (phone == null || phone.isEmpty()) {
                    out.println("<h3 style='color:red;'>Phone number is required!</h3>");
                    return;
                }

                // Generate a 6-digit OTP
                Random random = new Random();
                String otp = String.valueOf(100000 + random.nextInt(900000));

                // Save OTP and phone number in session
                session.setAttribute("otp", otp);
                session.setAttribute("phone", phone);

                out.println("<h3>OTP has been sent to your phone: " + phone + "</h3>");
                out.println("<p>(For testing, your OTP is: " + otp + ")</p>"); // Displayed for testing

            } else if ("bookSlot".equals(action)) {
                // Booking Details
                String bookingId = request.getParameter("bookingId");
                String name = request.getParameter("name");
                String phone = (String) session.getAttribute("phone");
                String otp = request.getParameter("otp");
                String sessionOtp = (String) session.getAttribute("otp");
                String location = request.getParameter("location");
                String slotTime = request.getParameter("slotTime");

                if (!otp.equals(sessionOtp)) {
                    out.println("<h3 style='color:red;'>Invalid OTP. Please try again!</h3>");
                    return;
                }

                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");

                // Insert booking into the database
                String query = "INSERT INTO BookingDetails (booking_id, name, phone, otp, location, slot_time) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, bookingId);
                ps.setString(2, name);
                ps.setString(3, phone);
                ps.setString(4, otp);
                ps.setString(5, location);
                ps.setString(6, slotTime);

                int result = ps.executeUpdate();
                if (result > 0) {
                    out.println("<h3 style='color:green;'>Slot booked successfully!</h3>");
                    out.println("<p>Your booking details:</p>");
                    out.println("<ul>");
                    out.println("<li>Booking ID: " + bookingId + "</li>");
                    out.println("<li>Name: " + name + "</li>");
                    out.println("<li>Phone: " + phone + "</li>");
                    out.println("<li>Location: " + location + "</li>");
                    out.println("<li>Slot Time: " + slotTime + "</li>");
                    out.println("</ul>");

                    // Buttons for navigation
                    out.println("<form action='dashboard.jsp' method='get'>");
                    out.println("<button type='submit'>Go to Dashboard</button>");
                    out.println("</form>");
                    out.println("<form action='exit.jsp' method='get'>");
                    out.println("<button type='submit'>Exit</button>");
                    out.println("</form>");
                } else {
                    out.println("<h3 style='color:red;'>Failed to book slot. Try again later.</h3>");
                }

                conn.close();
            } else if ("getLocations".equals(action)) {
                // Fetch fixed locations from the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");

                String query = "SELECT location_name FROM Locations"; // Assuming Locations table stores location names
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                // Send the locations as a list to the client-side
                List<String> locations = new ArrayList<>();
                while (rs.next()) {
                    locations.add(rs.getString("location_name"));
                }

                // Debugging print statement
                System.out.println("Fetched locations: " + locations);

                // Set locations in request
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("/slotbooking.jsp").forward(request, response); // Forward to JSP

                conn.close();
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace for debugging
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }

    // Helper method for database connection
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");
    }
}


