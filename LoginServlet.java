 package concer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("txtName");
        String password = request.getParameter("txtpassword");

        // Validate inputs
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
        }
                  PrintWriter out = response.getWriter();
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/shiva2", "root", "2004");
             PreparedStatement ps = con.prepareStatement("SELECT uname FROM login WHERE uname=? AND password=?")) {

            ps.setString(1, username);
            ps.setString(2, password); // Remember to hash the password in a real application

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Create a session for the user
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                    rd.forward(request, response);
                } else {
                	out.println("<font color size=19>login failed!!!<br>");
                	 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging this instead
            request.setAttribute("errorMessage", "Database error occurred.");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        }
    }
}