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

// URL: /login  (form in login.jsp posts here)
@WebServlet("/login")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // These names MUST match the "name" in login.jsp inputs
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic empty check
        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Please enter email and password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
            Connection conn = connection.takeconnection();

            if (conn == null) {
                request.setAttribute("errorMessage", "Database not connected.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Check if user exists
            String sql = "SELECT * FROM users WHERE login = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email.trim());
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login OK -> save user in session and go to home
                HttpSession session = request.getSession();
                session.setAttribute("user", email.trim());
                response.sendRedirect("index.jsp");
            } else {
                // Login failed -> show message on same page
                request.setAttribute("errorMessage", "Invalid email or password!");
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

    // If someone opens /login directly, show login page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
