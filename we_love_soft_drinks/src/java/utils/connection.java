package utils;

import java.sql.Connection;
import java.sql.DriverManager;

// Simple helper class to get MySQL connection.
// Usage: Connection conn = connection.takeconnection();
public class connection {

    // Database settings.
    // On your laptop it uses the fallback values (localhost).
    // On Render/Railway you set these as Environment Variables instead,
    // so no password is ever saved in the code:
    //   DB_URL  = jdbc:mysql://HOST:PORT/welovesoftdrinks
    //   DB_USER = your db username
    //   DB_PASS = your db password
    private static final String URL = env("DB_URL", "jdbc:mysql://localhost:3306/welovesoftdrinks");
    private static final String USER = env("DB_USER", "root");
    private static final String PASSWORD = env("DB_PASS", "");

    // Read an environment variable, or use fallback if not set
    private static String env(String key, String fallback) {
        String value = System.getenv(key);
        return (value == null || value.isEmpty()) ? fallback : value;
    }

    public static Connection takeconnection() {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect and return
            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Safety net: creates our tables if they don't exist yet.
    // So the cart works even if you forgot to run database.sql.
    // Call it once at the start of any servlet that uses the database.
    public static void ensureTables() {
        try {
            Connection conn = takeconnection();
            if (conn == null) return;

            java.sql.Statement st = conn.createStatement();

            // Users table: one row per account
            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS users ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "login VARCHAR(100) NOT NULL UNIQUE, "
                + "password VARCHAR(100) NOT NULL)");

            // Cart table: one row per product in a user's cart
            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS cart_items ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "user_login VARCHAR(100) NOT NULL, "
                + "product VARCHAR(100) NOT NULL, "
                + "price INT NOT NULL, "
                + "image VARCHAR(100) DEFAULT 'margarita.jpg', "
                + "qty INT NOT NULL DEFAULT 1, "
                + "UNIQUE KEY uq_cart (user_login, product))");

            // Orders table: one row per placed order
            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS orders ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "user_login VARCHAR(100) NOT NULL, "
                + "name VARCHAR(100), "
                + "phone VARCHAR(30), "
                + "address VARCHAR(255), "
                + "total INT NOT NULL, "
                + "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");

            // Order items table: what was inside each order
            st.executeUpdate(
                "CREATE TABLE IF NOT EXISTS order_items ("
                + "id INT AUTO_INCREMENT PRIMARY KEY, "
                + "order_id INT NOT NULL, "
                + "product VARCHAR(100) NOT NULL, "
                + "price INT NOT NULL, "
                + "qty INT NOT NULL, "
                + "FOREIGN KEY (order_id) REFERENCES orders(id))");

            st.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
