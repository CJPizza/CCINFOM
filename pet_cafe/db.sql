-- Step 1: Create the database
CREATE DATABASE pet_cafe;

-- Step 2: Use the database
USE pet_cafe;

-- Step 3: Create the inventory table
CREATE TABLE inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category ENUM('Food', 'Drinks', 'Pet Products') NOT NULL,
    status ENUM('In Stock', 'Low Stock') NOT NULL,
    current_stock INT NOT NULL,
    restock_frequency ENUM('Weekly', 'Monthly', 'As Needed') NOT NULL,
    last_restock DATE
);

-- Step 4: Insert sample data
INSERT INTO inventory (item_name, category, status, current_stock, restock_frequency, last_restock)
VALUES
    ('Dog Food', 'Food', 'In Stock', 50, 'Monthly', '2024-10-01'),
    ('Cat Litter', 'Pet Products', 'Low Stock', 10, 'Weekly', '2024-11-10'),
    ('Bird Seed', 'Food', 'In Stock', 30, 'Monthly', '2024-10-15'),
    ('Fish Tank Cleaner', 'Pet Products', 'Low Stock', 5, 'As Needed', '2024-09-25'),
    ('Pet Shampoo', 'Pet Products', 'In Stock', 25, 'As Needed', '2024-11-01'),
    ('Cat Food', 'Food', 'Low Stock', 8, 'Monthly', '2024-10-05'),
    ('Hamster Wheel', 'Pet Products', 'In Stock', 12, 'As Needed', '2024-08-20'),
    ('Parrot Feed', 'Food', 'In Stock', 45, 'Weekly', '2024-11-07'),
    ('Dog Collar', 'Pet Products', 'Low Stock', 3, 'As Needed', '2024-10-20'),
    ('Fish Food', 'Food', 'In Stock', 18, 'Monthly', '2024-11-15'),
    ('Pet Bed', 'Pet Products', 'In Stock', 10, 'As Needed', '2024-10-28'),
    ('Bird Cage', 'Pet Products', 'Low Stock', 6, 'Monthly', '2024-09-12'),
    ('Dog Toys', 'Pet Products', 'In Stock', 40, 'Weekly', '2024-11-11'),
    ('Feline Treats', 'Food', 'Low Stock', 5, 'Monthly', '2024-09-05'),
    ('Dog Leash', 'Pet Products', 'In Stock', 20, 'As Needed', '2024-08-15'),
    ('Aquarium Light', 'Pet Products', 'In Stock', 7, 'As Needed', '2024-10-10'),
    ('Tennis Ball', 'Pet Products', 'In Stock', 50, 'Weekly', '2024-11-12'),
    ('Catnip', 'Pet Products', 'Low Stock', 4, 'As Needed', '2024-11-03'),
    ('Bird Perch', 'Pet Products', 'In Stock', 11, 'Monthly', '2024-09-30'),
    ('Fish Net', 'Pet Products', 'In Stock', 15, 'As Needed', '2024-11-04');
