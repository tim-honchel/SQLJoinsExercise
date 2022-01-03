/* 1 joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
 SELECT products.Name, categories.Name
 FROM products
 INNER JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.Name = "Computers"; 
 
/* 2 joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 INNER JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* 3 joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT employees.FirstName, employees.LastName, sum(sales.Quantity) AS "Sales Quantity"
FROM sales
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY sum(sales.Quantity) DESC;

/* 4 joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT departments.Name, categories.Name
FROM categories
INNER JOIN departments ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";

/* 5 joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT products.Name, sum(sales.Quantity) AS "#Sold", sum(sales.Quantity) * products.Price AS "$ Total Sales"
FROM sales
INNER JOIN products WHERE products.productID = sales.ProductID
GROUP BY products.productID
ORDER BY sum(sales.Quantity) * products.Price DESC;

/* 6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
INNER JOIN products ON reviews.ProductID = products.ProductID
WHERE products.Name = "Visio TV"
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) AS "# Sold"
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, products.productID
ORDER BY employees.FirstName, employees.LastName, products.Name;

