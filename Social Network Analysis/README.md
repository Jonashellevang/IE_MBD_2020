# Work Migration
When we decided to pick this data we were looking forward to the challenges this would bring us, but we had no idea how it all would turn out both for our business case or graphs. What it turned out to be, was a data that only really made sense to get some of the centrality-measures out of. In order to get data that made sense, we cleaned our data and removed the variables that was duplicate in a sense of how we wanted to present our data.

The data is LinkedIn data based on migration from countries. We had negative and positive values that showed us the net migration rate between countries. These were positive and negative to the respective countries, so we only kept the positive ones. We also took out the values with 0 from our data because the net migration rate equalled out between the two countries.

To continue with our analyses we asked ourself, what would be interesting to investigate further?

1. What countries are less, and what countries are more connected to the rest of the world?
2. What countries does the majority leave from vs. travel to?

To make our map, we had to make it as undirected even though the data is directed. We thought of it as directed in that sense of net value of workforce moving between countries. If more people move from i.e. Sweden to Norway than the other way around, the net value would be positive for Sweden -> Norway, and the direction would also be like that.

The map only shows if you open the .ipynb file in Jupyter or Google Collaboratory, so I am attaching the screenshot photo here:

![Map](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis/Work%20Migration%20Map.png)

Although all classes was based on learning the consepts by them selves and executing them in R, I decided to work on this project in Python. The coding is different but the consepts remain the same.

To see the presentation, click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis/Work%20Migration%20Presentation.pdf) or click the file "Work Migration Presentation.pdf". To see the python workbook, click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis/Work%20Migration.ipynb) or click the file "Work Migration.ipynb".
