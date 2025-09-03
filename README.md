# fiji-snt-sholl-csv-formatting-tool
This repository contains two scripts that work together to transform a set of .csv files into an excel file with the appropriate format to perform sholl analysis in GraphPad.<br/><br/>
Download "Z_CSV_processing.sh" and "format_table.R" and sava a copy of them inside the folder where you are going to work.<br/><br/>
Inside that folder you will want to have another folder for each set of .csv files that you want to format.<br/><br/>
When you execute "Z_CSV_processing.sh" through a linux command console, this will call "format_table.R" (which does the actual formatting of the data using R) and will then create 2 .xlsx files, one named like the folder where it was created and one named "formatted_table".<br/><br/>
The first contains the first two values of your .csv files separated by tabs and contains the value "NA" where an empty value would be stored.<br/><br/>
The second contains the distance from the the center of the soma (the first value of the original .csv files) as the first column, and each subsequent column is the number of crossings measured during SNT Sholl analysis (the second value of each original .csv file)<br/><br/>
At this stage, you can copy your data seemlessly to GraphPad and measure the AUC , max crossings, etc. for further analysis.
