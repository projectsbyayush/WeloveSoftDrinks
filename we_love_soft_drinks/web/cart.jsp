<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - WeLoveSoftDrinks</title>
    <meta name="description" content="Review your WeLoveSoftDrinks cart before checkout." />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="theme-color" content="#3d1421" />
    <link rel="icon" type="image/png" href="Assets/logo.png" />
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="section">
        <p class="eyebrow">Your Selection</p>
        <h2>The <em>Cart</em></h2>
        <p class="subtitle">Review your bottles before checkout</p>

        <%
            // Login needed to see cart (cart rows belong to a user)
            String cartUser = (String) session.getAttribute("user");
            if (cartUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Read MY cart rows from database
            List<CartItem> cart = new ArrayList<CartItem>();
            try {
                java.sql.Connection conn = utils.connection.takeconnection();
                java.sql.PreparedStatement ps = conn.prepareStatement(
                    "SELECT product, price, image, qty FROM cart_items WHERE user_login = ?");
                ps.setString(1, cartUser);
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
                <h3>Your cart is empty</h3>
                <p style="color:grey; margin:0.5rem 0 1.5rem;">Browse the collection and add some bottles.</p>
                <a href="shop.jsp" class="btn btn-dark">Explore Collection</a>
            </div>
        <%
            } else {
                int grandTotal = 0;
                for (CartItem item : cart) grandTotal += item.getTotal();
        %>
            <table class="cart-table">
                <tr>
                    <th style="text-align:left;">Bottle</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Total</th>
                    <th></th>
                </tr>
                <% for (CartItem item : cart) { %>
                <tr>
                    <td>
                        <div class="item-cell">
                            <img class="cart-thumb" src="Assets/drinks/<%= item.getImage() %>" alt="<%= item.getName() %>" />
                            <b><%= item.getName() %></b>
                        </div>
                    </td>
                    <td>₹<%= item.getPrice() %></td>
                    <td><%= item.getQty() %></td>
                    <td><b>₹<%= item.getTotal() %></b></td>
                    <td>
                        <form action="cart" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="name" value="<%= item.getName() %>">
                            <button type="submit" class="link-btn">Remove</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>

            <div class="cart-total">
                <h3>Total: ₹<%= grandTotal %></h3>
                <div style="display:flex; gap:0.8rem;">
                    <a href="cart?action=clear" class="btn btn-outline">Clear Cart</a>
                    <a href="checkout.jsp" class="btn btn-gold">Proceed to Checkout</a>
                </div>
            </div>
        <%
            }
        %>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
