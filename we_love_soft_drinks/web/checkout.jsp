<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - WeLoveSoftDrinks</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="section">
        <p class="eyebrow">Almost Yours</p>
        <h2><em>Checkout</em></h2>
        <p class="subtitle">Enter your address to place the order</p>

        <%
            String user = (String) session.getAttribute("user");

            // Case 1: Just ordered (OrderServlet redirects here after saving order)
            String ordered = request.getParameter("ordered");
            if (ordered != null && ordered.equals("yes")) {
        %>
            <div class="empty">
                <div class="success-ring">
                    <svg fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                    </svg>
                </div>
                <h3>Order confirmed</h3>
                <p style="color:grey; margin:0.5rem 0 1.5rem;">Your bottles will arrive chilled in about 30 minutes.</p>
                <div style="display:flex; gap:0.8rem; justify-content:center;">
                    <a href="orders.jsp" class="btn btn-dark">View My Orders</a>
                    <a href="shop.jsp" class="btn btn-gold">Order More</a>
                </div>
            </div>
        <%
            }
            // Case 2: Must login first
            else if (user == null) {
        %>
            <div class="empty">
                <div class="empty-icon">
                    <svg fill="none" viewBox="0 0 24 24" stroke-width="1.4" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
                    </svg>
                </div>
                <h3>Members checkout</h3>
                <p style="color:grey; margin:0.5rem 0 1.5rem;">Please login to place your order.</p>
                <a href="login.jsp" class="btn btn-dark">Login Now</a>
            </div>
        <%
            } else {
                // Case 3: Read MY cart rows from database
                List<CartItem> cart = new ArrayList<CartItem>();
                try {
                    java.sql.Connection conn = utils.connection.takeconnection();
                    java.sql.PreparedStatement ps = conn.prepareStatement(
                        "SELECT product, price, image, qty FROM cart_items WHERE user_login = ?");
                    ps.setString(1, user);
                    java.sql.ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        cart.add(new CartItem(
                            rs.getString("product"),
                            rs.getInt("price"),
                            rs.getInt("qty"),
                            rs.getString("image")));
                    }
                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (cart.isEmpty()) {
        %>
            <div class="empty">
                <div class="empty-icon">
                    <svg fill="none" viewBox="0 0 24 24" stroke-width="1.4" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007z" />
                    </svg>
                </div>
                <h3>Nothing to checkout</h3>
                <p style="color:grey; margin:0.5rem 0 1.5rem;">Your cart is empty.</p>
                <a href="shop.jsp" class="btn btn-dark">Explore Collection</a>
            </div>
        <%
                } else {
                    int grandTotal = 0;
                    for (CartItem item : cart) grandTotal += item.getTotal();
        %>
            <div class="checkout-grid">
                <!-- Address form -> OrderServlet saves order in database -->
                <div class="auth-box" style="max-width:100%; text-align:left;">
                    <h3>Delivery Address</h3>
                    <br>
                    <form action="placeorder" method="post">
                        <input type="text" name="name" placeholder="Full name" required>
                        <input type="text" name="phone" placeholder="Phone number" required>
                        <input type="text" name="address" placeholder="Full address" required>
                        <button type="submit">Place Order · ₹<%= grandTotal %></button>
                    </form>
                </div>

                <!-- Bill -->
                <div class="auth-box" style="max-width:100%; text-align:left;">
                    <h3>Order Summary</h3>
                    <br>
                    <% for (CartItem item : cart) { %>
                        <div class="bill-row">
                            <img src="Assets/drinks/<%= item.getImage() %>" alt="<%= item.getName() %>" />
                            <span><%= item.getName() %> × <%= item.getQty() %></span>
                            <b>₹<%= item.getTotal() %></b>
                        </div>
                    <% } %>
                    <hr><br>
                    <p style="display:flex; justify-content:space-between; font-size:1.2rem;">
                        <span>Total</span>
                        <b style="color:#d63a54;">₹<%= grandTotal %></b>
                    </p>
                    <p style="color:grey; font-size:0.85rem; margin-top:0.5rem;">Ordering as: <%= user %></p>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
