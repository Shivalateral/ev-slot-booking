<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Electrical Slot Booking</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('evslot.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: #fff;
        }

        .dashboard-container {
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease-in-out;
        }

        .dashboard-container:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transform: translateY(-10px);
        }

        h1 {
            text-align: center;
            font-size: 40px;
            color: #343a40;
            margin-bottom: 30px;
        }

        h2 {
            color: #5cb85c;
            font-size: 26px;
            text-align: center;
            margin-top: 20px;
        }

        .menu {
            margin-top: 40px;
        }

        .menu h3 {
            font-size: 24px;
            color: #343a40;
            margin-bottom: 15px;
            text-align: center;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        .menu li {
            margin: 15px 0;
        }

        .menu a {
            text-decoration: none;
            color: #5cb85c;
            font-weight: bold;
            padding: 15px 25px;
            display: inline-block;
            border: 2px solid #5cb85c;
            border-radius: 30px;
            transition: background-color 0.3s, color 0.3s, transform 0.2s;
            font-size: 20px;
        }

        .menu a:hover {
            background-color: #5cb85c;
            color: white;
            border-color: #5cb85c;
            transform: scale(1.05);
        }

        .menu a:active {
            transform: scale(0.98);
        }

        .logout {
            text-align: right;
            margin-top: 30px;
        }

        .logout a {
            color: #d9534f;
            font-weight: bold;
            font-size: 20px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .logout a:hover {
            color: #c9302c;
            text-decoration: underline;
        }

        /* Card-style menu items */
        .menu li {
            display: inline-block;
            margin: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .card i {
            font-size: 40px;
            color: #5cb85c;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Welcome to the Electrical Slot Booking Dashboard</h1>

        <c:if test="${not empty sessionScope.username}">
            <h2>Hello, ${sessionScope.username}!</h2>
        </c:if>

        <div class="menu">
            <h3>Menu:</h3>
            <ul>
                <li>
                    <div class="card">
                        <i class="fas fa-calendar-check"></i>
                        <a href="slotBooking.jsp">Slot Booking</a>
                    </div>
                </li>
                <li>
                    <div class="card">
                        <i class="fas fa-list-alt"></i>
                        <a href="viewBookings.jsp">View Bookings</a>
                    </div>
                </li>
                <li>
                    <div class="card">
                        <i class="fas fa-credit-card"></i>
                        <a href="payment.jsp">Payment</a>
                    </div>
                </li>
                <li>
                    <div class="card">
                        <i class="fas fa-chart-line"></i>
                        <a href="transaction.jsp">Transaction Details</a>
                    </div>
                </li>
                <li>
                    <div class="card">
                        <i class="fas fa-times-circle"></i>
                        <a href="cancelBooking.jsp">Cancel Booking</a>
                    </div>
                </li>
            </ul>
        </div>

        <div class="logout">
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
</body>
</html>

