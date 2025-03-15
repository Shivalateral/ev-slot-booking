package concer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("txtName");
        String password = request.getParameter("txtpassword");

        // Basic validation: Check if username and password are not empty
        if (uname == null || password == null || uname.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill all the fields.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        // Store user details in database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004")) {
            String query = "INSERT INTO login (uname, password) VALUES (?, ?)";
            try (PreparedStatement pst = conn.prepareStatement(query)) {
                pst.setString(1, uname);
                pst.setString(2, password);  // Consider hashing the password for security reasons
                int result = pst.executeUpdate();
                
                if (result > 0) {
                    response.sendRedirect("Login.jsp");
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("registration.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error. Please try again later.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }
}
