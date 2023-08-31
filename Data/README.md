**The folder contains the Data files which are input to the Python file Data_quality_check.ipynb used for data processing and cleaning.**

By exploring the data in the Python notebook I found the following data quality issue:-

**Data quality Issue 1 -**
Missing values are present in user, receipt, and brands which need to be addressed

**Data quality Issue 2 -**
There are duplicated records in the user file.

**Data quality Issue 3 -**
As the data dictionary, the role column should have a constant value as a 'consumer' but found an additional value 'fetch-staff' in the column.

**Data quality Issue 4 -**
Certain userID mentioned in the receipt file/table cannot be found in the user file/table.


**The output of the file is CSV file user.csv, brands.csv, receipt.csv, barcodescan.csv, and reviewneeded.csv which is fed to the database for query and gathering insight.**
