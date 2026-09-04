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

@WebServlet("/register")
public class register extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        try {

            // Check password
            if (!password.equals(confirmPassword)) {

                request.setAttribute("errorMessage",
                        "Passwords do not match!");

                request.getRequestDispatcher("register.jsp")
                       .forward(request, response);

                return;
            }

            Connection conn = connection.takeconnection();

            // Check if login already exists
            String sql = "SELECT * FROM users WHERE login = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, login);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute("errorMessage",
                        "User already exists!");

                request.getRequestDispatcher("register.jsp")
                       .forward(request, response);

                return;
            }

            // Insert user
            sql = "INSERT INTO users (login, password) VALUES (?, ?)";

            ps = conn.prepareStatement(sql);

            ps.setString(1, login);
            ps.setString(2, password);

            ps.executeUpdate();

            // Send success message back to same JSP
            request.setAttribute("successMessage",
                    "Registration Successful!");

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);

            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("errorMessage",
                    "Registration Failed: " + e.getMessage());

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
        }
    }
}