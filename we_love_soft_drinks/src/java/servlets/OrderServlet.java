package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.connection;

// URL: /placeorder (checkout.jsp address form posts here)
// Steps:
//   1. Read MY cart rows from cart_items
//   2. Insert one row in "orders" (who + address + total)
//   3. Copy each cart row into "order_items" (linked by order id)
//   4. Delete MY cart rows (cart becomes empty)
//   5. Go to checkout.jsp?ordered=yes (success screen)
@WebServlet("/placeorder")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Make sure order tables exist (in case database.sql was never run)
        connection.ensureTables();

        try {
            Connection conn = connection.takeconnection();

            // 1. Read my cart + calculate total
            String sql = "SELECT product, price, qty FROM cart_items WHERE user_login = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();

            // Save rows in memory (small cart, easy to understand)
            java.util.List<String> products = new java.util.ArrayList<String>();
            java.util.List<Integer> prices = new java.util.ArrayList<Integer>();
            java.util.List<Integer> qtys = new java.util.ArrayList<Integer>();
            int total = 0;

            while (rs.next()) {
                products.add(rs.getString("product"));
                prices.add(rs.getInt("price"));
                qtys.add(rs.getInt("qty"));
                total += rs.getInt("price") * rs.getInt("qty");
            }
            rs.close();
            ps.close();

            // Empty cart -> nothing to order
            if (products.isEmpty()) {
                conn.close();
                response.sendRedirect("cart.jsp");
                return;
            }

            // 2. Insert order, get its auto-generated id
            String orderSql = "INSERT INTO orders (user_login, name, phone, address, total) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement orderPs = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            orderPs.setString(1, user);
            orderPs.setString(2, name);
            orderPs.setString(3, phone);
            orderPs.setString(4, address);
            orderPs.setInt(5, total);
            orderPs.executeUpdate();

            ResultSet keys = orderPs.getGeneratedKeys();
            keys.next();
            int orderId = keys.getInt(1);
            keys.close();
            orderPs.close();

            // 3. Copy each cart item into order_items
            String itemSql = "INSERT INTO order_items (order_id, product, price, qty) VALUES (?, ?, ?, ?)";
            PreparedStatement itemPs = conn.prepareStatement(itemSql);
            for (int i = 0; i < products.size(); i++) {
                itemPs.setInt(1, orderId);
                itemPs.setString(2, products.get(i));
                itemPs.setInt(3, prices.get(i));
                itemPs.setInt(4, qtys.get(i));
                itemPs.executeUpdate();
            }
            itemPs.close();

            // 4. Empty my cart
            String clearSql = "DELETE FROM cart_items WHERE user_login = ?";
            PreparedStatement clearPs = conn.prepareStatement(clearSql);
            clearPs.setString(1, user);
            clearPs.executeUpdate();
            clearPs.close();

            conn.close();

            // 5. Show success screen
            response.sendRedirect("checkout.jsp?ordered=yes");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("cart.jsp");
    }
}
