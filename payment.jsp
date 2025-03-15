 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Processing</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('slotpay.png ');
            padding: 20px;
            margin: 0;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 900%;
            max-width: 500px;
            background: linear-gradient(145deg, #ffffff, #e6e6e6);
            border-radius: 20px;
            padding:120px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        button {
            background: linear-gradient(145deg, #4caf50, #45a049);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        .error {
            color: red;
        }

        /* Additional Fields Styling */
        #upiDetails, #bankDetails {
            display: none;
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
        <h2>Process Payment</h2>

        <!-- Payment Form -->
       <form action="TransactionServlet" method="POST">
            <label for="bookingId">Booking ID</label>
            <input type="text" id="bookingId" name="bookingId" required placeholder="Enter your Booking ID" />

            <label for="paymentMode">Select Payment Mode</label>
            <select id="paymentMode" name="paymentMode" required>
                <option value="">Select a Payment Mode</option>
                <option value="UPI">UPI</option>
                <option value="Bank Transfer">Bank Transfer</option>
                <option value="COD">Cash on Delivery (COD)</option>
            </select>

            <div id="upiDetails">
                <label for="upiId">Enter UPI ID</label>
                <input type="text" id="upiId" name="upiId" placeholder="Enter your UPI ID" />
            </div>

            <div id="bankDetails">
                <label for="bankAccount">Enter Bank Account Number</label>
                <input type="text" id="bankAccount" name="bankAccount" placeholder="Enter your Bank Account Number" />
            </div>

            <label for="amount">Amount</label>
            <input type="text" id="amount" name="amount" required placeholder="Enter the Amount to be Paid" />

            <button type="submit">Submit Payment</button>
        </form>
    </div>
     <!-- Simple dynamic buttons -->
     
    <script>
        // Show additional fields based on payment method selection
        document.getElementById("paymentMode").addEventListener("change", function() {
            var paymentMode = this.value;

            if (paymentMode === "UPI") {
                document.getElementById("upiDetails").style.display = "block";
                document.getElementById("bankDetails").style.display = "none";
            } else if (paymentMode === "Bank Transfer") {
                document.getElementById("upiDetails").style.display = "none";
                document.getElementById("bankDetails").style.display = "block";
            } else {
                document.getElementById("upiDetails").style.display = "none";
                document.getElementById("bankDetails").style.display = "none";
            }
        });
    </script>
     <!-- Simple dynamic buttons -->
                           <div> 
                              <a href="dashboard.jsp">
                               <button class="dynamic-btn">Dashboard</button>
                                   </a>
                             <a href="exit.jsp">
                                 <button class="dynamic-btn">Exit</button>
                                 </a>
                                 </div>

</body>
</html>
 