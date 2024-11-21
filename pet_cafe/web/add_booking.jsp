<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Booking</title>
    <link rel="stylesheet" href="style.css">
    <style>
        main {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        form label {
            grid-column: span 2;
            font-weight: bold;
            color: #34495e;
            margin-bottom: 5px;
        }

        form input, form select {
            grid-column: span 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 15px;
        }

        form input[type="submit"] {
            grid-column: span 2;
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            font-size: 1rem;
            transition: background-color 0.3s, transform 0.3s;
        }

        form input[type="submit"]:hover {
            background-color: #16a085;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <header>
        <h1>Pet Cafe & Salon Management</h1>
    </header>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="transactions.jsp">Transactions</a>
        <a href="pet_booking.jsp" class="active">Pet Booking</a>
    </nav>
    <main>
        <h2>Add Booking</h2>
        <form action="submit_add_booking.jsp" method="post">
            <label for="customer">Customer Name</label>
            <input type="text" id="customer" name="customer" required>

            <label for="pet">Pet Name</label>
            <input type="text" id="pet" name="pet" required>

            <label for="date">Booking Date</label>
            <input type="date" id="date" name="date" required>

            <label for="time">Booking Time</label>
            <input type="time" id="time" name="time" required>

            <input type="submit" value="Add Booking">
        </form>
    </main>
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
