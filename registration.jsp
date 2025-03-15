 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Electrical Slot Booking</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
           body {
            font-family: 'Poppins', sans-serif;
            background: url('register.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: #fff;
        }
        .registration-container {
            max-width: 800px;
            margin: 100px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            transition: all 0.3s ease-in-out;
        }

        .registration-container:hover {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            transform: translateY(-10px);
        }

        h1 {
            color: Red;
            font-size: 36px;
            margin-bottom: 20px;
        }
            h2 {
            color: Black;
            font-size: 30px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            color: #343a40;
            margin-bottom: 10px;
            display: block;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            margin-top: 5px;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-size: 16px;
        }

        .welcome-note {
            font-size: 16px;
            margin-top: 20px;
            color: Black;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 14px;
            color: black;
        }

        .back-to-login {
            font-size: 16px;
            margin-top: 20px;
            color: #343a40;
        }

        .back-to-login a {
            color: #5cb85c;
            text-decoration: none;
        }

        .back-to-login a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="registration-container">
    <h1>Welcome to EV Slot Booking</h1>
    <h2>User Registration</h2>

    <form action="RegistrationServlet" method="post">
        <div class="form-group">
            <label for="txtName">Username:</label>
            <input type="text" id="txtName" name="txtName" required>
        </div>
        <div class="form-group">
            <label for="txtpassword">Password:</label>
            <input type="password" id="txtpassword" name="txtpassword" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Register">
        </div>
    </form>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            <p>${errorMessage}</p>
        </div>
    </c:if>

    <div class="back-to-login">
        <p>Already have an account? <a href="Login.jsp">Login here</a></p>
    </div>

</div>

<div class="footer">
    <p>&copy; 2025 EV Slot Booking. All rights reserved.</p>
</div>

</body>
</html>
 