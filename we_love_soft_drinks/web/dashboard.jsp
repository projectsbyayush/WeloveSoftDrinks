<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - WeLoveSoftDrinks</title>
    <meta name="description" content="Your WeLoveSoftDrinks members area — shop, cart and orders." />
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
        <%
            String user = (String) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <p class="eyebrow">Members Area</p>
        <h2>Welcome, <em><%= user %></em></h2>
        <p class="subtitle">Your cellar awaits — what shall it be today?</p>

        <div class="dash-cards">
            <div class="dash-card">
                <img src="Assets/drinks/mango-mojito.jpg" alt="Shop collection" />
                <div class="pad">
                    <h3>The Collection</h3>
                    <p>Browse all eight signature pours.</p>
                    <a href="shop.jsp" class="btn btn-dark">Shop Now</a>
                </div>
            </div>
            <div class="dash-card">
                <img src="Assets/drinks/hero-tonic.jpg" alt="My cart" />
                <div class="pad">
                    <h3>My Cart</h3>
                    <p>Review your bottles and checkout.</p>
                    <a href="cart.jsp" class="btn btn-dark">View Cart</a>
                </div>
            </div>
            <div class="dash-card">
                <img src="Assets/drinks/mint-mojito.jpg" alt="Logout" />
                <div class="pad">
                    <h3>My Orders</h3>
                    <p>See everything you ordered.</p>
                    <a href="orders.jsp" class="btn btn-dark">View Orders</a>
                </div>
            </div>
            <div class="dash-card">
                <img src="Assets/drinks/lemonade.jpg" alt="Logout" />
                <div class="pad">
                    <h3>Sign Out</h3>
                    <p>Until the next pour.</p>
                    <a href="logout" class="btn btn-outline">Logout</a>
                </div>
            </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
