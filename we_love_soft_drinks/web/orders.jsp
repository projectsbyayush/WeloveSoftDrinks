<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - WeLoveSoftDrinks</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="section">
        <%
            String user = (String) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <p class="eyebrow">Order History</p>
        <h2>My <em>Orders</em></h2>
        <p class="subtitle">Every order you have placed, newest first</p>

        <%
            // Read MY orders from database (newest first)
            java.util.List<Integer> orderIds = new java.util.ArrayList<Integer>();
            java.util.List<Integer> orderTotals = new java.util.ArrayList<Integer>();
            java.util.List<String> orderDates = new java.util.ArrayList<String>();
            try {
                java.sql.Connection conn = utils.connection.takeconnection();
                java.sql.PreparedStatement ps = conn.prepareStatement(
                    "SELECT id, total, created_at FROM orders WHERE user_login = ? ORDER BY id DESC");
                ps.setString(1, user);
                java.sql.ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    orderIds.add(rs.getInt("id"));
                    orderTotals.add(rs.getInt("total"));
                    orderDates.add(rs.getString("created_at"));
                }
                rs.close();
                ps.close();

                if (orderIds.isEmpty()) {
        %>
            <div class="empty">
                <div class="empty-icon">
                    <svg fill="none" viewBox="0 0 24 24" stroke-width="1.4" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007z" />
                    </svg>
                </div>
                <h3>No orders yet</h3>
                <p style="color:grey; margin:0.5rem 0 1.5rem;">Your placed orders will appear here.</p>
                <a href="shop.jsp" class="btn btn-dark">Explore Collection</a>
            </div>
        <%
                } else {
                    // One bill card per order
                    for (int i = 0; i < orderIds.size(); i++) {
                        int orderId = orderIds.get(i);
        %>
            <div class="auth-box" style="max-width:100%; text-align:left; margin-bottom:1.2rem;">
                <p style="display:flex; justify-content:space-between; margin-bottom:1rem;">
                    <b>Order #<%= orderId %></b>
                    <span style="color:grey; font-size:0.85rem;"><%= orderDates.get(i) %></span>
                </p>
                <%
                    // Items inside this order
                    java.sql.PreparedStatement ips = conn.prepareStatement(
                        "SELECT product, price, qty FROM order_items WHERE order_id = ?");
                    ips.setInt(1, orderId);
                    java.sql.ResultSet irs = ips.executeQuery();
                    while (irs.next()) {
                %>
                    <div class="bill-row">
                        <span><%= irs.getString("product") %> × <%= irs.getInt("qty") %></span>
                        <b>₹<%= irs.getInt("price") * irs.getInt("qty") %></b>
                    </div>
                <%
                    }
                    irs.close();
                    ips.close();
                %>
                <hr><br>
                <p style="display:flex; justify-content:space-between; font-size:1.15rem;">
                    <span>Total paid</span>
                    <b style="color:#d63a54;">₹<%= orderTotals.get(i) %></b>
                </p>
            </div>
        <%
                    }
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <div class="message error">Could not load orders.</div>
        <%
            }
        %>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
