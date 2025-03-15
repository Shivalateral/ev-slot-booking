 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Booking Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #E3F2FD, #E8F5E9);
               background-image: url('slotview.png');
            margin: 0;
            padding: 0;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        header {
            background: linear-gradient(to right, #4CAF50, #66BB6A);
            color: white;
            text-align: center;
            padding: 30px 20px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 700px;
            margin-bottom: 20px;
            animation: fadeIn 1s ease;
        }

        header h1 {
            font-size: 28px;
            margin: 0;
            font-weight: 700;
        }

        header p {
            font-size: 16px;
            margin: 8px 0 0;
        }

        .container {
            width: 90%;
            max-width: 600px;
            background-color: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            border-radius: 20px;
            padding: 40px;
            animation: slideIn 0.8s ease-out;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            font-size: 24px;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
        }

        input[type="text"] {
            padding: 14px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 20px;
            border: 2px solid #ccc;
            border-radius: 12px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            background-color: #F9F9F9;
        }

        input[type="text"]:focus {
            border-color: #66BB6A;
            background-color: #FFFFFF;
            outline: none;
            box-shadow: 0 4px 8px rgba(102, 187, 106, 0.2);
        }

        input[type="submit"] {
            background: linear-gradient(to right, #4CAF50, #81C784);
            color: white;
            border: none;
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            border-radius: 12px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #66BB6A, #A5D6A7);
            transform: translateY(-2px);
        }

        .booking-details {
            margin-top: 30px;
            padding: 20px;
            background-color: #E8F5E9;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .booking-details p {
            font-size: 18px;
            margin: 12px 0;
            color: #333;
            line-height: 1.5;
        }

        .error-message {
            color: red;
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
            animation: shake 0.5s ease;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }
            25%, 75% {
                transform: translateX(-10px);
            }
            50% {
                transform: translateX(10px);
            }
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 30px;
            }

            header {
                font-size: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
               /* Floating button styles */
 /* Basic button style */
.dynamic-btn {
    padding: 12px 20px;
    font-size: 16px;
    font-weight: bold;
    color: white;
    background-color: #007bff; /* Blue background */
    border: none;
    border-radius: 5px; /* Rounded corners */
    cursor: pointer;
    transition: all 0.3s ease; /* Smooth transition for all changes */
    margin: 10px;
}

/* Hover effect */
.dynamic-btn:hover {
    background-color: #0056b3; /* Darker blue */
    transform: scale(1.05); /* Slightly larger on hover */
}

/* Focus effect when clicked or focused */
.dynamic-btn:focus {
    outline: none; /* Removes default focus outline */
    box-shadow: 0 0 5px 2px rgba(0, 123, 255, 0.5); /* Adds a blue glow */
}
 
    </style>
</head>
<body>
    <header>
        <h1>View Recent Booking Details</h1>
        <p>Enter your Booking ID and Phone Number to retrieve your booking details.</p>
    </header>

    <div class="container">
        <form action="ViewSlotBookingServlet" method="get">
            <h2>Search Booking</h2>

            <label for="bookingId">Booking ID</label>
            <input type="text" id="bookingId" name="bookingId" required>

            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" required>

            <input type="submit" value="View Booking">
        </form>

        <c:if test="${empty bookingDetails}">
            <div class="error-message">
                <p>No booking found for the given details. Please try again.</p>
            </div>
        </c:if>
                           <a href="dashboard.jsp">
                          <button class="dynamic-btn">Dashboard</button>
                           </a>
<a href="exit.jsp">
    <button class="dynamic-btn">Exit</button>
</a>
 
    </div>
</body>
</html>
 
