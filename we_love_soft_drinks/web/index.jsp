<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>

    <link rel="stylesheet" href="style.css"/>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.css"
          integrity="sha512-x9WwyMYBnlXMNQ6kQ/Lyzu1NqIhLQKL5Oq6xByfXuRj7s9CskyCbLv/1IjqzJmXwFXWr0ov6jBV7Qbc0hh9nHg=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap"
          rel="stylesheet">

    <style>

        * {
            font-family: "Google Sans", sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-variation-settings: "GRAD" 0;
            font-weight: 800;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            width: 100%;
            background-color: #f6d5d7;
        }

        nav {
            height: 5rem;
            position: relative;

            display: flex;
            justify-content: space-around;
            align-items: center;

            background-color: #f6d5d7;
        }


        .links {
            display: flex;
            gap: 3rem;
        }

        .links a {
            text-decoration: none;
            color: #9c555c;
        }

        .user {
            display: flex;
            font-size: 1.5rem;
            gap: 2rem;
        }

        .user a {
            text-decoration: none;
            color: #9c555c;
        }

        /* Mobile */

        @media (max-width: 600px) {

            nav {
                height: auto;
                padding: 1rem;
                gap: 1.5rem;
                flex-direction: column;
            }

            .links {
                gap: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .user {
                gap: 1.5rem;
            }

        }

    </style>
</head>

<body>

    <nav>

        <div class="links">
            <a href="#">Outdoor & Sports</a>
            <a href="#">Home & Offices</a>
            <a href="#">Contact Us</a>
        </div>

        <div class="user">

            <a href="#">
                <i class="fa-solid fa-bag-shopping"></i>
            </a>

            <a href="#">
                <i class="fa-solid fa-heart"></i>
            </a>

            <a href="#">
                <i class="fa-solid fa-circle-user"></i>
            </a>

        </div>

    </nav>

</body>

</html>