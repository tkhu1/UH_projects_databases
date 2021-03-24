/* Q1. CREATIONS */

/* Q1.a Create the following table */
CREATE TABLE Customer (
	CustomerID 			INTEGER,
	CustomerName 		VARCHAR(75),
	CustomerAddress 	VARCHAR(75),
	CustomerCity		VARCHAR(75),
	CustomerState		VARCHAR(75),
	CustomerPostalCode	VARCHAR(75),
	CustomerEmail		VARCHAR(75),
	CustomerUserName 	VARCHAR(75),
	CustomerPassword 	VARCHAR(75),
	PRIMARY KEY (CustomerID)
);

/* Q1.a Create the following table */
CREATE TABLE Territory (
	TerritoryID		INTEGER,
	TerritoryName	VARCHAR(75),
	PRIMARY KEY (TerritoryID)
);

/* Q1.a Create the following table */
CREATE TABLE Salesperson (
	SalespersonID			INTEGER,
	SalespersonName			VARCHAR(75),
	SalespersonPhone		VARCHAR(75),
	SalespersonEmail	 	VARCHAR(75),
	SalespersonUserName 	VARCHAR(75),
	SalespersonPassword 	VARCHAR(75),
	TerritoryID   			INTEGER,
	PRIMARY KEY (SalespersonID),
	FOREIGN KEY (TerritoryID) REFERENCES 
		Territory(TerritoryID)
);

/* Q1.a Create the following table */
CREATE TABLE DoesBusinessIn (
	CustomerID		INTEGER,
	TerritoryID		INTEGER,
	FOREIGN KEY (CustomerID) REFERENCES 
		Customer(CustomerID),
	FOREIGN KEY (TerritoryID) REFERENCES 
		Territory(TerritoryID)
);

/* Q1.a Create the following table */
CREATE TABLE ProductLine (
	ProductLineID 		INTEGER,
	ProductLineName 	VARCHAR(75),
	PRIMARY KEY (ProductLineID)
);

/* Q1.a Create the following table */
CREATE TABLE Product (
	ProductID				INTEGER,
	ProductName      		VARCHAR(75),
	ProductFinish      		VARCHAR(75),
  	ProductStandardPrice 	FLOAT(24),
	ProductLineID   		INTEGER,
  	Photo 					VARCHAR(75),
	PRIMARY KEY (ProductID),
	FOREIGN KEY (ProductLineID) REFERENCES 
		ProductLine(ProductLineID)
);

/* Q1.a Create the following table */
CREATE TABLE Orders (
	OrderID			INTEGER,
	OrderDate		DATE,
	CustomerID   	INTEGER,
	PRIMARY KEY (OrderID),
	FOREIGN KEY (CustomerID) REFERENCES 
		Customer(CustomerID)
);

/* Q1.a Create the following table */
CREATE TABLE OrderLine (
	OrderID   			INTEGER,
	ProductID      		INTEGER,
	OrderedQuantity		INTEGER,
	SalePrice			FLOAT(24),
	FOREIGN KEY (ProductID) REFERENCES 
		Product(ProductID),
	FOREIGN KEY (OrderID) REFERENCES 
		Orders(OrderID)
);

/* Q1.a Create the following table */
CREATE TABLE PriceUpdate (
	PriceUpdateID     	INTEGER,
	DateChanged  		DATE,
  	OldPrice 			FLOAT(24),
  	NewPrice 			FLOAT(24),
PRIMARY KEY (PriceUpdateID)
);

/* Q1.a Create the following view */
CREATE VIEW ProductLineSalesREPORT AS
	SELECT
		L.ProductID,
		SUM(L.OrderedQuantity) TotalAmountSoldToDate
	FROM
		OrderLine L
	GROUP BY
		L.ProductID;

