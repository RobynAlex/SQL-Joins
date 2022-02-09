/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM reviews;
SELECT * FROM sales;
SELECT * FROM employees;

SELECT p.Name AS 'Product Name', c.Name AS 'Category Name'
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName AS 'First Name', e.LastName AS 'Last Name', SUM(s.Quantity) AS Total
FROM sales AS s
JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.FirstName, e.LastName;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM departments AS d
JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT * FROM products
WHERE products.Name LIKE '%Hotel California';

SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', (p.Price * SUM(s.Quantity)) AS 'Total Price Sold'
FROM products AS p
JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE '%Hotel California'
GROUP BY p.Name, p.Price;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'Product Name', r.Reviewer, r.Rating, r.Comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%visio%' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.employeeID, e.FirstName AS 'First Name', e.LastName AS 'Last Name', p.Name AS 'Name', SUM(s.Quantity) AS 'Total Sold'
FROM sales AS s
JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY SUM(s.Quantity) DESC;
