## Fetch-Rewards-Data-Analysis

**First: Review Existing Unstructured Data and Diagram a New Structured Relational Data Model** 

Fetch ER Diagram.svg

**Second: Write a query that directly answers a predetermined question from a business stakeholder**

For this task, I developed **PLSQL** code to create a Database and load all CSV files from the **'/CSV'** folder into the PLSQL database. 
Please refer to file -

**1.) db creation query.sql:** For query to create a database and load data in tables.

**2.)task 2 query.sql:** Consisting of all SQL query against our new structured relational data model.

**Third: Evaluate Data Quality Issues in the Data Provided**

For this task I had evaluated the data using python notebook Data_quality_check.ipynb located under **'/Data'** folder and found the following data quality issue:

**Data quality Issue 1 :**
Missing value are present in user,receipt,brands which need to be addressed

**Data quality Issue 2 :**
There are duplicated record in user file.

**Data quality Issue 3 :**
As the data dictionary the role column should have constant value as consumer but found additional value fetch-staff in the column.

**Data quality Issue 4 :**
Certain userID mentioned in receipt file/table cannot be found in user file/table.

**Fourth: Communicate with Stakeholders**

Please Refer to file: **Email _ Data Quality Update and Next Steps.pdf**

