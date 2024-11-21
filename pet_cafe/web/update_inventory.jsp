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
        <a href="inventory_records.jsp" class="active">Inventory Records</a>
    </nav>
    <main>
        <h2>Update Inventory</h2>
        <form action="UpdateInventoryServlet" method="post">
            <label for="item_id">Item ID</label>
            <input type="text" id="item_id" name="item_id" required>
    
            <label for="item_name">New Item Name</label>
            <input type="text" id="item_name" name="item_name">
    
            <label for="category">New Category</label>
            <select id="category" name="category">
                <option value="Food">Food</option>
                <option value="Drinks">Drinks</option>
                <option value="Pet Products">Pet Products</option>
            </select>
    
            <label for="status">New Stock Status</label>
            <select id="status" name="status">
                <option value="In Stock">In Stock</option>
                <option value="Low Stock">Low Stock</option>
            </select>
    
            <label for="current_stock">New Current Stock</label>
            <input type="number" id="current_stock" name="current_stock">
    
            <label for="restock_date">New Date of Last Restock</label>
            <input type="date" id="restock_date" name="restock_date">
    
            <input type="submit" value="Update Item">
        </form>
    </main>
    
    
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
