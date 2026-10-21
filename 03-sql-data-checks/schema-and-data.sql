-- Synthetic dataset for SQL data-check practice (SQLite).
-- All names, emails, and values are invented. The data intentionally contains quality problems to find.

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  full_name   TEXT NOT NULL,
  email       TEXT,
  country     TEXT NOT NULL,
  created_at  TEXT NOT NULL
);

CREATE TABLE orders (
  order_id     INTEGER PRIMARY KEY,
  customer_id  INTEGER,
  order_date   TEXT NOT NULL,
  status       TEXT NOT NULL,      -- allowed: NEW, PAID, SHIPPED, CANCELLED
  total_amount REAL NOT NULL       -- should equal the sum of its order_items
);

CREATE TABLE order_items (
  item_id    INTEGER PRIMARY KEY,
  order_id   INTEGER NOT NULL,
  product    TEXT NOT NULL,
  quantity   INTEGER NOT NULL,     -- must be at least 1
  unit_price REAL NOT NULL         -- must be greater than 0
);

CREATE TABLE payments (
  payment_id INTEGER PRIMARY KEY,
  order_id   INTEGER NOT NULL,
  amount     REAL NOT NULL,
  paid_at    TEXT NOT NULL,
  method     TEXT NOT NULL         -- allowed: CARD, TRANSFER
);

INSERT INTO customers VALUES
 (1,  'Test User One',     'user1@example.com',  'Georgia', '2026-01-05'),
 (2,  'Test User Two',     'user2@example.com',  'Georgia', '2026-01-09'),
 (3,  'Test User Three',   'user3@example.com',  'Armenia', '2026-02-11'),
 (4,  'Test User Four',    NULL,                 'Turkey',  '2026-02-20'),
 (5,  'Test User Five',    'user5@example.com',  'Germany', '2026-03-02'),
 (6,  'Test User Six',     'user2@example.com',  'Georgia', '2026-03-15'),
 (7,  'Test User Seven',   'user7@example.com',  'Georgia', '2026-04-01'),
 (8,  'Test User Eight',   'user8@example',      'Armenia', '2026-04-18'),
 (9,  'Test User Nine',    'user9@example.com',  'Turkey',  '2026-05-07'),
 (10, 'Test User Ten',     'user10@example.com', 'Germany', '2026-05-30');

INSERT INTO orders VALUES
 (101, 1,  '2026-06-01', 'PAID',      45.00),
 (102, 2,  '2026-06-02', 'SHIPPED',   120.00),
 (103, 3,  '2026-06-03', 'PAID',      30.00),
 (104, 4,  '2026-06-04', 'NEW',       15.50),
 (105, 5,  '2026-06-05', 'PAID',      80.00),
 (106, 12, '2026-06-06', 'PAID',      25.00),
 (107, 7,  '2026-06-07', 'CANCELLED', 60.00),
 (108, 8,  '2026-06-08', 'PAID',      99.99),
 (109, 9,  '2027-01-15', 'NEW',       40.00),
 (110, 10, '2026-06-10', 'DELIVERED', 55.00),
 (111, 1,  '2026-06-11', 'PAID',      18.00),
 (112, 2,  '2026-06-12', 'PAID',      70.00);

INSERT INTO order_items VALUES
 (1,  101, 'Notebook',   3, 15.00),
 (2,  102, 'Backpack',   1, 100.00),
 (3,  102, 'Water bottle', 2, 10.00),
 (4,  103, 'Pen set',    2, 15.00),
 (5,  104, 'Mug',        1, 15.50),
 (6,  105, 'Headphones', 1, 75.00),
 (7,  106, 'Cable',      1, 25.00),
 (8,  107, 'Lamp',       2, 30.00),
 (9,  108, 'Keyboard',   1, 99.99),
 (10, 109, 'Mouse',      2, 20.00),
 (11, 110, 'Charger',    1, 55.00),
 (12, 111, 'Stickers',   0, 6.00),
 (13, 112, 'Desk mat',   1, 70.00),
 (14, 112, 'Coaster',    1, -5.00);

INSERT INTO payments VALUES
 (1001, 101, 45.00,  '2026-06-01', 'CARD'),
 (1002, 102, 120.00, '2026-06-02', 'TRANSFER'),
 (1003, 103, 30.00,  '2026-06-03', 'CARD'),
 (1004, 103, 30.00,  '2026-06-03', 'CARD'),
 (1005, 105, 80.00,  '2026-06-05', 'CARD'),
 (1006, 106, 25.00,  '2026-06-06', 'CASH'),
 (1007, 107, 60.00,  '2026-06-07', 'CARD'),
 (1008, 108, 99.99,  '2026-06-08', 'TRANSFER'),
 (1009, 111, 18.00,  '2026-06-11', 'CARD'),
 (1010, 999, 50.00,  '2026-06-12', 'CARD');
