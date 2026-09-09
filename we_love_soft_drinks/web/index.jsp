<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeLoveSoftDrinks - Premium Beverages</title>
    <meta name="description" content="WeLoveSoftDrinks — premium small-batch cocktail mixers, sparkling coolers and zero-alcohol brews, delivered chilled in 30 minutes." />
    <meta name="robots" content="index, follow" />
    <meta name="theme-color" content="#3d1421" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="WeLoveSoftDrinks - Premium Beverages" />
    <meta property="og:description" content="Premium small-batch mixers, sparkling coolers and zero-alcohol brews, delivered chilled." />
    <meta property="og:image" content="Assets/logo.png" />
    <meta name="twitter:card" content="summary" />
    <link rel="icon" type="image/png" href="Assets/logo.png" />
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Store",
      "name": "WeLoveSoftDrinks",
      "description": "Premium small-batch cocktail mixers, sparkling coolers and zero-alcohol brews.",
      "image": "Assets/logo.png"
    }
    </script>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp" />

    <!-- HERO -->
    <div class="hero-luxe">
        <div class="hero-inner">
            <div class="hero-eyebrow">Premium Small-Batch Beverages</div>
            <h1>Poured Like <em>Luxury,</em> Priced for Every Party</h1>
            <p>Finely crafted mixers, sparkling coolers and zero-alcohol brews — made with real fruit, low sugar and zero compromise.</p>
            <div class="hero-buttons">
                <a href="shop.jsp" class="btn btn-gold">Shop the Collection</a>
                <a href="#craft" class="btn btn-cream">Our Craft</a>
            </div>
            <div class="hero-meta">
                <div><b>8</b><small>Signature Pours</small></div>
                <div><b>30 min</b><small>Chilled Delivery</small></div>
                <div><b>4.9</b><small>Customer Rating</small></div>
            </div>
        </div>
    </div>

    <!-- GOLD MARQUEE -->
    <div class="marquee">
        <span>Small-Batch &nbsp;·&nbsp; Real Fruit &nbsp;·&nbsp; Low Sugar &nbsp;·&nbsp; Served Chilled &nbsp;·&nbsp; Small-Batch &nbsp;·&nbsp; Real Fruit &nbsp;·&nbsp; Low Sugar &nbsp;·&nbsp; Served Chilled &nbsp;·&nbsp;</span><span>Small-Batch &nbsp;·&nbsp; Real Fruit &nbsp;·&nbsp; Low Sugar &nbsp;·&nbsp; Served Chilled &nbsp;·&nbsp; Small-Batch &nbsp;·&nbsp; Real Fruit &nbsp;·&nbsp; Low Sugar &nbsp;·&nbsp; Served Chilled &nbsp;·&nbsp;</span>
    </div>

    <!-- BESTSELLERS -->
    <div class="section" id="featured">
        <p class="eyebrow">Customer Favourites</p>
        <h2>The <em>Bestsellers</em></h2>
        <p class="subtitle">Our most re-ordered bottles this season</p>

        <div class="products">
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

        <div style="text-align:center; margin-top:2.5rem;">
            <a href="shop.jsp" class="btn btn-dark">View Full Collection</a>
        </div>
    </div>

    <!-- RANGES -->
    <div class="section" style="padding-top:0;">
        <p class="eyebrow">Three Ranges</p>
        <h2>Choose Your <em>Pour</em></h2>
        <p class="subtitle">One shelf, three moods</p>
        <div class="tiles">
            <a href="shop.jsp" class="tile">
                <img src="Assets/drinks/cosmo.jpg" alt="Cocktail Mixers" />
                <div class="tile-label"><small>4 Bottles</small><h3>Cocktail Mixers</h3></div>
            </a>
            <a href="shop.jsp" class="tile">
                <img src="Assets/drinks/ginger-ale.jpg" alt="Sparkling Range" />
                <div class="tile-label"><small>3 Bottles</small><h3>Sparkling Range</h3></div>
            </a>
            <a href="shop.jsp" class="tile">
                <img src="Assets/drinks/cranberry.jpg" alt="Zero Alcohol" />
                <div class="tile-label"><small>1 Bottle</small><h3>Zero Alcohol</h3></div>
            </a>
        </div>
    </div>

    <!-- CRAFT -->
    <div class="section" id="craft" style="padding-top:0;">
        <div class="craft">
            <img src="Assets/drinks/craft-lemonade.jpg" alt="Crafted with real lemons" />
            <div>
                <p class="eyebrow">Our Craft</p>
                <h2>Made Like It <em>Matters</em></h2>
                <p>Every bottle starts with real fruit and natural botanicals. No shortcuts, no artificial aftertaste — just a clean, balanced pour every time.</p>
                <ul class="tick">
                    <li>Real fruit juice &amp; natural botanicals</li>
                    <li>Low sugar, low calorie recipes</li>
                    <li>Small batches, quality-checked bottles</li>
                    <li>Delivered chilled in 30 minutes</li>
                </ul>
                <a href="shop.jsp" class="btn btn-dark">Taste the Difference</a>
            </div>
        </div>
    </div>

    <!-- REVIEWS -->
    <div class="section" style="padding-top:0;">
        <p class="eyebrow">Word of Mouth</p>
        <h2>Loved at <em>House Parties</em></h2>
        <p class="subtitle">What our customers say</p>
        <div class="quotes">
            <div class="quote">
                <div class="stars">★★★★★</div>
                <p>"The Mango Chilli Mojito tastes straight out of a premium bar. My guests kept asking where it was from."</p>
                <small>— Verified Buyer</small>
            </div>
            <div class="quote">
                <div class="stars">★★★★★</div>
                <p>"Ordered at 7, chilled bottles at the door by 7:30. The ginger ale is dangerously good."</p>
                <small>— Verified Buyer</small>
            </div>
            <div class="quote">
                <div class="stars">★★★★★</div>
                <p>"Finally a zero-alcohol option that doesn't feel like a compromise. Cranberry Beer is now a fridge staple."</p>
                <small>— Verified Buyer</small>
            </div>
        </div>
    </div>

    <!-- CTA -->
    <div class="section" style="padding-top:0;">
        <div class="cta">
            <h2>Your Bar, <em>Upgraded</em></h2>
            <p>Create an account and get your first chilled delivery today.</p>
            <div style="display:flex; gap:0.9rem; justify-content:center;">
                <a href="shop.jsp" class="btn btn-gold">Order Now</a>
                <a href="register.jsp" class="btn btn-cream">Join the Club</a>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
