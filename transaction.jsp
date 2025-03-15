 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Details</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #64b5f6, #ff80ab);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: white;
        }

        /* Transaction Detail Styles */
        .container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
            margin: auto;
        }

        .container h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 16px;
            margin: 8px 0;
            color: #555;
        }

        .container strong {
            font-weight: 600;
        }

        /* Button Styles */
        .btn {
            padding: 15px 25px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
        }

        .btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 95%;
            }

            .btn {
                width: 100%;
            }
        }

    </style>
</head>
<body>

    <div class="container">
        <h2>Enter Payment ID</h2>

        <!-- Form to enter Payment ID -->
        <form action="TransactionDetailsServlet" method="post">
            <label for="payment_id">Payment ID: </label>
            <input type="text" id="payment_id" name="payment_id" required style="padding: 12px; width: 100%; margin-bottom: 20px; border-radius: 10px; border: 1px solid #ccc;">
            <input type="submit" value="Enter" class="btn btn-primary" />
        </form>

        <br />

        <% 
            // Display error message if there is one
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.println("<p style='color:red;'>" + error + "</p>");
            }
        
            // Retrieve payment and transaction details from request attributes
            String paymentId = (String) request.getAttribute("paymentId");
            String bookingId = (String) request.getAttribute("bookingId");
            String paymentMode = (String) request.getAttribute("paymentMode");
            Double amount = (Double) request.getAttribute("amount");
            String upi = (String) request.getAttribute("upi");
            Double bankAmount = (Double) request.getAttribute("bankAmount");
            String transactionStatus = (String) request.getAttribute("transactionStatus");
            String transactionDate = (String) request.getAttribute("transactionDate");
        
            if (paymentId != null) {
        %>

        <h3>Payment and Transaction Details</h3>
        <p><strong>Payment ID: </strong><%= paymentId %></p>
        <p><strong>Booking ID: </strong><%= bookingId %></p>
        <p><strong>Payment Mode: </strong><%= paymentMode %></p>
        <p><strong>Amount: </strong><%= amount %></p>
        <p><strong>UPI: </strong><%= upi %></p>
        <p><strong>Bank Amount: </strong><%= bankAmount %></p>
        <p><strong>Transaction Status: </strong><%= transactionStatus != null ? transactionStatus : "Success" %></p>
        <p><strong>Transaction Date: </strong><%= transactionDate != null ? transactionDate : "N/A" %></p>

        <% 
            }
        %>

        <!-- Buttons for Go to Dashboard and Exit -->
        <div>
            <a href="dashboard.jsp">
                <button class="btn btn-primary">Go to Dashboard</button>
             <a href="exit.jsp">
                <button class="btn btn-primary">EXIST</button>
        </div>
    </div>

</body>
</html>
 
 
 









 