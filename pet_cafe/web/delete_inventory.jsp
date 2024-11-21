<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Inventory Item</title>
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
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        form label {
            font-weight: bold;
        }

        form input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input[type="submit"] {
            background-color: #1abc9c;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            padding: 10px;
            transition: background-color 0.3s;
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
        <a href="inventory_records.jsp" class="active">Inventory Records</a>
    </nav>
    <main>
        <h2>Delete Inventory Item</h2>
        <form action="DeleteInventoryServlet" method="post">
            <label for="item_id">Item ID</label>
            <input type="text" id="item_id" name="item_id" required>

            <input type="submit" value="Delete Item">
        </form>
    </main>
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
