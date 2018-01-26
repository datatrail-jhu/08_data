# CSV files

A CSV file or a comma-separated values file allows us to have tabular data in plain text format. Think about storing a set of data that includes information about heights blood types of three individuals. You could make a table that has three columns (names, heights, and blood types) and three rows (one for each person). However, there is also another way of storing this data in plain text without needing to put them in table format. In a CSV format, the values of each column for each person in the data are separated by commas and each row (each person in our case) is separated by new lines. So you could have your data in the following text file:

![sample csv](images/03_csvfiles/00_sample_csv.png)

A CSV file has a .csv extention at the end. One of the advantages of CSV files is their simplicity which is also why they are used as one of the most common forms of data. One of the challenges of data science is that each software rely on specific formats that are incompatible for other sofwatre. However, a CSV file can be read by most programs. 

## Creating a CSV file in Google Sheets

CSV files can be created and opened in Google Sheets or software such as Microsoft Excel. In this section we will learn how to create a CSV file in Google Sheets. For this, go to [Google Sheets](https://docs.google.com/spreadsheets/u/0/) and create a new spreadsheet. Change the name of the file from Untitled Spreadsheet to my_first_csv_file. In the first three columns (under A, B, and C), enter Column A, Column B, and Column C. 

Name three columns as A, B, C and under each column enter random numbers up to three rows similar to the figure below.

![sample csv](images/03_csvfiles/01_create_csv.png)

Now we'll try to download the file as a CSV file. In the menu bar on top, click on File and click on Download as and then click on Comma-separated values (.csv, current sheet). By doing this, the table that you created will be saved as a CSV file in your download folder.


## Disadvantages of CSV files

Remember the basic idea behind comma-separated documents is that fields (columns) values for each row are separated by commas. But what if the value has commas in it? Or what if the value itself includes a line break? A simple CSV standard may not be able to handle such values. In such cases other CSV formats are used. For instance the value might be sorrounded by quotations. In some other cases, quotations may not be the answer either and we could use escape characters, semicolons, or TABS. This is why CSV does not follow a single standard and CSV formats can vary in the choice of separator character.

Another caveats of CSV files is that thee are best used for data records that have identical list of fields. An example would be to have more fileds such as eye color and weight for the second row but not for the other rows. We will learn about hierarchical data later that are impossible to represent in CSV format. CSV is therefore is not really appropriate for documents such as those created with HTML, XML, or other markup or word-processing technologies.

## Text files



<!---
Try to think about a way to 
Fields with embedded commas or double-quote characters must be quoted.
1997,Ford,E350,"Super, luxurious truck"

Each of the embedded double-quote characters must be represented by a pair of double-quote characters.
1997,Ford,E350,"Super, ""luxurious"" truck"

Fields with embedded line breaks must be quoted (however, many CSV implementations do not support embedded line breaks).
1997,Ford,E350,"Go get one now
they are going fast"
--->








