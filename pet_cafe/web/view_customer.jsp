<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
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
        }

        form input, form select {
            grid-column: span 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }

        form input[type="submit"] {
            grid-column: span 2;
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            font-size: 1rem;
        }

        form input[type="submit"]:hover {
            background-color: #16a085;
        }
    </style>
</head>
<body>
    <header>
        <h1>Pet Cafe & Salon Management</h1>
    </header>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="customer_records.jsp" class="active">Customer Records</a>
    </nav>
    <main>
        <h2>View Customer Records</h2>
        <form action="view_customer_results.jsp" method="post">
            <label for="search_term">Search by Customer Name or Contact</label>
            <input type="text" id="search_term" name="search_term" required>
    
            <input type="submit" value="Search">
        </form>
    </main>
    
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
