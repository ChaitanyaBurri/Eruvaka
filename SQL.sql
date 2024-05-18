use project;

/* 1st Query - Find the Main_Business with highest total profit*/
SELECT b.Main_Business, SUM(s.Profit_per_week) AS Total_Profit
FROM business b
JOIN store st ON b.BT_ID = st.BT_ID
JOIN sales s ON st.Store_Id = s.Store_ID
GROUP BY b.Main_Business
ORDER BY Total_Profit DESC
LIMIT 1;

/* 2nd Query - List top 3 sales executives with highest sales */
SELECT S.se_id, S.SE_Name, SUM(sl.Sales_per_Week) AS Highest_Sales
FROM se_details S
JOIN store st ON S.SE_ID = st.SE_ID
JOIN sales sl ON st.Store_Id = sl.Store_ID
GROUP BY S.se_id , S.SE_Name
ORDER BY Highest_Sales DESC
LIMIT 3;


/* 3rd query - Which product has the highest margin  */

SELECT Product_ID,Product_Name,(Product_Price - Cost_Price) as HighestMargin FROM 
product order by HighestMargin desc limit 1 ;

/* 4th query- Which store has the least sales */
SELECT St.store_name, min(S.sales_per_week) as Minsales from store st, sales S
where st.Store_Id = S.Store_ID group by St.store_name ORDER BY Minsales asc limit 1 ;

/* 5th query - List the top ten best selling products */

SELECT p.product_name,Max(S.sales_per_week) as HighestSales 
FROM  product p, sales S where P.product_id = s.product_id group by p.Product_Name order by HighestSales
desc limit 10 ;

/* 6th Query - Most profitable Pincode*/

SELECT
    b.City,
    b.State,
    b.PinCode,
    SUM(s.Profit_per_week) AS Total_Profit
FROM
    building AS b
INNER JOIN
    store AS st ON b.Building_ID = st.Building_ID
INNER JOIN
    sales AS s ON st.Store_Id = s.Store_Id
GROUP BY
    b.Region, b.City, b.State, b.PinCode
ORDER BY
    Total_Profit DESC limit 3;
    
    /* 7th Query Determine top 3 selling Product Types */
    
    SELECT p.Product_Type, SUM(s.Profit_per_week) AS TotalProfit FROM sales s
    JOIN product p ON s.Product_ID = p.Product_ID GROUP BY p.Product_Type
	ORDER BY TotalProfit DESC;
    
/* 8th Query Which Product has the Lowest Margin */

SELECT Product_ID,Product_Name,(Product_Price - Cost_Price) as LowestMargin FROM 
product order by LowestMargin asc limit 1 ;    
    
    /* 9th Query : In how many stores are the top 10 products being sold */
    
    SELECT p.Product_Name,
    COUNT(DISTINCT s.Store_ID) AS StoresCount FROM
    product p LEFT JOIN sales s ON p.Product_ID = s.Product_ID GROUP BY
    p.Product_Name order by StoresCount desc limit 12;
    
    /* 10th Query -  Which Store has maximum number of products sold */
    
    select P.Product_name, count(s.Product_ID) No_products from product p, sales s  where P.product_id = s.Product_ID
    group by P.Product_name order by No_products desc limit 1; 
    
    /* 11th Query - which outlet has most stores */
 
SELECT O.Outlet_ID, O.Outlet_Location_Type,count(S.Store_Id) HighestStores from outlet O, store S 
where O.Outlet_ID = S.Outlet_ID Group By O.Outlet_ID,O.Outlet_Location_Type 
order by HighestStores desc limit 2;
