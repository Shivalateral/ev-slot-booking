<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            margin-top: 100px;
        }
        .container {
            background: white;
            border-radius: 10px;
            padding: 30px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #007BFF;
            font-size: 24px;
        }
        p {
            font-size: 16px;
            margin: 10px 0 20px;
        }
        a {
            display: inline-block;
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank You for Visiting!</h1>
        <p>Your booking has been completed successfully.</p>
        <p>If you wish to log in again, click the button below:</p>
    
        <li><a href="Login.jsp">back to login</a></li>
    </div>
</body>
</html>
