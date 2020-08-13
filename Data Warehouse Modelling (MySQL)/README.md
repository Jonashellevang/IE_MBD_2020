# Data Warehouse Modelling
This was a group assignment where we as a group had to present a:
* Data Set analysis
* Data Warehouse Approach Selection
* Data Warehouse Design

## Data Set Analysis
We analyzed the dataset, detected duplicates and detect potential data quality issues such as missing values, incomplete values and errors. 

## Data Warehouse Approach Selection
We had to choose between using a corporate information, multidimensional approach or data vault approach in the assignment based on the assigned dataset.

## Data Warehouse Design
In this section we identify the entities based on our data vault approach (hubs, links and satellites), discussed the model and implemented the design with MySQL Workbench. 

For this dataset we chose data vault. In conclusion, the advantages of the snowflake schema in terms of querying are not significant to the use case. In terms of changing user requirements over time, the data vault provides more flexibility and through the ability to retain the original data structure, it’s better suited for regulation, which is the FCC’s (Federal Communications Commission in the US) purpose. Therefore, the data vault was chosen as the schema for the data warehouse.
