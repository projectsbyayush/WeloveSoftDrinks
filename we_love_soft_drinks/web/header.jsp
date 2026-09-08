<%-- header.jsp : announcement bar + navbar, used on all pages. Include with: <jsp:include page="header.jsp" /> --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get logged-in user (null if not logged in)
    String loggedUser = (String) session.getAttribute("user");

    // Count MY items in cart (from database table cart_items)
    int cartCount = 0;
    if (loggedUser != null) {
        try {
            java.sql.Connection _conn = utils.connection.takeconnection();
            java.sql.PreparedStatement _ps = _conn.prepareStatement(
                "SELECT SUM(qty) FROM cart_items WHERE user_login = ?");
            _ps.setString(1, loggedUser);
            java.sql.ResultSet _rs = _ps.executeQuery();
            if (_rs.next()) cartCount = _rs.getInt(1);
            _rs.close();
            _ps.close();
            _conn.close();
        } catch (Exception e) {
            cartCount = 0; // DB down -> just show no badge
        }
    }
%>
<div class="announce">Complimentary delivery on orders above Rs. 499</div>
<nav class="navbar">
    <a href="index.jsp" class="logo">
        <span class="logo-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 5h16l-8 8.5L4 5z"/><path d="M12 13.5V20"/><path d="M8.5 20h7"/></svg></span>
        WeLove<span>SoftDrinks</span>
    </a>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="shop.jsp">Collection</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="nav-right">
        <a href="cart.jsp" class="cart-btn" title="View cart">
            <!-- shopping bag icon -->
            <svg fill="none" viewBox="0 0 24 24" stroke-width="1.6" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007z" />
            </svg>
            <% if (cartCount > 0) { %>
                <span class="cart-count"><%= cartCount %></span>
            <% } %>
        </a>

        <% if (loggedUser == null) { %>
            <a href="login.jsp" class="btn btn-dark">Login</a>
        <% } else { %>
            <span class="user-name">Hi, <%= loggedUser %></span>
            <a href="logout" class="btn btn-outline">Logout</a>
        <% } %>
    </div>
</nav>
