--Library database project

--create table 
CREATE TABLE books(
	Book_ID INT PRIMARY KEY, --FK
	Title VARCHAR(70),
	Author VARCHAR(40),
	Genre VARCHAR(20),
	Published_Year INT,
	Price FLOAT,
	Stock INT
);

CREATE TABLE customers(
Customer_ID INT PRIMARY KEY,
Name VARCHAR(30),
Email VARCHAR(40),
Phone INT,
City VARCHAR(30),
Country VARCHAR(60)
);

CREATE TABLE orders(
	C INT PRIMARY KEY,
	Customer_ID INT REFERENCES customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount FLOAT
);

SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM books;

-- 1) Retrieve all books in the "Fiction" genre:
  SELECT * 
  FROM books
  WHERE genre = 'Fiction';


-- 2) Find books published after the year 1950:
 SELECT * 
 FROM books 
 WHERE published_year > 1950;

-- 3) List all customers from the Canada:
 SELECT * 
 FROM customers
 WHERE country = 'Canada';

-- 4) Show orders placed in November 2023:
 SELECT * 
 FROM orders
 WHERE order_date 
 BETWEEN '2023-11-01' AND '2023-11-30';
 
-- 5) Retrieve the total stock of books available:
 SELECT SUM(stock) 
 FROM books;

-- 6) Find the details of the most expensive book:
 SELECT * 
 FROM books
 ORDER BY price DESC
 LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
  SELECT c.*, o.*
  FROM orders o
  JOIN customers c 
  ON o.customer_id = c.customer_id
  WHERE o.quantity > 1;

  ---
  SELECT * 
  FROM orders
  WHERE quantity > 1;
   

-- 8) Retrieve all orders where the total amount exceeds $20:
 SELECT * 
 FROM orders
 WHERE total_amount > 20;

-- 9) List all genres available in the Books table:
 SELECT DISTINCT(genre) 
 FROM books;

-- 10) Find the book with the lowest stock:
SELECT * 
FROM orders
ORDER BY quantity ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT ROUND(SUM(total_amount))
from orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
 SELECT * FROM books
 SELECT b.genre, SUM(o.quantity) FROM orders o
 JOIN books b ON o.book_id = b.bOOK_id
 GROUP BY b.genre;
 
-- 2) Find the average price of books in the "Fantasy" genre:
SELECT ROUND(AVG(price)) AS Average_price_of_Fantasy FROM books
WHERE genre = 'Fantasy';


-- 3) List customers who have placed at least 2 orders:
SELECT * FROM orders
SELECT customer_id , COUNT(c) FROM orders
GROUP BY customer_id
HAVING COUNT(c) >= 2;


-- 4) Find the most frequently ordered book:
select book_id,COUNT(c) from orders
GROUP BY c
ORDER BY c ASC;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
 SELECT * FROM books
 WHERE genre = 'Fiction'
 ORDER BY price DESC
 LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
 SELECT b.author, SUM(o.quantity) AS total_quantity_sold 
 FROM orders o
 JOIN books b ON o.book_id = b.book_id
 GROUP BY b.author;
 

-- 7) List the cities where customers who spent over $30 are located:
 SELECT DISTINCT(c.city),total_amount
 FROM orders o
 JOIN customers c ON o.customer_id = c.customer_id
 WHERE o.total_amount > 30

-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id,c.name, ROUND(SUM(o.total_amount)) AS total_spent
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_spent DESC;

---Project complete

