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

// Cart is now stored in the DATABASE table "cart_items".
// Every row has user_login, so each user only sees their own cart.
// You can open phpMyAdmin -> cart_items to see the rows.
//
// URLs:
//   /cart?action=add & name & price & qty & image  -> add item
//   /cart?action=remove & name                     -> remove item
//   /cart?action=clear                             -> empty my cart
// Guests (not logged in) are sent to login first.
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Who is logged in? Cart belongs to this user.
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "add";

        // Make sure cart tables exist (in case database.sql was never run)
        connection.ensureTables();

        try {
            Connection conn = connection.takeconnection();

            if (action.equals("add")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int qty = 1;
                try {
                    qty = Integer.parseInt(request.getParameter("qty"));
                } catch (Exception e) {
                    qty = 1; // default 1 if empty
                }
                String image = request.getParameter("image");
                if (image == null || image.trim().isEmpty()) {
                    image = "margarita.jpg";
                }

                // Is this product already in MY cart?
                String check = "SELECT qty FROM cart_items WHERE user_login = ? AND product = ?";
                PreparedStatement ps = conn.prepareStatement(check);
                ps.setString(1, user);
                ps.setString(2, name);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Yes -> just increase qty
                    int newQty = rs.getInt("qty") + qty;
                    rs.close();
                    ps.close();
                    String update = "UPDATE cart_items SET qty = ? WHERE user_login = ? AND product = ?";
                    ps = conn.prepareStatement(update);
                    ps.setInt(1, newQty);
                    ps.setString(2, user);
                    ps.setString(3, name);
                    ps.executeUpdate();
                } else {
                    // No -> insert new row
                    rs.close();
                    ps.close();
                    String insert = "INSERT INTO cart_items (user_login, product, price, image, qty) VALUES (?, ?, ?, ?, ?)";
                    ps = conn.prepareStatement(insert);
                    ps.setString(1, user);
                    ps.setString(2, name);
                    ps.setInt(3, price);
                    ps.setString(4, image);
                    ps.setInt(5, qty);
                    ps.executeUpdate();
                }
                ps.close();

            } else if (action.equals("remove")) {
                String name = request.getParameter("name");
                String sql = "DELETE FROM cart_items WHERE user_login = ? AND product = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ps.setString(2, name);
                ps.executeUpdate();
                ps.close();

            } else if (action.equals("clear")) {
                String sql = "DELETE FROM cart_items WHERE user_login = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ps.executeUpdate();
                ps.close();
            }

            conn.close();
            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp");
        }
    }

    // Allow GET also (for remove/clear links)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
