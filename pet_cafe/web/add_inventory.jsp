<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Inventory Item</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
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
        <a href="${pageContext.request.contextPath}/dashboard.jsp">Dashboard</a>
        <a href="${pageContext.request.contextPath}/inventory_records.jsp" class="active">Inventory Records</a>
    </nav>
    <main>
        <h2>Add Inventory Item</h2>
        <!-- Form to send data to AddInventoryServlet -->
        <form action="AddInventoryServlet" method="post">

            <label for="item_name">Item Name</label>
            <input type="text" id="item_name" name="item_name" required>
    
            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="Food">Food</option>
                <option value="Drinks">Drinks</option>
                <option value="Pet Products">Pet Products</option>
            </select>
    
            <label for="status">Stock Status</label>
            <select id="status" name="status" required>
                <option value="In Stock">In Stock</option>
                <option value="Low Stock">Low Stock</option>
            </select>
    
            <label for="current_stock">Current Stock</label>
            <input type="number" id="current_stock" name="current_stock" required>

            <label for="restock_frequency">Restock Frequency</label>
            <select id="restock_frequency" name="restock_frequency" required>
                <option value="Weekly">Weekly</option>
                <option value="Monthly">Monthly</option>
                <option value="As Needed">As Needed</option>
            </select>
    
            <label for="restock_date">Date of Last Restock</label>
            <input type="date" id="restock_date" name="restock_date">
    
            <input type="submit" value="Add Item">
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
