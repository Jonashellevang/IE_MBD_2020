# Data Warehouse Modelling (MySQL)
This was the first group assignment out of two in "Business Intelligence and Datawarehousing" class where we as a group had to present a:
* Data Set analysis
* Data Warehouse Approach Selection
* Data Warehouse Design

![Logical Design](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Schema%20Logical%20Design.png)

### Data Set Analysis
We analyzed the dataset, detected duplicates and detected potential data quality issues such as missing values, incomplete values and errors. 

### Data Warehouse Approach Selection
We had to choose between using a corporate information, multidimensional approach or data vault approach in the assignment based on the assigned dataset.

### Data Warehouse Design
In this section we identified the entities based on our data vault approach (hubs, links and satellites), discussed the model and implemented the design with MySQL Workbench. 

For this dataset we chose data vault. In conclusion, the advantages of the snowflake schema in terms of querying are not significant to the use case. In terms of changing user requirements over time, the data vault provides more flexibility and through the ability to retain the original data structure, it’s better suited for regulation, which is the FCC’s (Federal Communications Commission in the US) purpose. Therefore, the data vault was chosen as the schema for the data warehouse.

The report can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Data%20Warehouse%20Design%20Report.pdf), and if that isn't enough, you can download the data warehouse design [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Data%20Vault%20Design.mwb).

### The Two Next Assignments:
* [Data Integration Design (Pentaho) - group project](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Integration%20Design%20(Pentaho))
* [Dashboard Design (Tableau) - individual project](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Visualization%20(Tableau%2CR%2CCarto%2CD3.js)/Dashboard%20Design%20(Tableau))
