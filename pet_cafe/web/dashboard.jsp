<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
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

        .card {
            margin-bottom: 20px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            margin-bottom: 15px;
            text-align: center;
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

        footer {
            text-align: center;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Pet Cafe & Salon Management</h1>
    </header>
    <nav>
        <a href="{{ url_for('dashboard') }}" class="active">Dashboard</a>
        <a href="{{ url_for('pet_records') }}">Pet Records</a>
        <a href="{{ url_for('customer_records') }}">Customer Records</a>
        <a href="{{ url_for('inventory_records') }}">Inventory Records</a>
        <a href="{{ url_for('employee_records') }}">Employee Records</a>
        <a href="{{ url_for('transactions') }}">Transactions</a>
        <a href="{{ url_for('reports') }}">Reports</a>
    </nav>
    <main>
        <div class="card">
            <h2>Records Management</h2>
            <div class="button-grid">
                <a href="{{ url_for('pet_records') }}">Manage Pet Records</a>
                <a href="{{ url_for('customer_records') }}">Manage Customer Records</a>
                <a href="{{ url_for('inventory_records') }}">Manage Inventory Records</a>
                <a href="{{ url_for('employee_records') }}">Manage Employee Records</a>
            </div>
        </div>
        <div class="card">
            <h2>Transactions</h2>
            <div class="button-grid">
                <a href="{{ url_for('pet_booking') }}">Pet Booking</a>
                <a href="{{ url_for('grooming_reservations') }}">Grooming Reservations</a>
                <a href="{{ url_for('cafe_orders') }}">Cafe Orders</a>
            </div>
        </div>
        <div class="card">
            <h2>Reports</h2>
            <div class="button-grid">
                <a href="{{ url_for('monthly_booking_report') }}">Monthly Booking Report</a>
                <a href="{{ url_for('grooming_services_report') }}">Grooming Services Report</a>
                <a href="{{ url_for('sales_inventory_report') }}">Sales & Inventory Report</a>
                <a href="{{ url_for('employee_task_report') }}">Employee Task Report</a>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Pet Cafe & Salon Management</p>
    </footer>
</body>
</html>
