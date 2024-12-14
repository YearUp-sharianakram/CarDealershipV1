DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

CREATE TABLE dealerships(
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE vehicles(
	VIN VARCHAR(17) PRIMARY KEY,
    model VARCHAR(50),
    type VARCHAR(50),
    year INT,
    SOLD BOOLEAN
);

CREATE TABLE inventory(
	dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lease_start_date DATE,
    lease_end_date DATE,
    monthly_payment DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Populate Dealerships
INSERT INTO dealerships (name, address, phone) VALUES
('Sunshine Motors', '123 Elm St, Springfield', '123-456-7890'),
('Moonlight Autos', '456 Oak St, Rivertown', '987-654-3210'),
('Starline Cars', '789 Pine St, Hillview', '555-123-4567'),
('Galaxy Auto Center', '321 Maple Ave, Greenfield', '444-987-6543'),
('Cosmos Dealership', '654 Cedar Rd, Lakeside', '333-222-1111');

-- Populate Vehicles
INSERT INTO vehicles (VIN, model, type, year, SOLD) VALUES
('1HGCM82633A123456', 'Civic', 'Sedan', 2020, FALSE),
('1HGCM82633A654321', 'Accord', 'Sedan', 2019, TRUE),
('2T1BURHE8JC123789', 'Corolla', 'Sedan', 2021, FALSE),
('5YJSA1E45FF123987', 'Model S', 'Electric', 2023, TRUE),
('3VWDP7AJ7DM456321', 'Jetta', 'Sedan', 2018, TRUE),
('1FTFW1ET1EKF12345', 'F-150', 'Truck', 2022, FALSE),
('1C4PJMDB1FW789123', 'Cherokee', 'SUV', 2020, TRUE),
('4S4BSENC3J3456789', 'Outback', 'SUV', 2019, FALSE),
('JHMZE2H58AS111111', 'Insight', 'Hybrid', 2022, TRUE),
('WBA3C1C55DF654789', '3 Series', 'Sedan', 2019, FALSE);

-- Populate Inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(2, '1HGCM82633A654321'),
(3, '2T1BURHE8JC123789'),
(4, '5YJSA1E45FF123987'),
(1, '3VWDP7AJ7DM456321'),
(5, '1FTFW1ET1EKF12345'),
(3, '1C4PJMDB1FW789123'),
(2, '4S4BSENC3J3456789'),
(4, 'JHMZE2H58AS111111'),
(5, 'WBA3C1C55DF654789');

-- Populate Sales Contracts
INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('1HGCM82633A654321', '2023-01-15', 25000.00),
('5YJSA1E45FF123987', '2023-06-20', 75000.00),
('3VWDP7AJ7DM456321', '2022-11-05', 19000.00),
('1C4PJMDB1FW789123', '2021-07-12', 32000.00),
('JHMZE2H58AS111111', '2023-03-10', 28000.00);

-- Populate Lease Contracts
INSERT INTO lease_contracts (VIN, lease_start_date, lease_end_date, monthly_payment) VALUES
('1HGCM82633A123456', '2023-09-01', '2026-09-01', 300.00),
('2T1BURHE8JC123789', '2022-08-01', '2025-08-01', 275.00),
('4S4BSENC3J3456789', '2021-05-01', '2024-05-01', 350.00),
('1FTFW1ET1EKF12345', '2023-10-01', '2026-10-01', 400.00),
('WBA3C1C55DF654789', '2022-03-01', '2025-03-01', 450.00);

