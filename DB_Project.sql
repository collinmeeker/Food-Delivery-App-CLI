DROP DATABASE IF EXISTS DB_Project;
CREATE DATABASE `DB_Project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `DB_Project`;

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    birthday DATE,
    address TEXT,
    payment VARCHAR(255)
);

CREATE TABLE Drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    vehicle VARCHAR(255) NOT NULL,
    rating DECIMAL(3,2),
    availability BOOLEAN,
    phone_number VARCHAR(20)
);


CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Menu (
    menu_id INT AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    PRIMARY KEY (menu_id, restaurant_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_number VARCHAR(255) UNIQUE NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'delivered', 'cancelled') NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),  -- Corrected reference
    FOREIGN KEY (customer_id) REFERENCES Customer(id)  -- Corrected table name and reference
);


CREATE TABLE Pickup (
    pickup_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    pickup_time TIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Delivery (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    driver_id INT,
    restaurant_id INT,
    delivery_address VARCHAR(255) NOT NULL,
    driver_tip DECIMAL(6,2),
    delivery_time TIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);


INSERT INTO Customer (name, email, phone_number, password, birthday, address, payment) VALUES
('John Doe', 'johndoe@example.com', '123-456-7890', 'hashed_password', '1985-10-12', '1234 Elm St, Yourtown', 'Credit Card'),
('Jane Smith', 'janesmith@example.com', '987-654-3210', 'another_password', '1990-07-23', '5678 Maple St, Othertown', 'PayPal'),
('Emily Johnson', 'emilyjohnson@example.com', '234-567-8901', 'pass_em123', '1993-03-10', '2468 Oak Lane, Mytown', 'Debit Card'),
('Michael Brown', 'michaelbrown@example.com', '345-678-9012', 'pass_mi456', '1988-04-15', '1357 Pine Street, Anytown', 'Credit Card'),
('Rachel Green', 'rachelgreen@example.com', '456-789-0123', 'pass_ra789', '1995-08-19', '9753 Maple Avenue, Thistown', 'E-Wallet'),
('Joshua Knight', 'joshuaknight@example.com', '567-890-1234', 'pass_jo012', '1992-11-08', '8642 Birch Road, Hometown', 'PayPal'),
('Samantha White', 'samanthawhite@example.com', '678-901-2345', 'pass_sa345', '1986-06-24', '7531 Walnut Street, Yourcity', 'Credit Card'),
('Lucas Black', 'lucasblack@example.com', '789-012-3456', 'pass_lu678', '1991-09-17', '1594 Cedar Blvd, Newcity', 'Debit Card'),
('Olivia Brown', 'oliviabrown@example.com', '890-123-4567', 'pass_ol901', '1994-12-28', '3216 Spruce Lane, Oldtown', 'Credit Card'),
('Daniel Blue', 'danielblue@example.com', '901-234-5678', 'pass_da234', '1989-02-13', '2583 Oak Circle, Cooltown', 'E-Wallet'),
('Grace Carter', 'gracecarter@example.com', '012-345-6789', 'pass_gr567', '1987-05-30', '9876 Elm St, Nicetown', 'Credit Card'),
('Ethan Hunt', 'ethanhunt@example.com', '123-555-7890', 'pass_et890', '1992-07-22', '1230 Maple Drive, Sometown', 'Credit Card'),
('Isabella Clark', 'isabellaclark@example.com', '234-666-8901', 'pass_is012', '1993-10-05', '2469 Pine Lane, Westcity', 'Debit Card'),
('William Smith', 'williamsmith@example.com', '345-777-9012', 'pass_wi345', '1985-03-18', '1358 Spruce Street, Easttown', 'Credit Card'),
('Sophia Hill', 'sophiahill@example.com', '456-888-0123', 'pass_so678', '1996-01-29', '9754 Maple Avenue, Northcity', 'E-Wallet'),
('Christopher Fox', 'christopherfox@example.com', '567-999-1234', 'pass_ch901', '1990-11-11', '8643 Birch Road, Southtown', 'PayPal'),
('Emma Stone', 'emmastone@example.com', '678-000-2345', 'pass_em234', '1984-06-15', '7532 Walnut Street, Coolcity', 'Credit Card'),
('James Wilson', 'jameswilson@example.com', '789-111-3456', 'pass_ja567', '1991-08-20', '1595 Cedar Blvd, Nicecity', 'Debit Card'),
('Mia Davis', 'miadavis@example.com', '890-222-4567', 'pass_mi678', '1994-12-12', '3217 Spruce Lane, Newtown', 'Credit Card'),
('David Lee', 'davidlee@example.com', '901-333-5678', 'pass_da789', '1987-02-23', '2584 Oak Circle, Mycity', 'E-Wallet'),
('Charlotte Brown', 'charlottebrown@example.com', '012-444-6789', 'pass_ch890', '1986-05-18', '9877 Elm St, Oldcity', 'Credit Card'),
('Benjamin King', 'benjaminking@example.com', '123-555-0000', 'pass_be012', '1990-07-14', '1231 Maple Drive, Yourtown', 'PayPal');



INSERT INTO Drivers (name, vehicle, rating, availability, phone_number) VALUES
('Alice Johnson', 'Toyota Prius', 4.5, TRUE, '321-456-9870'),
('Bob Lee', 'Honda Civic', 4.7, FALSE, '654-321-4567'),
('Diana Prince', 'Chevrolet Bolt', 4.8, TRUE, '202-555-0147'),
('Clark Kent', 'Ford Escape', 4.3, TRUE, '212-555-0123'),
('Bruce Wayne', 'Tesla Model S', 4.9, FALSE, '213-555-0164'),
('Barry Allen', 'Nissan Leaf', 4.2, TRUE, '214-555-0183'),
('Hal Jordan', 'Volkswagen e-Golf', 4.4, TRUE, '215-555-0192'),
('Arthur Curry', 'Hyundai Ioniq', 4.1, FALSE, '216-555-0148'),
('Victor Stone', 'Kia Soul EV', 4.6, TRUE, '217-555-0139'),
('Oliver Queen', 'BMW i3', 4.5, TRUE, '218-555-0174'),
('Ray Palmer', 'Fiat 500e', 4.3, FALSE, '219-555-0153'),
('John Stewart', 'Chevrolet Spark', 4.4, TRUE, '220-555-0167'),
('Billy Batson', 'Honda Insight', 4.2, TRUE, '221-555-0138'),
('Peter Parker', 'Toyota Corolla', 4.7, TRUE, '222-555-0159'),
('Wade Wilson', 'Ford Focus', 4.5, FALSE, '223-555-0176'),
('Matt Murdock', 'Subaru Crosstrek', 4.3, TRUE, '224-555-0145'),
('Jessica Jones', 'Mazda 3', 4.6, TRUE, '225-555-0199'),
('Luke Cage', 'Dodge Charger', 4.4, FALSE, '226-555-0117'),
('Danny Rand', 'Lexus RX', 4.7, TRUE, '227-555-0133'),
('Frank Castle', 'Jeep Wrangler', 4.2, TRUE, '228-555-0191'),
('TChalla Udaku', 'Acura MDX', 4.9, FALSE, '229-555-0165'),
('Stephen Strange', 'Toyota Camry', 4.8, TRUE, '230-555-0144');



INSERT INTO Restaurants (name, address) VALUES
('Good Eats', '123 Food Lane'),
('Tasty Treats', '456 Snack Blvd'),
('Savory Sensations', '789 Taste Street'),
('Pasta Palace', '101 Noodle Avenue'),
('Grill Master', '202 BBQ Road'),
('Fresh Feast', '303 Vegan Way'),
('Spice Symphony', '404 Curry Trail'),
('Bread and Breakfast', '505 Morning Lane'),
('Fine Dine Wine', '606 Elegant Place'),
('Happy Sushi', '707 Seafood Shore'),
('Pizza Corner', '808 Cheesy Circle'),
('Bistro Bites', '909 Petite Plaza'),
('Cake Cafe', '121 Pastry Path'),
('Steak House', '232 T-Bone Terrace'),
('Gourmet Gallery', '343 Fancy Fair'),
('Soup Spoon', '454 Broth Boulevard'),
('Salad Shack', '565 Lettuce Lane'),
('Fry Fry', '676 Crispy Court'),
('Dumpling Den', '787 Wrapper Way'),
('Taco Tower', '898 Spicy Street'),
('Choco Chateau', '999 Cocoa Castle'),
('Berry Bakery', '111 Berry Boulevard');



INSERT INTO Orders (restaurant_id, customer_id, order_number, order_date, status) VALUES
(1, 1, 'ORDER001', '2023-04-01', 'delivered'),
(2, 2, 'ORDER002', '2023-04-02', 'pending'),
(3, 3, 'ORDER003', '2023-04-03', 'delivered'),
(5, 4, 'ORDER004', '2023-04-04', 'confirmed'),
(1, 5, 'ORDER005', '2023-04-05', 'cancelled'),
(2, 6, 'ORDER006', '2023-04-06', 'pending'),
(1, 7, 'ORDER007', '2023-04-07', 'delivered'),
(3, 8, 'ORDER008', '2023-04-08', 'confirmed'),
(1, 9, 'ORDER009', '2023-04-09', 'delivered'),
(2, 10, 'ORDER010', '2023-04-10', 'pending'),
(5, 11, 'ORDER011', '2023-04-11', 'delivered'),
(2, 12, 'ORDER012', '2023-04-12',  'confirmed'),
(3, 13, 'ORDER013', '2023-04-13', 'cancelled'),
(4, 14, 'ORDER014', '2023-04-14',  'pending'),
(1, 15, 'ORDER015', '2023-04-15', 'delivered'),
(4, 16, 'ORDER016', '2023-04-16', 'confirmed'),
(1, 17, 'ORDER017', '2023-04-17',  'delivered'),
(2, 18, 'ORDER018', '2023-04-18',  'pending'),
(5, 19, 'ORDER019', '2023-04-19',  'delivered'),
(2, 20, 'ORDER020', '2023-04-20',  'confirmed'),
(6, 21, 'ORDER021', '2023-04-21',  'cancelled'),
(2, 22, 'ORDER022', '2023-04-22',  'pending');


INSERT INTO Menu (restaurant_id, item_name, description, price) VALUES
(1, 'Burger', 'A classic burger with cheese', 9.99),
(1, 'Pizza', 'Large pepperoni pizza', 12.99),
(2, 'Chicken Salad', 'Grilled chicken on a bed of mixed greens with a choice of dressing', 10.99),
(2, 'Fish Tacos', 'Two soft tacos with grilled fish, cabbage slaw, and a spicy aioli', 11.99),
(3, 'Steak Sandwich', 'Grilled steak with caramelized onions and melted cheese', 13.99),
(3, 'Veggie Wrap', 'A healthy wrap filled with fresh vegetables and hummus', 8.99),
(4, 'Pasta Primavera', 'Pasta with seasonal vegetables in a light tomato sauce', 12.99),
(4, 'Calzone', 'Stuffed pizza with ham, cheese, and marinara sauce', 10.99),
(5, 'Caesar Salad', 'Classic Caesar salad with croutons and parmesan cheese', 9.99),
(5, 'BBQ Chicken Pizza', 'Pizza with barbecue sauce, chicken, and red onions', 13.99),
(6, 'Meatball Sub', 'Sub sandwich with homemade meatballs and marinara sauce', 11.99),
(6, 'Margarita Pizza', 'Simple pizza with tomato, basil, and fresh mozzarella', 11.99),
(7, 'Grilled Salmon', 'Freshly grilled salmon with a lemon herb seasoning', 15.99),
(7, 'Quinoa Salad', 'Organic quinoa with cucumbers, tomatoes, and feta cheese', 9.99),
(8, 'Spicy Ramen', 'Traditional Japanese noodles in a spicy broth with toppings', 12.99),
(8, 'Club Sandwich', 'Triple-layered sandwich with turkey, bacon, lettuce, and tomato', 10.99),
(9, 'Mac and Cheese', 'Creamy baked macaroni and cheese with a crispy topping', 8.99),
(9, 'Stuffed Mushrooms', 'Mushrooms filled with herbs, cheese, and breadcrumbs', 7.99),
(10, 'Garlic Bread', 'Toasty bread with garlic butter and parmesan cheese', 4.99),
(10, 'Caprese Salad', 'Sliced tomatoes, mozzarella, basil, and balsamic glaze', 10.99),
(11, 'Panini', 'Grilled panini with ham, cheese, and a variety of toppings', 9.99),
(11, 'Gelato', 'Italian ice cream in various flavors', 5.99);


INSERT INTO Pickup (order_id, pickup_time) VALUES
(1, '12:00:00'),
(2, '12:30:00'),
(3, '13:00:00'),
(4, '13:30:00'),
(5, '14:00:00'),
(6, '14:30:00'),
(7, '15:00:00'),
(8, '15:30:00'),
(9, '16:00:00'),
(10, '16:30:00'),
(11, '17:00:00'),
(12, '17:30:00'),
(13, '18:00:00'),
(14, '18:30:00'),
(15, '19:00:00'),
(16, '19:30:00'),
(17, '20:00:00'),
(18, '20:30:00'),
(19, '21:00:00'),
(20, '21:30:00'),
(21, '22:00:00'),
(22, '22:30:00');



INSERT INTO Delivery (order_id, driver_id, restaurant_id, delivery_address, driver_tip, delivery_time) VALUES
(1, 1, 1, '1234 Elm St, Yourtown', 3.00, '12:45:00'),
(2, 2, 2, '5678 Maple St, Othertown', 5.00, '13:15:00'),
(3, 3, 1, '789 Pine Rd, Newtown', 2.50, '12:50:00'),
(4, 4, 2, '910 Cedar Ave, Westside', 4.00, '13:20:00'),
(5, 5, 1, '1112 Oak St, Eastside', 3.75, '13:55:00'),
(6, 1, 2, '1314 Spruce St, Southtown', 2.25, '14:10:00'),
(7, 2, 1, '1516 Birch Blvd, Northtown', 5.50, '14:25:00'),
(8, 3, 2, '1718 Elm Lane, Yourtown', 3.00, '14:40:00'),
(9, 4, 1, '1920 Maple Circle, Othertown', 4.50, '15:05:00'),
(10, 5, 2, '2122 Pine Drive, Newtown', 2.00, '15:20:00'),
(11, 1, 1, '2324 Cedar Path, Westside', 4.75, '15:35:00'),
(12, 2, 2, '2526 Oak Way, Eastside', 3.25, '15:50:00'),
(13, 3, 1, '2728 Spruce Route, Southtown', 4.00, '16:15:00'),
(14, 4, 2, '2930 Birch Ave, Northtown', 2.50, '16:30:00'),
(15, 5, 1, '3132 Elm St, Yourtown', 5.25, '16:45:00'),
(16, 1, 2, '3334 Maple St, Othertown', 3.00, '17:00:00'),
(17, 2, 1, '3536 Pine Lane, Newtown', 4.20, '17:15:00'),
(18, 3, 2, '3738 Cedar Blvd, Westside', 3.75, '17:30:00'),
(19, 4, 1, '3940 Oak Court, Eastside', 2.85, '17:45:00'),
(20, 5, 2, '4142 Spruce Way, Southtown', 5.00, '18:00:00'),
(21, 1, 1, '4344 Birch St, Northtown', 3.50, '18:15:00'),
(22, 2, 2, '4546 Elm Path, Yourtown', 4.15, '18:30:00');



INSERT INTO Reviews (driver_id, customer_id, rating, comments, review_date) VALUES
(1, 1, 5, 'Great and timely delivery!', '2023-04-01'),
(2, 2, 4, 'Good service, but a bit late.', '2023-04-02'),
(3, 3, 5, 'Exceptionally fast delivery!', '2023-04-03'),
(4, 4, 3, 'Driver was polite, but the order was mixed up.', '2023-04-04'),
(5, 5, 4, 'Pretty good service overall.', '2023-04-05'),
(1, 6, 2, 'Much delayed and no communication.', '2023-04-06'),
(2, 7, 5, 'Perfect delivery, very friendly.', '2023-04-07'),
(3, 8, 4, 'Fast delivery but forgot condiments.', '2023-04-08'),
(4, 9, 3, 'Average service, could be faster.', '2023-04-09'),
(5, 10, 5, 'Couldn’t have asked for a better experience!', '2023-04-10'),
(1, 11, 4, 'Solid service, will use again.', '2023-04-11'),
(2, 12, 3, 'Okay, but driver took a wrong turn.', '2023-04-12'),
(3, 13, 5, 'Super quick and super polite!', '2023-04-13'),
(4, 14, 1, 'Terrible. Late and cold food.', '2023-04-14'),
(5, 15, 4, 'Good job, arrived right on time.', '2023-04-15'),
(1, 16, 5, 'Impressive service, very professional.', '2023-04-16'),
(2, 17, 2, 'Delivery was late and order incomplete.', '2023-04-17'),
(3, 18, 5, 'Excellent! Very friendly and quick.', '2023-04-18'),
(4, 19, 3, 'Service was fine, nothing special.', '2023-04-19'),
(5, 20, 4, 'Very courteous and on time.', '2023-04-20'),
(1, 21, 5, 'Fantastic service, highly recommend.', '2023-04-21'),
(2, 22, 3, 'Decent, but food was not hot.', '2023-04-22');

-- Insert items for ORDER001 from Restaurant 1 (Burger, Pizza)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(1, 1, 2),  -- 2 Burgers
(1, 2, 1);  -- 1 Pizza

-- Insert items for ORDER002 from Restaurant 2 (Chicken Salad, Fish Tacos)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(2, 3, 1),  -- 1 Chicken Salad
(2, 4, 2);  -- 2 Fish Tacos

-- Insert items for ORDER003 from Restaurant 3 (Steak Sandwich, Veggie Wrap)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(3, 5, 1),  -- 1 Steak Sandwich
(3, 6, 3);  -- 3 Veggie Wraps

-- Insert items for ORDER004 from Restaurant 5 (Caesar Salad, BBQ Chicken Pizza)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(4, 9, 1),  -- 1 Caesar Salad
(4, 10, 1);  -- 1 BBQ Chicken Pizza

-- Continuing the pattern for a few more orders
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(5, 1, 1),  -- 1 Burger
(5, 2, 1);  -- 1 Pizza

INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(6, 3, 2),  -- 2 Chicken Salad
(6, 4, 1);  -- 1 Fish Taco

-- And so on for other orders, matching restaurant menus to orders
-- Insert items for ORDER007, ORDER009, and ORDER015 from Restaurant 1 (Burger, Pizza)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(7, 1, 1),  -- 1 Burger
(7, 2, 2),  -- 2 Pizzas
(9, 1, 2),  -- 2 Burgers
(9, 2, 1),  -- 1 Pizza
(15, 1, 3),  -- 3 Burgers
(15, 2, 1);  -- 1 Pizza

-- Insert items for ORDER008 and ORDER018 from Restaurant 3 (Steak Sandwich, Veggie Wrap)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(8, 5, 1),  -- 1 Steak Sandwich
(8, 6, 1),  -- 1 Veggie Wrap
(18, 5, 2),  -- 2 Steak Sandwiches
(18, 6, 2);  -- 2 Veggie Wraps

-- Insert items for ORDER011 and ORDER019 from Restaurant 5 (Caesar Salad, BBQ Chicken Pizza)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(11, 9, 1),  -- 1 Caesar Salad
(11, 10, 2),  -- 2 BBQ Chicken Pizzas
(19, 9, 3),  -- 3 Caesar Salads
(19, 10, 1);  -- 1 BBQ Chicken Pizza

-- Insert items for ORDER016 from Restaurant 4 (Pasta Primavera, Calzone)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(16, 7, 1),  -- 1 Pasta Primavera
(16, 8, 1);  -- 1 Calzone

-- Insert items for ORDER020 from Restaurant 2 (Chicken Salad, Fish Tacos)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(20, 3, 1),  -- 1 Chicken Salad
(20, 4, 1);  -- 1 Fish Taco

-- Insert items for ORDER022 also from Restaurant 2 (more Chicken Salad, Fish Tacos)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(22, 3, 2),  -- 2 Chicken Salads
(22, 4, 3);  -- 3 Fish Tacos
-- Insert items for ORDER010 and ORDER014 from Restaurant 2 (Chicken Salad, Fish Tacos)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(10, 3, 2),  -- 2 Chicken Salads
(10, 4, 3),  -- 3 Fish Tacos
(14, 3, 1),  -- 1 Chicken Salad
(14, 4, 1);  -- 1 Fish Taco

-- Insert items for ORDER012 and ORDER021 from Restaurant 2 (also Chicken Salad, Fish Tacos)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(12, 3, 2),  -- 2 Chicken Salads
(12, 4, 1),  -- 1 Fish Taco
(21, 3, 1),  -- 1 Chicken Salad
(21, 4, 2);  -- 2 Fish Tacos

-- Insert items for ORDER013 from Restaurant 3 (Steak Sandwich, Veggie Wrap)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(13, 5, 1),  -- 1 Steak Sandwich
(13, 6, 1);  -- 1 Veggie Wrap

-- Insert items for ORDER017 from Restaurant 1 (Burger, Pizza)
INSERT INTO Order_Items (order_id, menu_id, quantity) VALUES
(17, 1, 1),  -- 1 Burger
(17, 2, 2);  -- 2 Pizzas


CREATE INDEX idx_customer_email ON Customer(email);

CREATE INDEX idx_restaurant_name ON Restaurants(name);
CREATE INDEX idx_menu_restaurant_id ON Menu(restaurant_id);

CREATE INDEX idx_orders_restaurant_id ON Orders(restaurant_id);
CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
CREATE INDEX idx_orders_order_number ON Orders(order_number);

CREATE INDEX idx_delivery_order_id ON Delivery(order_id);
CREATE INDEX idx_delivery_driver_id ON Delivery(driver_id);
CREATE INDEX idx_delivery_restaurant_id ON Delivery(restaurant_id);

-- Change the delimiter to avoid confusion with semicolons inside the procedure
DELIMITER $$

-- Define the stored procedure
CREATE PROCEDURE AddCustomer(
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_phone_number VARCHAR(20),
    IN p_password VARCHAR(255),
    IN p_birthday DATE,
    IN p_address TEXT,
    IN p_payment VARCHAR(255)
)
BEGIN
    INSERT INTO Customer (name, email, phone_number, password, birthday, address, payment)
    VALUES (p_name, p_email, p_phone_number, p_password, p_birthday, p_address, p_payment);
END$$

-- Reset the delimiter back to semicolon
DELIMITER ;
