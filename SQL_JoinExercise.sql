/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT item.Name as Product, c.Name as Category -- look at only name of products and categories
FROM products as item -- start with products table
INNER JOIN categories as c ON c.CategoryID = item.CategoryID -- what the tables have in common
WHERE c.Name = 'Computers'; -- only put items that have the category name Computers
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 SELECT p.Name AS product, p.Price AS price, r.Rating AS rating 
 FROM products AS p
 INNER JOIN reviews AS r ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS TOTAL
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.Name
FROM departments AS d
INNER JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'GAMES';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT p.Name, SUM(s.Quantity) AS sold, SUM(s.PricePerUnit) AS profit
FROM products AS p
INNER JOIN sales AS s ON p.ProductID = s.ProductID
WHERE p.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.name, r.Reviewer, r.Rating, r.comment
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.Firstname, e.LastName, p.Name AS product, SUM(s.Quantity) AS sold
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;
