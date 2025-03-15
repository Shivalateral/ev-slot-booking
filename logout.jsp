 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
 
<%
    // Invalidate the session to log out the user
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout - Electrical Slot Booking</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .logout-message {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        h1 {
            color: #ffd700;
            font-size: 28px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .redirect {
            font-size: 16px;
            margin-top: 20px;
        }

        .redirect a {
            color: #ffd700;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .redirect a:hover {
            color: #fff;
            text-decoration: underline;
        }

        .Login a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background: linear-gradient(90deg, #ff8a00, #e52e71);
            color: #fff;
            text-transform: uppercase;
            font-weight: bold;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .Login a:hover {
            transform: scale(1.1);
            background: linear-gradient(90deg, #e52e71, #ff8a00);
        }
    </style>
</head>
<body>

    <div class="logout-message">
        <h1>You have successfully logged out!</h1>
        <p>Thank you for using the Electrical Slot Booking System.</p>
        <div class="Login">
            <a href="Login.jsp">Log back in</a>
        </div>
    </div>

</body>
</html>
 
 