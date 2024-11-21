<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Reports</title>
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

        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .button-grid a {
            text-align: center;
            padding: 15px 20px;
            background-color: #1abc9c;
            color: white;
            text-decoration: none;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        .button-grid a:hover {
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
        <a href="pet_records.jsp">Pet Records</a>
        <a href="customer_records.jsp">Customer Records</a>
        <a href="inventory_records.jsp">Inventory Records</a>
        <a href="employee_records.jsp">Employee Records</a>
        <a href="transactions.jsp">Transactions</a>
        <a href="reports.jsp">Reports</a>
    </nav>
    <main>
        <h2>Available Reports</h2>
        <div class="button-grid">
            <a href="monthly_booking_report.jsp">Monthly Booking Report</a>
            <a href="grooming_services_report.jsp">Grooming Services Report</a>
            <a href="sales_inventory_report.jsp">Sales & Inventory Report</a>
            <a href="employee_task_report.jsp">Employee Task Report</a>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