/* Q1.a Create the following view */		
CREATE VIEW TotalValueForProductsREPORT AS
	SELECT
		L.ProductID,
		SUM(L.OrderedQuantity * L.SalePrice) TotalValueSoldToDate
	FROM
		OrderLine L
	GROUP BY
		L.ProductID;

/* Q1.a Create the following view */		
CREATE VIEW DataForCustomerREPORT AS
	SELECT
		B.CustomerID,
		P.ProductID,
		P.ProductName,
		P.ProductStandardPrice
	FROM
		DoesBusinessIn B, Territory T, Product P
	WHERE 
		T.TerritoryID = B.TerritoryID;

/* Q1.a Create the following view */		
CREATE VIEW CustomerByStatesShipmentREPORT AS
	SELECT
		C.CustomerState State,
		COUNT(*) NumberOfCustomers
	FROM
		Customer C
	GROUP BY
		C.CustomerState;

/* Q1.a Create the following view */
CREATE VIEW PastPurchaseHistoryREPORT AS
	SELECT
		O.OrderID,
		O.OrderDate,
		P.ProductName,
		OL.OrderedQuantity,
		OL.SalePrice
	FROM
		Orders O, OrderLine OL, Product P
	WHERE
		OL.ProductID = P.ProductID;
		
/* Q2. INSERTIONS */

/* Q2. Inserts data into Customer table */
INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125', 'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(15, 'Janet’s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', '', '', '');

INSERT INTO Customer(CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, CustomerEmail, CustomerUserName, CustomerPassword) 
VALUES(16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', '', '', '');

/* Q2. Inserts data into Territory table */
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES(1, 'SouthEast');
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES(2, 'SouthWest');
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES(3, 'NorthEast');
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES(4, 'NorthWest');
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES(5, 'Central');

/* Q2. Inserts data into DoesBusinessIn table */
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(1, 1);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(2, 2);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(3, 3);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(4, 4);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(5, 5);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(6, 1);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES(7, 2);

/* Q2. Inserts data into Salesperson table */
INSERT INTO Salesperson(SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, SalespersonPassword, TerritoryID) 
VALUES(1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1);

INSERT INTO Salesperson(SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, SalespersonPassword, TerritoryID) 
VALUES(2, 'Robert Lewis', '8139264006', '', '', '', 2);

INSERT INTO Salesperson(SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, SalespersonPassword, TerritoryID) 
VALUES(3, 'William Strong', '5053821212', '', '', '', 3);

INSERT INTO Salesperson(SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, SalespersonPassword, TerritoryID) 
VALUES(4, 'Julie Dawson', '4355346677', '', '', '', 4);

INSERT INTO Salesperson(SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, SalespersonPassword, TerritoryID) 
VALUES(5, 'Jacob Winslow', '2238973498', '', '', '', 5);

/* Q2. Inserts data into ProductLine table */
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES(1, 'Cherry Tree');
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES(2, 'Scandinavia');
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES(3, 'Country Look');

/* Q2. Inserts data into Product table */
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(1, 'End Table', 'Cherry', 175, 1, 'table.jpg');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(2, 'Coffee Table', 'Natural Ash', 200, 2, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(3, 'Computer Desk', 'Natural Ash', 375, 2, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(4, 'Entertainment Center', 'Natural Maple', 650, 3, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(5, 'Writers Desk', 'Cherry', 325, 1, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(6, '8-Drawer Desk', 'White Ash', 750, 2, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(7, 'Dining Table', 'Natural Ash', 800, 2, '');

INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
VALUES(8, 'Computer Desk', 'Walnut', 250, 3, '');

/* Q2. Inserts data into Orders table */
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1001, '21/Aug/16', 1);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1002, '21/Jul/16', 8);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1003, '22/ Aug/16', 15);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1004, '22/Oct/16', 5);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1005, '24/Jul/16', 3);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1006, '24/Oct/16', 2);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1007, '27/ Aug/16', 5);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1008, '30/Oct/16', 12);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1009, '05/Nov/16', 4);
INSERT INTO Orders(OrderID, OrderDate, CustomerID) VALUES(1010, '05/Nov/16', 1);

