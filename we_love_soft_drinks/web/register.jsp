<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - WeLoveSoftDrinks</title>
    <meta name="description" content="Create a WeLoveSoftDrinks account and get chilled premium beverages delivered." />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="theme-color" content="#3d1421" />
    <link rel="icon" type="image/png" href="Assets/logo.png" />
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body class="dark-page">

    <jsp:include page="header.jsp" />

    <div class="auth-wrap">
        <div class="auth-box">
            <span class="auth-logo-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 5h16l-8 8.5L4 5z"/><path d="M12 13.5V20"/><path d="M8.5 20h7"/></svg></span>
            <h1>Join the Club</h1>
            <p>Create an account or <a href="login.jsp">sign in</a></p>

            <%-- Show messages from register servlet --%>
            <%
                String successMessage = (String) request.getAttribute("successMessage");
                if (successMessage != null) {
            %>
                <div class="message success"><%= successMessage %></div>
            <%
                }
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="message error"><%= errorMessage %></div>
            <%
                }
            %>

            <!-- Posts to /register servlet -->
            <form action="register" method="post">
                <input type="email" name="email" placeholder="Email address" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="confirm-password" placeholder="Confirm password" required>
                <button type="submit">Create Account</button>
            </form>

            <p style="margin-top:1rem; font-size:0.85rem;">
                <a href="index.jsp">Back to Home</a>
            </p>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
