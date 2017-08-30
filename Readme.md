Test:

Create an MVC Asp.net application in C# backed by Mysql using the base schema structure 
as described by the applicant_test.sql

it should be able to do the following:
 display a list of orders, 
 display an individual order

these views should be clean and have good structure but do not need to be overly styled
 
the individual order should calc the total of the order and display it as well as the total quantity of items

An Order is made of a list of LineItems
a LineItem has a linked Stock and a chosen Unit of that Stock

An Order should also have a linked User
A User should have an address to bill to 

these relationships have been omitted from the sql file
and the foreign keys and constraints will need to be recreated as part of this test

you also need to add a table for a User  
and link that to the Order and display those details on the 
individual order view. 

this should be done with out using the CRUD scaffolding provided in visual studio

include one more feature not listed above that writes to the database, 