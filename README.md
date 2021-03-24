**SQL database for a mock furniture company**

Developed a database in SQL and PHP for a mock furniture company called COSC3380. The textual analysis and ERD model are attached as files. The SQL commands are attached as a *.sql file.

**CLIENT REQUIREMENTS**

From a study of the business processes at COSC3380, the following data needs to be stored in the database: 

 - COSC3380 sells a number of different furniture products. These products are grouped into several product lines. The identifier for a product is Product ID, whereas the identifier for a product line is Product Line ID. COSC3380 identified the following additional attributes for product: Product Nam, Product Finish, Product Standard Price, and photo. Another attribute for product line is Product Line Name. A product line may group any number of products but must group at least one product. Each product must belong to exactly one product line. 

 - Customers submit orders for products. The identifier for an order is Order ID, and another attribute is Order Date. A customer may submit any number of orders but need not submit any orders. Each order is submitted by exactly one customer. The identifier for a customer is Customer ID. Other attributes include Customer Name, Customer Address, Customer City, Customer State, Customer Postal Code, Customer Email, Customer Username, and Customer Password (to store the login information).

 - A given customer order must request at least one product and only one product per order line item. Any product sold by COSC3380 may not appear on any order line item or may appear on one or more order line items. An attribute associated with each order line item is Ordered Quantity. 

 - COSC3380 has established sales territories for its customers. Each customer may do business in any number of these sales territories or may not do business in any territory. A sales territory has one to many customers. The identifier for a sales territory is Territory ID and an attribute is Territory Name. 

 - COSC3380 has several Sales Persons. The identifier for a Sales Person is Sales Person ID. Other attributes include Sales Person Name, Sales Person Telephone, Sales Person Email, Sales Person Username, and Sales Person Password (to store the login information).

 - A Sales Person serves exactly one sales territory. Each sales territory is served by one or more Sales Persons. 

 - Customers are a person or an organization that buys or may potentially buy products from COSC3380. An order is the purchase of one or more products by a customer. A product is an item that COSC3380 makes and sells. An order line is details about each product sold on a particular customer order (such as quantity and price).

 - Each customer can place any number of orders. Conversely, each order is placed by exactly one customer. Each order contains any number of order lines. Conversely, each order line is contained in exactly one order. Each product has any number of order lines. Conversely, each order line is for exactly one product.
 
**VIEWS**

The reports that a Product Manager will need:
 - Product Line Sales Comparison Report (a list of each of the products in the COSC3380 product line showing each product’s total sales to date.)
 - Total Value for Products Report (what is the total value of orders placed for each furniture product).
 
The reports that an Inventory Manager will need:
 - Customer by States Shipment Report (Count the number of customers with addresses in each state to which we ship).
 
The reports that the sales people will need:
 - Data for Customer Report (for each customer in his territory produce the list of products and their prices).
 
The reports that the customers will need:
 - Past Purchase History Report (list the customer’s purchase history displaying the order date, the quantity, the price, and the name of the product).

**TRIGGERS** 

 - The Inventory Manager needs to know (the action of being informed) when an inventory item’s standard price is updated in the Product table (the event). This is done by a trigger called StandardPriceUpdate that enters each product name when it is updated, the date that the change was made, the old price and the new standard price that was entered into the table PriceUpdates. 
 
**PROCEDURES**

 - The procedure ProductLineSale is used to set a sale price to the existing Product table in the COSC3380 Database by adding a new column, SalePrice DECIMAL (6,2), that will hold the sale price for the products. The ProductLineSale procedure scans all rows of the Product table. Products with a ProductStandardPrice of $400 or higher are discounted 10 percent, and products with a ProductStandardPrice of less than $400 are discounted 15 percent. 
 
**WEB PAGES**
 - Created a simple Web Page whose purpose is to display SalestoDate from the database, a report that will be used by the Product Manager (product ID, product description, #number of times the product was ordered).