/* Q2. Inserts data into OrderLine table */
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1001, 1, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1001, 2, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1001, 4, 1, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1002, 3, 5, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1003, 3, 3, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1004, 6, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1004, 8, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1005, 4, 4, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1006, 4, 1, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1006, 5, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1006, 7, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1007, 1, 3, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1007, 2, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1008, 3, 3, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1008, 8, 3, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1009, 4, 2, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1009, 7, 3, '');
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity, SalePrice) VALUES(1010, 8, 10, '');

/* Q3. SQL QUERIES */

/* Q3.1. Which products have a standard price of less than $ 275?
	PRODUCTID		PRODUCTNAME			PRODUCTSTANDARDPRICE 
	1				End Table 			175 
	2				Coffee Table		200 
	8				Computer Desk 		250 
*/
SELECT P.ProductID, P.ProductName, P.ProductStandardPrice
FROM Product P
WHERE P.ProductStandardPrice < 275;

/* Q3.2. List the unit price, product name, and product ID for all products in the Product table. 
	PRODUCTSTANDARDPRICE		PRODUCTNAME				PRODUCTID 
	175							End Table				1 
	200							Coffee Table			2 
	375							Computer Desk			3 
	650							Entertainment Center	4 
	325							Writers Desk			5 
	750							8-Drawer Desk			6 
	800							Dining Table			7 
	250							Computer Desk			8 
*/
SELECT P.ProductStandardPrice, P.ProductName, P.ProductID
FROM Product P;

/* Q3.3. What is the average standard price for all products in inventory? 
	AverageStandardPrice 
	440.625
*/
SELECT AVG(P.ProductStandardPrice) AS AverageStandardPrice
FROM Product P;

/* Q3.4. How many different items were ordered on order number 1004?  
	PRODUCTID			ORDEREDQUANTITY
	6					2
	8					2
*/
SELECT OL.ProductID, OL.OrderedQuantity
FROM OrderLine OL
WHERE OL.OrderID = 1004;

/* Q3.5. Which orders have been placed since 10/ 24/ 2010? 
	ORDERID			ORDERDATE
	1001			21/Aug/16 
	1002			21/Jul/16 
	1003			22/ Aug/16 
	1004			22/Oct/16 
	1005			24/Jul/16 
	1006			24/Oct/16 
	1007			27/ Aug/16 
	1008			30/Oct/16 
	1009			05/Nov/16 
	1010			05/Nov/16 
*/
SELECT O.OrderID, O.OrderDate
FROM Orders O
WHERE O.OrderDate > '24/OCT/2010';

/* Q3.6. What furniture does COSC3380 carry that isn�t made of cherry? 
	PRODUCTID			PRODUCTNAME				PRODUCTFINISH
	2					Coffee Table			Natural Ash 
	3					Computer Desk			Natural Ash 
	4					Entertainment Center	Natural Maple 
	6					8-Drawer Desk			White Ash 
	7					Dining Table			Natural Ash 
	8					Computer Desk			Walnut 

*/
SELECT P.ProductID, P.ProductName, P.ProductFinish
FROM Product P
WHERE P.ProductFinish <> 'Cherry';

/* Q3.7. List product name, finish, and standard price for all desks and all tables that cost more than $ 300 in the Product table. 
	PRODUCTID			PRODUCTNAME				PRODUCTFINISH			PRODUCTSTANDARDPRICE
	3					Computer Desk			Natural Ash 			375
	5					Writers Desk			Cherry					325
	6					8-Drawer Desk			White Ash 				750
	7					Dining Table			Natural Ash 			800
*/
SELECT P.ProductID, P.ProductName, P.ProductFinish, P.ProductStandardPrice
FROM Product P
WHERE (P.ProductNAME LIKE '%Desk' OR P.ProductNAME LIKE '%Table') AND (P.ProductStandardPrice > 300); 

