<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Pet</title>
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
        <a href="pet_records.jsp" class="active">Pet Records</a>
    </nav>
    <main>
        <h2>Update Pet Details</h2>
        <form action="update_pet_process.jsp" method="post">
            <label for="pet_id">Pet ID</label>
            <input type="text" id="pet_id" name="pet_id" required>

            <label for="name">New Pet Name</label>
            <input type="text" id="name" name="name">

            <label for="species">New Species</label>
            <input type="text" id="species" name="species">

            <label for="breed">New Breed</label>
            <input type="text" id="breed" name="breed">

            <label for="owner">New Owner Name</label>
            <input type="text" id="owner" name="owner">

            <label for="vaccination">New Vaccination Status</label>
            <select id="vaccination" name="vaccination">
                <option value="Up to Date">Up to Date</option>
                <option value="Not Up to Date">Not Up to Date</option>
            </select>

            <label for="special_needs">New Special Needs</label>
            <input type="text" id="special_needs" name="special_needs">

            <input type="submit" value="Update Pet">
        </form>
    </main>
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
