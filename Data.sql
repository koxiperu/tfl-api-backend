-- ============================================
-- Terra Food Loop (TFL) - Sample Data Script
-- ============================================
-- This script populates the database with realistic sample data
-- Run this AFTER your Spring Boot app has created the schema
-- ============================================

-- Clear existing data (in correct order due to foreign keys)
DELETE FROM tfl_listing;
DELETE FROM users;

-- Reset sequences
ALTER SEQUENCE tfl_listing_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;

-- ============================================
-- USERS
-- ============================================
-- Password for all users: "password123" (hashed with BCrypt)
-- Hash: $2a$10$N9qo8uLOickgx2ZMRZoMyeIIlxZCLN/BcfCrGHHZJ5k2a0dVqBYqm

-- BUSINESS USERS (7)
INSERT INTO users (username, email, password, role, business_name, business_address, business_phone) VALUES
('bakery1', 'contact@freshbakery.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Fresh Start Bakery', '15 Rue de la Boulangerie, L-1234 Luxembourg', '+352 26 12 34 56'),

('restaurant1', 'info@greenleaf.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Green Leaf Restaurant', '42 Avenue de la Liberté, L-1930 Luxembourg', '+352 26 87 65 43'),

('supermarket1', 'manager@dailymart.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Daily Mart Supermarket', '128 Route Esch, L-1470 Luxembourg', '+352 27 11 22 33'),

('cafe1', 'hello@cozybean.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Cozy Bean Café', '8 Rue Philippe II, L-2340 Luxembourg', '+352 26 44 55 66'),

('pizzeria1', 'orders@bellapizza.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Bella Pizza', '33 Rue de Hollerich, L-1740 Luxembourg', '+352 28 99 88 77'),

('hotel1', 'kitchen@grandhotel.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Grand Hotel Luxembourg', '5 Boulevard Royal, L-2449 Luxembourg', '+352 29 33 44 55'),

('caterer1', 'contact@deluxecatering.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'BUSINESS', 
 'Deluxe Catering Services', '67 Rue de Bonnevoie, L-1260 Luxembourg', '+352 26 77 88 99');

-- CONSUMER USERS (3)
INSERT INTO users (username, email, password, role) VALUES
('consumer1', 'marie.muller@email.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'CONSUMER'),
('consumer2', 'jean.schmidt@email.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'CONSUMER'),
('consumer3', 'anna.weber@email.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'CONSUMER');

-- ADMIN USER (1)
INSERT INTO users (username, email, password, role) VALUES
('admin', 'admin@terrafoodloop.lu', '$2a$10$QE4KwxhpBuAhgZeiaDo2O.wwzR8WWkMRWh2yHOxtxTi3MtVaGYqbq', 'ADMIN');


-- ============================================
-- FOOD LISTINGS
-- ============================================

-- Fresh Start Bakery (business_id = 1) - 5 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Fresh Artisan Bread', 'Assorted artisan breads baked this morning. Includes sourdough, whole wheat, and multigrain loaves. Perfect for families!', 
 12, '2026-01-14 20:00:00', '18:00-19:30', 'AVAILABLE', 1),

('Croissants & Pastries', 'Butter croissants, pain au chocolat, and almond croissants from today''s batch. Still warm and delicious!', 
 25, '2026-01-14 19:00:00', '17:00-18:30', 'AVAILABLE', 1),

('Sandwich Baguettes', 'Fresh baguettes perfect for sandwiches. Baked this afternoon. Great for lunch tomorrow!', 
 8, '2026-01-04 21:00:00', '19:00-20:00', 'AVAILABLE', 1),

('Assorted Muffins', 'Blueberry, chocolate chip, and banana muffins. Baked yesterday but still fresh and tasty.', 
 15, '2026-01-14 18:00:00', '16:00-17:30', 'CLAIMED', 1),

('Day-Old Bread Bundle', 'Mix of yesterday''s bread - still good for toast or bread pudding. Great value!', 
 10, '2026-01-13 20:00:00', '17:00-18:00', 'COMPLETED', 1);

-- Green Leaf Restaurant (business_id = 2) - 4 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Vegetable Stir-Fry', 'Large portion of fresh vegetable stir-fry with tofu. Made with organic seasonal vegetables. Reheat and enjoy!', 
 6, '2026-01-14 22:00:00', '20:00-21:00', 'AVAILABLE', 2),

('Greek Salad Bowls', 'Fresh Greek salads with feta, olives, cucumbers, and tomatoes. Perfect light dinner or lunch.', 
 8, '2025-01-14 20:00:00', '18:30-20:00', 'AVAILABLE', 2),

('Lentil Soup', 'Homemade lentil soup, vegan and healthy. Comes in individual containers. Just heat and serve.', 
 10, '2026-01-15 13:00:00', '11:00-12:30', 'AVAILABLE', 2),

('Pasta Primavera', 'Penne pasta with seasonal vegetables in light tomato sauce. Vegetarian-friendly.', 
 5, '2026-01-14 21:00:00', '19:00-20:30', 'CLAIMED', 2);

-- Daily Mart Supermarket (business_id = 3) - 6 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Fresh Produce Box', 'Mixed box of fresh fruits and vegetables nearing best-before date. Apples, carrots, lettuce, tomatoes, bananas.', 
 15, '2026-01-15 18:00:00', '16:00-17:30', 'AVAILABLE', 3),

