# Asset-Management-Database-System
This project involves the conceptualisation, logic design, and implementation of a relational database for Nexus Asset Management (NAM), a firm specialising in segregated investment portfolios. The system is designed to manage complex financial relationships between high-net-worth clients, their various investment accounts, and the specific mandates that govern their portfolios.

**Business Logic & Rules**
The architecture of the database is built upon the following core business requirements:

**Client Management**: A centralised repository for individual and institutional clients.
**Account-Portfolio Linkage:** A strict 1:1 relationship where each investment account maps to exactly one managed portfolio.
**Investment Mandates:** Implementation of governance rules that define the constraints and permitted assets for each portfolio.
**Transaction Tracking:** Recording every trade (Buy/Sell) with full referential integrity to both the portfolio and the specific asset.
**Holding Management:** A dynamic tracking system for asset positions using composite primary keys to ensure data uniqueness and integrity.

**🛠️ Technical Implementation**
**Modelling**: Developed a Logical Entity-Relationship Diagram (ERD) using Crow's Foot notation.
**Normalisation:** The schema is designed to Third Normal Form (3NF) to eliminate data redundancy and prevent update/insertion anomalies.
**RDBMS:** Implemented and tested using PostgreSQL (pgAdmin 4).

**Key Features:**
**Composite Primary Keys**: Utilised in the Holding and Permitted_Asset tables to manage Many-to-Many (M:N) relationships.
**Referential Integrity:** Robust use of Foreign Keys to ensure that transactions and holdings are always tied to valid portfolios and assets.

**📂 Repository Contents**
/docs: Contains the formal business rules and the final ERD image.
/scripts/schema.sql: The DDL script used to generate the tables, primary keys, and constraints.
/scripts/seed.sql: Sample data to populate the environment for testing.
/scripts/queries.sql: Analytical queries for performance reporting and compliance checking.
