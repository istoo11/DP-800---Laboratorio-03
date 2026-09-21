 SELECT 
     ProductID,
     Name,
     Color,
     ListPrice
 FROM SalesLT.Product
 WHERE Color IS NOT NULL
 ORDER BY ListPrice DESC
 FOR JSON PATH;

 SELECT 
     p.ProductID,
     p.Name AS ProductName,
     p.ListPrice,
     JSON_OBJECT(
         'CategoryID': pc.ProductCategoryID,
         'CategoryName': pc.Name
     ) AS Category
 FROM SalesLT.Product AS p
 INNER JOIN SalesLT.ProductCategory AS pc
     ON p.ProductCategoryID = pc.ProductCategoryID
 ORDER BY p.ListPrice DESC
 FOR JSON PATH;