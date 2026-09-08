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

import utils.connection;

// URL: /register  (form in register.jsp posts here)
@WebServlet("/register")
public class register extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // These names MUST match the "name" in register.jsp inputs
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        try {
            // 1. Check empty
            if (email == null || email.trim().isEmpty()
                    || password == null || password.isEmpty()) {
                request.setAttribute("errorMessage", "Please fill all fields!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // 2. Check password match
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            Connection conn = connection.takeconnection();

            if (conn == null) {
                request.setAttribute("errorMessage", "Database not connected.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // 3. Check if user already exists
            String sql = "SELECT * FROM users WHERE login = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email.trim());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("errorMessage", "User already exists! Please login.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                rs.close();
                ps.close();
                conn.close();
                return;
            }
            rs.close();
            ps.close();

            // 4. Insert new user
            sql = "INSERT INTO users (login, password) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email.trim());
            ps.setString(2, password);
            ps.executeUpdate();

            ps.close();
            conn.close();

            // 5. Success -> go to login page with message
            request.setAttribute("successMessage", "Account created! Please login now.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration Failed: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // If someone opens /register directly, show register page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