/* Q3.8. Which products in the Product table have a standard price between $ 200 and $ 300?  
	PRODUCTID			PRODUCTNAME				PRODUCTSTANDARDPRICE
	2					Coffee Table			200 
	8					Computer Desk			250

*/
SELECT P.ProductID, P.ProductName, P.ProductStandardPrice
FROM Product P
WHERE (P.ProductStandardPrice >= 200 AND P.ProductStandardPrice <= 300); 

/* Q3.9. List customer, city, and state for all customers in the Customer table whose address is Florida, Texas, California, 
         or Hawaii. List the customers alphabetically by state and alphabetically by customer within each state.  
		 
	CUSTOMERNAME				CUSTOMERCITY			CUSTOMERSTATE
	Impressions					Sacramento				CA 
	Contemporary Casuals		Gainesville				FL 
	Flanigan Furniture			Ft Walton Beach			FL 
	Value Furnitures			Plano					TX 
*/
SELECT C.CustomerName, C.CustomerCity, C.CustomerState
FROM Customer C
WHERE (C.CustomerState = 'FL' OR C.CustomerState = 'TX' OR C.CustomerState = 'CA' OR C.CustomerState = 'HI')
ORDER BY C.CustomerState, C.CustomerName;

/* Q3.10. Count the number of customers with addresses in each state to which we ship.   
	CUSTOMERSTATE				NumberOfCustomers
	CA							1
	CO							1
	FL							2
	Il							1
	NJ							1
	NM							2
	NY							4
	TX							1
	VA							1
*/
SELECT C.CustomerState, COUNT(*) AS NumberOfCustomers
FROM Customer C
GROUP BY C.CustomerState
ORDER BY C.CustomerState;

/* Q3.11. Count the number of customers with addresses in each city to which we ship. List the cities by state.    
	CUSTOMERCITY			CUSTOMERSTATE			NumberOfCustomers
	Sacramento				CA						1
	Boulder					CO						1
	Ft Walton Beach			FL						1
	Gainesville				FL						1
	Oak Brook				Il						1
	Carteret				NJ						1
	Farmington				NM						1
	Las Cruces				NM						1
	Albany					NY						1
	Rome					NY						2
	Syracuse				NY						1
	Plano					TX						1
	Virginia Beach			VA						1
*/
SELECT C.CustomerCity, C.CustomerState, COUNT(CustomerID) AS NumberOfCustomers
FROM Customer C
GROUP BY C.CustomerCity, C.CustomerState
ORDER BY C.CustomerState;

/* Q3.12. Find only states with more than one customer.    
	CUSTOMERSTATE				NumberOfCustomers
	FL							2
	NM							2
	NY							4
*/
SELECT C.CustomerState, COUNT(C.CustomerState) AS NumberOfCustomers
FROM Customer C
GROUP BY C.CustomerState
HAVING COUNT(C.CustomerState) > 1
ORDER BY C.CustomerState;

/* Q3.13. List, in alphabetical order, the product finish and the average standard price for each finish for selected 
          finishes having an average standard price less than 750.   
		  
	PRODUCTFINISH			AVERAGESTANDARDPRICE
	Cherry					250
	Natural Ash				458.33
	Natural Maple			650
	Walnut					250
	
	NOTE THE CAST AND ROUND FUNCTIONS TO ROUND AVERAGESTANDARDPRICE TO TWO DECIMAL PLACES
*/
SELECT P.ProductFinish, cast(ROUND(AVG(P.ProductStandardPrice), 2) as numeric(20, 2)) AS AverageStandardPrice
FROM Product P
GROUP BY P.ProductFinish
HAVING AVG(P.ProductStandardPrice) < 750
ORDER BY P.ProductFinish;

