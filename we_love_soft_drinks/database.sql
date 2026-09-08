-- WeLoveSoftDrinks database setup
-- Run this in MySQL (phpMyAdmin -> SQL tab, or MySQL Workbench)
-- Run it again any time: it only adds missing tables, never deletes data.

CREATE DATABASE IF NOT EXISTS welovesoftdrinks;
USE welovesoftdrinks;

-- 1. USERS: one row per account (used by login + register)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Test user (login with: test@gmail.com / 1234)
INSERT IGNORE INTO users (login, password) VALUES ('test@gmail.com', '1234');

-- 2. CART: one row per product in a user's cart.
-- user_login tells WHOSE cart it is (matches users.login).
-- Same user + same product can only appear once (UNIQUE below),
-- so adding twice just increases qty.
CREATE TABLE IF NOT EXISTS cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_login VARCHAR(100) NOT NULL,
    product VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    image VARCHAR(100) DEFAULT 'margarita.jpg',
    qty INT NOT NULL DEFAULT 1,
    UNIQUE KEY uq_cart (user_login, product)
);

-- 3. ORDERS: one row per placed order (whose order + address + total + time)
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_login VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    phone VARCHAR(30),
    address VARCHAR(255),
    total INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. ORDER ITEMS: what was inside each order (links to orders.id)
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    qty INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
