package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.connection;

@WebServlet("/login")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // DEBUG: Print to see what's being submitted
        System.out.println("=== LOGIN ATTEMPT ===");
        System.out.println("Username from form: '" + username + "'");
        System.out.println("Password from form: '" + password + "'");

        try {
            Connection conn = connection.takeconnection();

            // Check if user exists (using 'login' column from your database)
            String sql = "SELECT * FROM users WHERE login = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful
                System.out.println("Login SUCCESS for: " + username);
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                response.sendRedirect("dashboard.jsp");
            } else {
                // Login failed
                System.out.println("Login FAILED for: " + username);
                request.setAttribute("errorMessage", "Invalid username or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Login Failed: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}