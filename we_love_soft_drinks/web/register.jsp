<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap" rel="stylesheet">
    <style>
        *{
            font-family: "Google Sans", sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-variation-settings:"GRAD" 0;
            font-weight:450;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body{
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
            width: 100vw;
            overflow:hidden;
            position: relative;
        }
        .header {
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 10;
        }
        .header h1 {
            margin: 0;
            font-size: 1.5rem;
            font-weight:800;
            color: black;
        }
        .page{
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
            width: 100%;
            height: 100%;
        }
        .page a{
            text-decoration:none;
            color:#0000A3;
        }
        .content{
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            height:25rem;
            width:25rem;
            margin-top: -30px;
        }
        .input{
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            gap:1rem;
        }
        .input input{
            height:3rem;
            width:20rem;
            border:none;
            outline:none;
            border-radius:0.5rem;
            font-size:1rem;
            border:0.1rem solid #D3D3D3;
            padding-left:1rem;
            box-sizing:border-box;
        }
        .input input:focus {
            border-color: #EE4B2B;
        }
        .input button{
            height:3rem;
            width:20rem;
            border:none;
            outline:none;
            border-radius:0.5rem;
            background-color:#EE4B2B;
            color:white;
            font-size:1rem;
            cursor:pointer;
            transition: background-color 0.2s;
        }
        .input button:hover{
            background-color:#EC3713;
        }
        .title{
            width: 20rem;
            text-align: left;
            margin-bottom: 1rem;
        }
        .title h1{
            color:black;
            font-weight: 500;
        }
        .title h4{
            color:grey;
            font-weight: 400;
        }
        .footer {
            position: absolute;
            bottom: 50px;
            left: 0;
            right: 0;
            text-align: center;
        }
        
        /* NEW: Message styles */
        .message {
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 0.5rem;
            width: 20rem;
            text-align: center;
            font-weight: 450;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>WeLoveSoftDrinks</h1>
    </div>
    <div class="page">
        <form action="register" method="post">
        <div class="content">
            <div class="title">
                <h1>Create an account</h1>
                <h4>Create an account or <a href="login.jsp">Sign in</a></h4>
            </div>
            
            <!-- NEW: Display messages here -->
            <%
                String successMessage = (String) request.getAttribute("successMessage");
                String errorMessage = (String) request.getAttribute("errorMessage");
                
                if (successMessage != null) {
            %>
                <div class="message success"><%= successMessage %></div>
            <%
                }
                
                if (errorMessage != null) {
            %>
                <div class="message error"><%= errorMessage %></div>
            <%
                }
            %>
            
            <div class="input">
                <input type="email" name="email" placeholder="Email-id">
                <input type="password" name="password" placeholder="Password">
                <input type="password" name="confirm-password" placeholder="Confirm Password">
                <button type="submit">Submit</button>
            </div>
        </div>
        </form>
        <div class="footer">
            <a href="#">Privacy Policy</a>
        </div>
    </div>
</body>
</html>