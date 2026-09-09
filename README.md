# WeLoveSoftDrinks

Premium beverage e-commerce web app — browse mixers, cart, checkout & order history, built with JSP, Servlets, MySQL and Docker.

## Demo

https://github.com/user-attachments/assets/de72406b-6164-4814-997d-d3e89375c8fc

*Login → Shop → Cart → Checkout → My Orders*

## Features

- User registration, login and logout (MySQL + sessions)
- Product collection with add-to-cart and quantity support
- Database-backed cart — a separate cart per user profile
- Checkout with delivery address capture
- Per-profile order history page
- Custom pink responsive UI with real product photography
- SEO meta tags, Open Graph tags and `robots.txt`
- Dockerized (Tomcat 9) with environment-based DB config

## Tech Stack

| Layer    | Technology                          |
|----------|-------------------------------------|
| Frontend | JSP, HTML, CSS (custom, no framework) |
| Backend  | Java Servlets (`javax.servlet`)     |
| Database | MySQL (JDBC)                        |
| Server   | Apache Tomcat 9                     |
| Deploy   | Docker                              |

## Project Structure

```
we-love-soft-drinks/
├── Dockerfile                  # Builds WAR + runs on Tomcat 9
├── we_love_soft_drinks/
│   ├── database.sql            # DB + tables + test user (run once)
│   ├── web/                    # JSP pages, CSS, images
│   │   ├── index.jsp           # Homepage
│   │   ├── shop.jsp            # Product collection
│   │   ├── cart.jsp            # Cart (from database)
│   │   ├── checkout.jsp        # Address + bill
│   │   ├── orders.jsp          # Order history per user
│   │   ├── login.jsp / register.jsp / dashboard.jsp
│   │   ├── header.jsp / footer.jsp   # Shared layout
│   │   ├── style.css           # Whole-site stylesheet
│   │   └── Assets/drinks/      # Product + banner photos
│   ├── src/java/
│   │   ├── servlets/           # login, register, CartServlet, OrderServlet, Logout
│   │   ├── model/CartItem.java # Cart row holder
│   │   └── utils/connection.java  # DB connection + auto-creates tables
│   └── lib/                    # MySQL JDBC driver
```

## Run Locally (NetBeans + XAMPP)

1. Start MySQL (XAMPP control panel).
2. Import `we_love_soft_drinks/database.sql` in phpMyAdmin (creates DB, tables and a test user).
   - Skip this if you like — the app auto-creates empty tables on first use (but then register a new account instead of using the test login).
3. Open the `we_love_soft_drinks` folder in NetBeans and press **Run**.
4. Test login: `test@gmail.com` / `1234`.

Default DB settings (no password, XAMPP defaults) live in `src/java/utils/connection.java`.

## Deploy (Railway / Render)

The app reads the database from environment variables (falls back to localhost):

| Variable  | Example                                    |
|-----------|--------------------------------------------|
| `DB_URL`  | `jdbc:mysql://HOST:PORT/welovesoftdrinks`  |
| `DB_USER` | your db username                           |
| `DB_PASS` | your db password                           |

**Railway (app + MySQL in one place):** deploy this repo (Dockerfile is auto-detected) → add a MySQL database → set the 3 variables from the MySQL service's values.

**Render:** create a Web Service from this repo (Runtime: Docker) and point the 3 variables at any MySQL host (e.g. TiDB Cloud or Clever Cloud free tier).

> Note: must be Tomcat 9, not 10 — this project uses `javax.servlet`.
