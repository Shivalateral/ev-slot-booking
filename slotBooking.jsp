 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slot Booking</title>
    <style>
        body {
              background-image: url('evslotbook.png');
            font-family: Arial, sans-serif;
            padding: 20px;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-size: 12px;
            color: #555;
            margin-bottom: 23px;
            display: block;
        }

        input, select {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: silver;
        }

        .error {
            color: red;
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
    <div class="container">
        <h2>Slot Booking</h2>

        <!-- OTP Generation Form -->
        <form action="SlotBookingServlet" method="get">
            <input type="hidden" name="action" value="getOtp" />
            <label for="phone">Enter Phone Number</label>
            <input type="text" id="phone" name="phone" required placeholder="Enter your phone number" />
            <button type="submit">Generate OTP</button>
        </form>

        <hr>

        <!-- Slot Booking Form -->
        <form action="SlotBookingServlet" method="get">
            <input type="hidden" name="action" value="bookSlot" />
            
            <label for="bookingId">Booking ID</label>
            <input type="text" id="bookingId" name="bookingId" required placeholder="Enter your booking ID" />

            <label for="name">Name</label>
            <input type="text" id="name" name="name" required placeholder="Enter your name" />

            <!-- Locations Dropdown -->
           <label for="location">Select Location</label>
<select id="location" name="location" required>
    <option value="">Select a Location</option>
    <option value="Hyderabad">Hyderabad</option>
    <option value="Warangal">Warangal</option>
    <option value="Nizamabad">Nizamabad</option>
    <option value="Khammam">Khammam</option>
    <option value="Karimnagar">Karimnagar</option>
    <option value="Ramagundam">Ramagundam</option>
    <option value="Nalgonda">Nalgonda</option>
    <option value="Suryapet">Suryapet</option>
    <option value="Mahabubnagar">Mahabubnagar</option>
    <option value="Adilabad">Adilabad</option>
</select>
           

             <label for="slotTime">Slot Time:</label>
        <input type="datetime-local" id="slotTime" name="slotTime" required>

            <label for="otp">Enter OTP</label>
            <input type="text" id="otp" name="otp" required placeholder="Enter the OTP sent to your phone" />

            <button type="submit">Book Slot</button>
        </form>
 <!-- Simple dynamic buttons -->
<a href="dashboard.jsp">
    <button class="dynamic-btn">Dashboard</button>
</a>
<a href="exit.jsp">
    <button class="dynamic-btn">Exit</button>
</a>
 
</body>
</html>
 


 
 

