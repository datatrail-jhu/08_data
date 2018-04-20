# csv and txt files

Before anything let's see what a csv file is. A csv file or a comma-separated values file allows us to have tabular data in plain text format. Think about storing a set of data that includes information about heights blood types of three individuals. You could make a table that has three columns (names, heights, and blood types) and three rows (one for each person). However, there is also another way of storing this data in plain text without needing to put them in table format. In a csv format, the values of each column for each person in the data are separated by commas and each row (each person in our case) is separated by new lines. So you could have your data in the following text file:

![sample csv](images/02_csvfiles/00_sample_csv.png)

A csv file has a .csv extention at the end. One of the advantages of csv files is their simplicity which is also why they are used as one of the most common forms of data. One of the challenges of data science is that each software rely on specific formats that are incompatible for other sofwatre. However, a csv file can be read by most programs. 

As we saw in previous lesson, csv files can be created and opened in Google Sheets or software such as Microsoft Excel. Since we have already entered the data, we just need to download it as a csv file. Go to the Google Sheets you created and click on File and then Dowonload as and choose Comma-separated values. The data set that you created will be downloaded as a csv file on your Chromebook.

### Importing csv files into R




### Disadvantages of csv files

Remember the basic idea behind comma-separated documents is that fields (columns) values for each row are separated by commas. But what if the value has commas in it? Or what if the value itself includes a line break? A simple csv standard may not be able to handle such values. In such cases other csv formats are used. For instance the value might be sorrounded by quotations. In some other cases, quotations may not be the answer either and we could use escape characters, semicolons, or TABS. This is why csv does not follow a single standard and csv formats can vary in the choice of separator character.

Another caveats of csv files is that thee are best used for data records that have identical list of fields. An example would be to have more fileds such as eye color and weight for the second row but not for the other rows. We will learn about hierarchical data later that are impossible to represent in csv format. csv is therefore is not really appropriate for documents such as those created with HTML, XML, or other markup or word-processing technologies.

### Text files



<!---
Try to think about a way to 
Fields with embedded commas or double-quote characters must be quoted.
1997,Ford,E350,"Super, luxurious truck"

Each of the embedded double-quote characters must be represented by a pair of double-quote characters.
1997,Ford,E350,"Super, ""luxurious"" truck"

Fields with embedded line breaks must be quoted (however, many csv implementations do not support embedded line breaks).
1997,Ford,E350,"Go get one now
they are going fast"
--->


### Slides and Video

![What is data](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/edit?usp=sharing)


{quiz, id: quiz_01_csvfiles}

### csv and TXT files quiz




{/quiz}








