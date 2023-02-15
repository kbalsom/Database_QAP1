Written By: Kara Balsom

Date Written: Ocotber 7, 2022

A project written for QAP 1 of Database Programming and Data Processing (Semester 3).

This is a database with a small set of tables, example data and example queries. 

There are four main entities:

- Cities (id, name, state, population)

- Passengers (id, firstName, lastName, phoneNumber)

- Airports (id, name, code)

- Aircraft (id, type, airlineName, numberOfPassengers)

Key relationship information:

- Cities can have many airports

- Passengers and fly on many aircraft and live in one city

- Aircraft can have many passengers and land/take off from many Airports

- Airports can only be in one city

The SQL Statements answer the following questions:

- What airports are in what cities?

- List all aircraft passengers have travelled on?

- Which airports can aircraft take off from and land at?

- What airports have passengers used?

