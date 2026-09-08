<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Collection - WeLoveSoftDrinks</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="section">
        <p class="eyebrow">The Full Menu</p>
        <h2>Our <em>Collection</em></h2>
        <p class="subtitle">Eight signature pours — mixers, sparkling coolers and zero-alcohol brews</p>

        <div class="products">

            <%-- To add a new drink: copy one "card" block and change photo, name, price.
                 Put the new photo file inside web/Assets/drinks/ --%>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/margarita.jpg" alt="Margarita Mixer" />
                    <span class="tag">Bestseller</span>
                </div>
                <div class="card-body">
                    <p class="card-cat">Cocktail Mixer</p>
                    <h3>Margarita</h3>
                    <p class="desc">Lemon, lime, chilli &amp; agave</p>
                    <div class="card-row">
                        <span class="price">₹149</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Margarita Mixer">
                            <input type="hidden" name="price" value="149">
                            <input type="hidden" name="image" value="margarita.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/mango-mojito.jpg" alt="Mango Chilli Mojito" />
                    <span class="tag">Bestseller</span>
                </div>
                <div class="card-body">
                    <p class="card-cat">Cocktail Mixer</p>
                    <h3>Mango Chilli Mojito</h3>
                    <p class="desc">Mango, red chilli &amp; mint</p>
                    <div class="card-row">
                        <span class="price">₹149</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Mango Chilli Mojito">
                            <input type="hidden" name="price" value="149">
                            <input type="hidden" name="image" value="mango-mojito.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/cosmo.jpg" alt="Cosmopolitan" />
                </div>
                <div class="card-body">
                    <p class="card-cat">Cocktail Mixer</p>
                    <h3>Cosmopolitan</h3>
                    <p class="desc">Cranberry, lemon &amp; orange</p>
                    <div class="card-row">
                        <span class="price">₹149</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Cosmopolitan">
                            <input type="hidden" name="price" value="149">
                            <input type="hidden" name="image" value="cosmo.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/whiskey-sour.jpg" alt="Whiskey Sour" />
                    <span class="tag">New</span>
                </div>
                <div class="card-body">
                    <p class="card-cat">Cocktail Mixer</p>
                    <h3>Whiskey Sour</h3>
                    <p class="desc">Lemon, cinnamon &amp; bitters</p>
                    <div class="card-row">
                        <span class="price">₹149</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Whiskey Sour">
                            <input type="hidden" name="price" value="149">
                            <input type="hidden" name="image" value="whiskey-sour.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/lemonade.jpg" alt="Classic Lemonade" />
                </div>
                <div class="card-body">
                    <p class="card-cat">Sparkling</p>
                    <h3>Classic Lemonade</h3>
                    <p class="desc">Sparkling lemon, classic recipe</p>
                    <div class="card-row">
                        <span class="price">₹99</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Classic Lemonade">
                            <input type="hidden" name="price" value="99">
                            <input type="hidden" name="image" value="lemonade.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/ginger-ale.jpg" alt="Ginger Ale" />
                </div>
                <div class="card-body">
                    <p class="card-cat">Sparkling</p>
                    <h3>Ginger Ale</h3>
                    <p class="desc">Bold ginger, extra fizz</p>
                    <div class="card-row">
                        <span class="price">₹99</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Ginger Ale">
                            <input type="hidden" name="price" value="99">
                            <input type="hidden" name="image" value="ginger-ale.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/mint-mojito.jpg" alt="Mint Mojito" />
                </div>
                <div class="card-body">
                    <p class="card-cat">Sparkling</p>
                    <h3>Mint Mojito</h3>
                    <p class="desc">Mint &amp; lime sparkling cooler</p>
                    <div class="card-row">
                        <span class="price">₹99</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Mint Mojito">
                            <input type="hidden" name="price" value="99">
                            <input type="hidden" name="image" value="mint-mojito.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-photo">
                    <img src="Assets/drinks/cranberry.jpg" alt="Cranberry Beer" />
                    <span class="tag">New</span>
                </div>
                <div class="card-body">
                    <p class="card-cat">Zero Alcohol</p>
                    <h3>Cranberry Beer</h3>
                    <p class="desc">Non-alcoholic cranberry brew</p>
                    <div class="card-row">
                        <span class="price">₹129</span>
                        <form action="cart" method="post" class="qty-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="name" value="Cranberry Beer">
                            <input type="hidden" name="price" value="129">
                            <input type="hidden" name="image" value="cranberry.jpg">
                            <input type="number" name="qty" value="1" min="1" max="10">
                            <button type="submit">Add</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
