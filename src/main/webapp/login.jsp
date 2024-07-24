
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacare Sign In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('assets/BG3.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            margin-top: 70px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 10px 20px 10px rgba(17, 1, 1, 0.1);
            text-align: center;
            height: 300px;
        }
        .container h2 {
            margin-bottom: 10px;
        }
        .container input {
            width: 75%;
            padding: 10px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;            
        }
        .container .button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100px;
        }
        .container .forgot-password {
            display: block;
            margin-top: 30px;
            color: #007bff;
            text-decoration: none;
        }
        .container .forgot-password:hover {
            text-decoration: underline;
        }
        .logo {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 5px;
        }
        .logo img {
            margin-top: -350px;
            max-width: 350px;
            margin-right: -450px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <form action="LoginServlet" method="post">
            <input type="email" placeholder="Your Email" required name="email">
            <input type="password" placeholder="Password" required name="pass">
            <br><br>
            <input type="submit" class="button" value="Sign-In">
            <a href="#" class="forgot-password">Forgot password?</a>
            <% 
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
                out.println("<p style=\"color:red\">" + error + "</p>");
            }
            %>
        </form>
    </div>
</body>
</html>

