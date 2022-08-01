/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT Products.Name AS ProductName, Categories.Name AS CategoryName
FROM Products
INNER JOIN Categories
ON Categories.CategoryID = Products.CategoryID
WHERE Categories.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT  employees.EmployeeID, employees.FirstName, employees.MiddleInitial, employees.LastName, Sum(sales.Quantity) AS Total
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the 
name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, Sum(sales.Quantity) AS Total, SUM(sales.Quantity * sales.PricePerUnit) AS TotalPrice
FROM products
INNER JOIN sales
ON sales.ProductID = products.ProductID
WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
INNER JOIN products
WHERE products.Name LIKE "%Visio%TV%"
ORDER BY reviews.Rating
LIMIT 3;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */