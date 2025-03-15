package concer;

 
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CancelBookingServlet
 */
 
@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("booking_id");

        if (bookingId == null || bookingId.trim().isEmpty()) {
            request.setAttribute("error", "Booking ID is required!");
            request.getRequestDispatcher("cancelBooking.jsp").forward(request, response);
            return;
        }

        // JDBC code to cancel the booking by deleting the record
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");
             PreparedStatement ps = con.prepareStatement("DELETE FROM bookingdetails WHERE booking_id = ?")) {

            ps.setString(1, bookingId);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Booking cancelled successfully.");
            } else {
                request.setAttribute("error", "No booking found with the provided ID.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while cancelling the booking.");
        }

        // Forward to the JSP page to display result
        request.getRequestDispatcher("cancelBooking.jsp").forward(request, response);
    }
}


