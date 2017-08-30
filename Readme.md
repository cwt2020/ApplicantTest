# ApplicantTest

## Objective
Create an [ASP.NET MVC](https://www.asp.net/mvc) application in C# backed by MySQL using the base schema structure as described by the [applicant_test.sql](https://github.com/JW-RWatsonAssoc/ApplicantTest/blob/master/applicant_test.sql)

The application should be able to do the following:
* Display a list of orders
* Display an individual order

**_This task should be completed without using the CRUD scaffolding provided in Visual Studio (or any other IDE)._**

## Views
Views should be clean and have good structure, but do not need to be overly styled. Here are example screenshots of the two necessary views:

![Individual order view][Order]
![Order list view][OrdersList]
 
## Models
The individual order should calculate the total of the order and display it as well as the total quantity of items using the following model guidelines:

* An Order is made of a list of LineItems
* An Order has a User
* A LineItem has a Stock and a Unit of that Stock
* A User should have an address to bill to 

**__These relationships have been omitted from the sql file and the foreign keys and constraints will need to be recreated as part of this task.__**

Below is an example screenshot of the necessary database schema:
![Database schema][Schema]

Additionally, create a table for a User and link that to the Order. Display the User details on the 
individual order view. An example of this is shown in the above individual order view image.

## Bonus
Include one more feature not listed above:
* Write to the database

[Order]: https://github.com/JW-RWatsonAssoc/ApplicantTest/raw/master/Order.PNG "Order"
[OrdersList]: https://github.com/JW-RWatsonAssoc/ApplicantTest/raw/master/OrdersList.PNG "OrdersList"
[Schema]: https://github.com/JW-RWatsonAssoc/ApplicantTest/raw/master/Schema.PNG "Schema"
