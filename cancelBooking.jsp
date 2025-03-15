 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Booking</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: yellow;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .container {
            background-color: white;
            padding: 60px;
            border-radius: 35px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 700%;
            max-width: 450px;
            transition: all 0.3s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #0072ff;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 24px;
            border: none;
            border-radius: 8px;
            background-color: red;
            color: white;
            font-size: 28px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .message, .error {
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            padding: 10px;
            border-radius: 8px;
            animation: fadeIn 1s ease-out;
        }

        .message {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* Floating Buttons */
        .floating-btn {
            position: fixed;
            bottom: 40px;
            right: 40px;
            background-color: red;
            border: none;
            padding: 15px 25px;
            border-radius: 50%;
            font-size: 18px;
            color: white;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .floating-btn:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }

        /* Keyframe for fadeIn animation */
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                max-width: 90%;
            }

            h2 {
                font-size: 20px;
            }

            .btn {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Cancel Booking</h2>
    
    <!-- Form to enter Booking ID and Phone Number -->
    <form action="CancelBookingServlet" method="post">
        <label for="booking_id">Enter Booking ID:</label>
        <input type="text" id="booking_id" name="booking_id" required placeholder="Booking ID">
    
        <label for="phone_number">Enter Phone Number:</label>
        <input type="text" id="phone_number" name="phone_number" required placeholder="Phone Number">
        
        <input type="submit" value="Cancel Booking" class="btn">
    </form>

    <% 
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
    %>

    <!-- Display success message -->
    <% if (message != null) { %>
        <div class="message">
            <%= message %>
        </div>
    <% } %>

    <!-- Display error message -->
    <% if (error != null) { %>
        <div class="error">
            <%= error %>
        </div>
    <% } %>

</div>

<!-- Floating Action Buttons -->
<a href="dashboard.jsp">
    <button class="floating-btn">dashboard</button>
</a>
<a href="exit.jsp">
    <button class="floating-btn">Exist</button>
</a>

</body>
</html>
 
