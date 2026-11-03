# SmonsalvoBarbershop

## 

## Technologies Used: SQL Server (T-SQL), SSMS, Power BI







This is an independent exercise made by me after the "Introduction to MS SQL" module of Coursera's certification "Data Analytics: Professional" : [Análisis de datos: Profesional | Coursera](https://www.coursera.org/programs/base-de-datos-1-l427r/learning-path/data-analytics-professional-vo496?collectionId=sfg3Z)



I did it because I wanted to focus more on the SQL and queries part and felt the module's exercise wasn't enough.

normalization.md explains some design decisions. [3NF notes](docs/normalization.md)



er\_diagram\_draft.png shows the er diagram made before writing any query. !\[ER diagram](docs/er\_diagram\_draft.png)



powerbi\_model shows the er diagram in power bi !\[Power BI ER diagram](docs/powerbi\_model.png)



## How to Run:

1. `sql/01\_schema.sql` (WARNING: drops and recreates the `SmonsalvoBarbershop` database)
2. `sql/02\_seed\_data.sql`
3. `sql/04\_queries.sql`
4. `sql/05\_transactions.sql`
* \*Do not run `sql/03\_schema\_changes.sql`: it is only a history of the design.
* In `05\_transactions.sql`, the second block fails on purpose (a negative price violates the CHECK) to show that the whole transaction is rolled back.





## Scope and Next Steps:



This exercise covers basic SQL: DDL/DML, constraints, joins and transactions. Aggregations, views, stored procedures and CTEs are planned for the advanced SQL exercise.

## 

## Repo Structure:

```SmonsalvoBarbershop/ 
├── README.md 
├── sql/ (01-05) 
└── docs/ (er\_diagram.png, normalization.md)