/* Q3.14. What is the total value of orders placed for each furniture product?  
	PRODUCTID		TOTALVALUEORDERED
	1				875
	2				800
	3				4125
	4				5200
	5				650
	6				1500
	7				4000
	8				3750
	
	NOTE THE UPDATE QUERY TO COPY THE PRODUCT.PRODUCTSTANDARDPRICE TO ORDERLINE.SALESPRICE
*/
UPDATE OrderLine
SET SalePrice = (SELECT Product.ProductStandardPrice FROM Product WHERE OrderLine.ProductID = Product.ProductID);

SELECT OL.ProductID, SUM(OL.SalePrice * OL.OrderedQuantity) AS TotalValueOrdered
FROM OrderLine OL
GROUP BY OL.ProductID
ORDER BY OL.ProductID;

/* Q4. TRIGGERS AND PROCEDURES */

/* Q4a. Create a simple procedure ProductLineSale, to be used by that will set a sale price to the existing Product table 
in the COSC3380 Database by adding a new column, SalePrice DECIMAL (6,2), that will hold the sale price for the products:  
	PRODUCTID		SalePrice
	1				148.75
	2				170
	3				318.75
	4				585
	5				276.25
	6				675
	7				720
	8				212.5
	
	NOTE that EXECUTE IMMEDIATE must be used to alter the table then update the values at compile time
*/
CREATE OR REPLACE PROCEDURE ProductLineSale
AS
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Product ADD SalePrice DECIMAL(6,2)';
    
    EXECUTE IMMEDIATE 'UPDATE Product SET SalePrice = (CASE
                                                            WHEN ProductStandardPrice >= 400 THEN (ProductStandardPrice*0.9)
                                                            ELSE (ProductStandardPrice*0.85)
                                                        END)';  
    
END;

/* Q4b. Run the ProductLineSale procedure in Oracle.
*/
EXEC ProductLineSale;

/* Q4c. Display the contents of the PRODUCT table.
*/
SELECT *
FROM Product;

/* Q4a. The inventory manager needs to know (the action of being informed) when an inventory item's standard price is updated
in the Product table (the event). After creating a new table, PriceUpdates, write a trigger that enters each product when it
is updated, the date that the change was made, and the new standard price that was entered. 
*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate
	AFTER UPDATE OF ProductStandardPrice ON Product 
    REFERENCING NEW AS NEW OLD AS OLD
    FOR EACH ROW
DECLARE
    UpdateID INTEGER;
BEGIN
	IF :NEW.ProductStandardPrice != :OLD.ProductStandardPrice THEN
        UpdateID := abs(dbms_random.random);
		INSERT INTO PriceUpdate VALUES (UpdateID, :NEW.ProductName, CURRENT_TIMESTAMP, :OLD.ProductStandardPrice, :NEW.ProductStandardPrice);
	END IF;
END;

/* Q4b. Run the trigger named StandardPriceUpdate. 
        NOTE that the following scripts test the trigger.
*/
UPDATE Product
SET ProductStandardPrice = 375
WHERE ProductID = 1;

UPDATE Product
SET ProductStandardPrice = 425
WHERE ProductID = 4;

UPDATE Product
SET ProductStandardPrice = 175
WHERE ProductID = 1;

UPDATE Product
SET ProductStandardPrice = 650
WHERE ProductID = 4;


/* Resets database for future use */
Restore database (Tables):
DROP TABLE Salesperson;
DROP TABLE Territory;
DROP TABLE DoesBusinessIn;
DROP TABLE ProductLine;
DROP TABLE Product;
DROP TABLE OrderLine;
DROP TABLE Orders;
DROP TABLE Customer;
DROP TABLE PriceUpdate;
DROP VIEW ProductLineSalesREPORT;
DROP VIEW TotalValueForProductsREPORT;
DROP VIEW DataForCustomerREPORT;
DROP VIEW CustomerByStatesShipmentREPORT;
DROP VIEW PastPurchaseHistoryREPORT;