('Dairy Products Bundle', 'Milk, yogurt, and cheese approaching expiry date. All still perfectly safe to consume for 2-3 days.', 
 20, '2026-01-15 20:00:00', '18:00-19:30', 'AVAILABLE', 3),

('Ready-Made Sandwiches', 'Pre-packaged sandwiches from our deli counter. Best consumed today. Various fillings available.', 
 30, '2026-01-14 18:00:00', '16:30-17:30', 'AVAILABLE', 3),

('Bakery End-of-Day', 'Assorted bread rolls, baguettes, and sweet pastries from our in-store bakery. End of day surplus.', 
 25, '2026-01-04 21:00:00', '19:30-20:30', 'AVAILABLE', 3),

('Meat & Deli Pack', 'Packaged deli meats and prepared meat products nearing sell-by date. Still fresh and safe.', 
 12, '2026-01-15 19:00:00', '17:00-18:30', 'AVAILABLE', 3),

('Fresh Juice Bottles', 'Fresh-pressed orange and apple juice bottles. Best before tomorrow but perfectly good!', 
 18, '2026-01-15 14:00:00', '12:00-13:30', 'CLAIMED', 3);

-- Cozy Bean Café (business_id = 4) - 3 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Panini & Wraps', 'Grilled vegetable paninis and chicken wraps from our lunch service. Made fresh this morning.', 
 10, '2026-01-14 19:00:00', '17:00-18:30', 'AVAILABLE', 4),

('Cake Slices', 'Various cake slices: carrot cake, chocolate cake, lemon drizzle. Perfect with afternoon tea!', 
 12, '2026-01-15 18:00:00', '16:00-17:30', 'AVAILABLE', 4),

('Breakfast Bagels', 'Assorted bagels with cream cheese spreads. Great for tomorrow''s breakfast!', 
 8, '2026-01-14 20:00:00', '18:00-19:00', 'CLAIMED', 4);

-- Bella Pizza (business_id = 5) - 4 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Large Margherita Pizzas', 'Classic margherita pizzas, freshly baked. Perfect for dinner tonight or reheat tomorrow!', 
 6, '2026-01-14 22:00:00', '20:00-21:30', 'AVAILABLE', 5),

('Mixed Pizza Slices', 'Assorted pizza slices - pepperoni, vegetarian, quattro formaggi. From lunch service.', 
 15, '2026-01-14 20:00:00', '18:00-19:30', 'AVAILABLE', 5),

('Garlic Bread & Sides', 'Garlic bread sticks and side salads. Perfect accompaniment to any meal.', 
 10, '2026-01-14 21:00:00', '19:00-20:30', 'AVAILABLE', 5),

('Calzones', 'Folded pizza calzones with various fillings: cheese, ham, vegetables. Ready to eat or freeze.', 
 8, '2026-01-05 13:00:00', '11:30-13:00', 'CLAIMED', 5);

-- Grand Hotel Luxembourg (business_id = 6) - 3 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Breakfast Buffet Surplus', 'Assorted items from our breakfast buffet: pastries, fruits, yogurt, cereals. All fresh from this morning.', 
 20, '2026-01-14 14:00:00', '11:00-12:30', 'AVAILABLE', 6),

('Gourmet Meal Portions', 'Restaurant-quality main courses: salmon, chicken, vegetarian options. Professionally prepared.', 
 8, '2026-01-14 21:00:00', '19:30-21:00', 'AVAILABLE', 6),

('Dessert Selection', 'Assorted desserts from our restaurant: tiramisu, crème brûlée, fruit tarts. Individually packaged.', 
 10, '2026-01-14 22:00:00', '20:00-21:30', 'AVAILABLE', 6);

-- Deluxe Catering Services (business_id = 7) - 4 listings
INSERT INTO tfl_listing (title, description, quantity, expiry_date, pickup_time, status, business_id) VALUES
('Sandwich Platters', 'Assorted finger sandwiches on fresh bread: chicken, tuna, egg salad, vegetarian. From today''s event.', 
 30, '2026-01-14 19:00:00', '17:00-18:30', 'AVAILABLE', 7),

('Appetizer Trays', 'Mixed appetizers: mini quiches, spring rolls, stuffed mushrooms. Perfect for parties or family meals.', 
 15, '2026-01-14 20:00:00', '18:00-19:30', 'AVAILABLE', 7),

('Main Course Containers', 'Bulk portions of main courses: pasta dishes, rice dishes, curry. From corporate event.', 
 12, '2026-01-14 21:00:00', '19:00-20:30', 'AVAILABLE', 7),

('Fresh Fruit Platters', 'Beautifully arranged fresh fruit platters. From morning event, still perfectly fresh.', 
 8, '2026-01-14 18:00:00', '16:00-17:30', 'CLAIMED', 7);