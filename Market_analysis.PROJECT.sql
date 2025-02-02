SELECT 
    a.Aisle,
    COUNT(p.Product_ID) AS Product_Count
FROM project_orders.aisles a
JOIN project_orders.products p ON a.Aisle_ID = p.Aisle_ID
GROUP BY a.Aisle_ID, a.Aisle
ORDER BY Product_Count DESC
LIMIT 10;

SELECT COUNT(DISTINCT Department_ID) AS Unique_Departments
FROM project_orders.departments;

SELECT 
    d.department,
    COUNT(p.Product_ID) AS Product_Count
FROM project_orders.departments d
JOIN project_orders.products p ON d.Department_ID = p.Department_ID
GROUP BY d.Department
ORDER BY Product_Count DESC;

SELECT 
    p.product_name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(CASE WHEN o.Reordered = 1 THEN 1 ELSE 0 END) AS Reorders,
    ROUND(SUM(CASE WHEN o.Reordered = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(o.Order_ID), 4) AS Reorder_Rate
FROM project_orders.products p
JOIN project_orders.order_products_train o 
    ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Reorder_Rate DESC, Total_Orders DESC
LIMIT 10;

SELECT COUNT(DISTINCT User_ID) AS Unique_Users
FROM project_orders.orders;

SELECT 
    User_ID,
    AVG(Days_Since_Prior_Order) AS Avg_Days_Between_Orders
FROM project_orders.orders
WHERE Days_Since_Prior_Order IS NOT NULL
GROUP BY User_ID;

SELECT 
    Order_Hour_Of_Day AS Hour_Of_Day,
    COUNT(Order_ID) AS Total_Orders
FROM project_orders.orders
GROUP BY Order_Hour_Of_Day
ORDER BY Total_Orders DESC;

SELECT 
    Order_Dow AS Day_Of_Week,
    COUNT(Order_ID) AS Total_Orders
FROM project_orders.orders
GROUP BY Order_Dow
ORDER BY Total_Orders DESC;

SELECT 
    p.Product_Name,
    COUNT(op.Order_ID) AS Total_Orders
FROM project_orders.order_products_train op
JOIN project_orders.products p ON op.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Orders DESC
LIMIT 10;

SELECT 
    d.department,
    COUNT(DISTINCT o.User_ID) AS Total_Users
FROM project_orders.orders o
JOIN project_orders.order_products_train op ON o.Order_ID = op.Order_ID
JOIN project_orders.products p ON op.Product_ID = p.Product_ID
JOIN project_orders.departments d ON p.Department_ID = d.Department_ID
GROUP BY d.department
ORDER BY Total_Users DESC;

SELECT 
    AVG(Product_Count) AS Average_Products_Per_Order
FROM (
    SELECT 
        o.Order_ID,
        COUNT(op.Product_ID) AS Product_Count
    FROM Order_Products op
    JOIN Orders o ON op.Order_ID = o.Order_ID
    GROUP BY o.Order_ID
) AS Order_Product_Counts;

SELECT 
    d.department,
    p.product_name,
    COUNT(op.Order_ID) AS Total_Reorders
FROM project_orders.order_products_train op
JOIN project_orders.orders o ON op.Order_ID = o.Order_ID
JOIN project_orders.products p ON op.Product_ID = p.Product_ID
JOIN project_orders.departments d ON p.Department_ID = d.Department_ID
WHERE op.Reordered = 1
GROUP BY d.department, p.product_name
ORDER BY d.department, Total_Reorders DESC;

SELECT 
    p.product_name,
    COUNT(op.Order_ID) AS Total_Reorders
FROM project_orders.order_products_train op
JOIN project_orders.orders o ON op.Order_ID = o.Order_ID
JOIN project_orders.products p ON op.Product_ID = p.Product_ID
WHERE op.Reordered = 1
GROUP BY p.product_name
HAVING COUNT(op.Order_ID) > 1;

SELECT 
    AVG(Product_Count) AS Average_Products_Per_Order
FROM (
    SELECT 
        o.Order_ID,
        COUNT(op.Product_ID) AS Product_Count
    FROM project_orders.order_products_train op
    JOIN project_orders.orders o ON op.Order_ID = o.Order_ID
    GROUP BY o.Order_ID
) AS Order_Product_Counts;

SELECT 
    Order_Hour_Of_Day AS Hour,
    COUNT(Order_ID) AS Total_Orders
FROM project_orders.orders
GROUP BY Order_Hour_Of_Day
ORDER BY Total_Orders DESC;

SELECT 
    Product_Count AS Order_Size,
    COUNT(Order_ID) AS Total_Orders
FROM (
    SELECT 
        o.Order_ID,
        COUNT(op.Product_ID) AS Product_Count
    FROM project_orders.order_products_train op
    JOIN project_orders.orders o ON op.Order_ID = o.Order_ID
    GROUP BY o.Order_ID
) AS Order_Product_Counts
GROUP BY Product_Count
ORDER BY Product_Count;

SELECT 
    a.aisle,
    AVG(op.Reordered) AS Avg_Reorder_Rate
FROM project_orders.order_products_train op
JOIN project_orders.products p ON op.Product_ID = p.Product_ID
JOIN project_orders.aisles a ON p.Aisle_ID = a.Aisle_ID
GROUP BY a.aisle
ORDER BY Avg_Reorder_Rate DESC;

SELECT 
    o.Order_DOW,
    AVG(Order_Size) AS Avg_Order_Size
FROM (
    SELECT 
        op.Order_ID,
        COUNT(op.Product_ID) AS Order_Size
    FROM project_orders.order_products_train op
    GROUP BY op.Order_ID
) AS OrderSizes
JOIN project_orders.orders o ON OrderSizes.Order_ID = o.Order_ID
GROUP BY o.Order_DOW
ORDER BY o.Order_DOW;

SELECT 
    User_ID,
    COUNT(Order_ID) AS Total_Orders
FROM project_orders.orders
GROUP BY User_ID
ORDER BY Total_Orders DESC
LIMIT 10;

SELECT 
    a.aisle,
    d.department,
    COUNT(p.Product_ID) AS Total_Products
FROM project_orders.products p
JOIN project_orders.aisles a ON p.Aisle_ID = a.Aisle_ID
JOIN project_orders.departments d ON p.Department_ID = d.Department_ID
GROUP BY a.aisle, d.department
ORDER BY d.department, a.aisle;
