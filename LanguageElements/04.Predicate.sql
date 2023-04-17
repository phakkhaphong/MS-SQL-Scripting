--Predicate
USE AdventureWorks;
GO

--กรองข้อมูล (ในประโยค WHERE และ/หรือ HAVING)

SELECT * FROM Person.Person 
WHERE MiddleName=NULL;


SELECT * FROM Person.Person 
WHERE MiddleName IS NOT NULL;

SELECT * FROM Person.Person 
WHERE PersonType='SP';

SELECT PersonType,COUNT(*) as cnt FROM Person.Person 
GROUP BY PersonType
HAVING COUNT(*)>5000;

--เทียบกับคิวรี่ย่อย

SELECT * FROM Sales.SalesOrderHeader as O
WHERE O.CustomerID IN
	(
		SELECT TOP 1 WITH TIES CustomerID FROM Sales.SalesOrderHeader 
		GROUP BY CustomerID
		ORDER BY COUNT(*) DESC
	)
ORDER BY CustomerID,SalesOrderID;


