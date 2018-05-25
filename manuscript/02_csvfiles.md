# csv, Excel, and txt Files

Before anything let's see what a csv file is. A csv file or a comma-separated values file allows us to have tabular data in plain text format. Think about storing a set of data that includes information about heights blood types of three individuals. You could make a table that has three columns (names, heights, and blood types) and three rows (one for each person). However, there is also another way of storing this data in plain text without needing to put them in table format. In a csv format, the values of each column for each person in the data are separated by commas and each row (each person in our case) is separated by new lines. So you could have your data in the following text file:

![sample csv](images/02_csvfiles/02_data_csvfiles_01.png)

A csv file has a .csv extension at the end. One of the advantages of csv files is their simplicity which is also why they are used as one of the most common forms of data. One of the challenges of data science is that each software rely on specific formats that are incompatible for other software. However, a csv file can be read by most programs. One caveats of csv files is that thee are best used for data records that have identical list of fields. An example would be to have more files such as eye color and weight for the second row but not for the other rows. We will learn about hierarchical data later that are impossible to represent in csv format. csv is therefore is not really appropriate for documents such as those created with HTML, XML, or other markup or word-processing technologies.
 

![Download as csv file](images/02_csvfiles/02_data_csvfiles_02.png)


As we saw in previous lesson, csv files can be created and opened in Google Sheets or software such as Microsoft Excel. Since we have already entered the data, we just need to download it as a csv file. Go to the Google Sheets you created and click on File and then Download as and choose Comma-separated values. The data set that you created will be downloaded as a csv file on your Chromebook. Make sure you know the location of your file.

### Importing csv files into RStudio Cloud

Log in to your RStudio account. Create a new project. On the RStudio workspace that you see, click on *Upload* under *Files* on the bottom right corner of the screen. On the window that pops up click on *Choose File*.

![Upload a file on RStudio Cloud](images/02_csvfiles/02_data_csvfiles_03.png)

Now, find where you saved the file (for instance Downloads) and click on *OPEN*. After this, the window closes automatically and you'll be back in your workspace on RStudio Cloud. You will see that your csv file now appears among other files.

![Find local file](images/02_csvfiles/02_data_csvfiles_04.png)

Now that your file is not yet imported to your environment. The most intuitive way to import csv files into R is to use the command `read.csv()`. Inside the parenthesis, write the name of the file and the file extension (.csv). Make sure you type the exact name. Save the imported data in a data frame called `my_csv_data`. Your data will not be imported into R environment. If you use the command `head(my_csv_data)` you will see the first several rows of your imported data frame. It's important to know that `read.csv()` is a general form of the function `read.delim()`. We'll learn about `read.delim()` at the end of this lesson.
 
```r
my_csv_data <- read.csv("sample_data.csv")
head(my_csv_data)
```

This is the most simple way to import a csv file. You can use the following attributes to the function depending on the situation.

- `header = TRUE` for when you want the first row to be imported as column names
- `sep = ","` you use this in most cases since csv files are comma separated
- `skip = 2` will skip the first 2 rows. You can set the number to any number you want.

Note that when you import the csv file the blank cell in the csv file is imported as a blank cell in the data frame. In most cases, we would like the blank cell to be imported as missing value and therefore we want them to be replaced by `"NA"`. 

A faster way to import csv files especially large files is the function `read_csv()` from the `readr` package. The function essentially works the same way so you can easily use it the same way. Install the package and try this code to import your csv file.

```r
my_csv_data <- read.csv("sample_data.csv")
head(my_csv_data)
```

Note that when you use this function instead, the blank cells are automatically imported as NAs. A general form of the function is `read_delim()` that can be used for importing different file types. We'll learn about this function at the end of this lesson.

### Excel files

While csv files hold plain text as a series of values separated by commas, an Excel (or .xls or .xlsx) file holds information in a workbook that comprises both values and formatting (colors, conditional formatting, font size, etc.). In other words, an Excel file is a fancier csv file. While csv files can be read by many software, Excel files can only be viewed in very few software. Let's go back to the Google Sheet that we created and instead of downloading the file locally as csv, download it as *Microsoft Excel (.xlsx)*. 

![Download as Excel file](images/02_csvfiles/02_data_csvfiles_08.png)

Save the file where you can find. Similar to the csv file, upload the file into your RStudio Cloud workspace. Importing Excel files into R is simple and can be done through various packages. The most popular package for importing Excel files is the `readxl` package. Install the package first. The function `read_excel()` from the package imports the Excel file into your environment. By default readxl converts blank cells to missing data. `read_excel()` has similar attributes to `read.csv()` and `read_csv()`.


```r
my_excel_data <- read_excel("sample_data.xlsx")
head(my_excel_data)
```

### Text files

Another common form of data is text files that usually come in the form of txt or tsv file formats. Text files are in essence very similar to csv files in that they don't have formatting and are very simple. In addition because of their simplicity most text editors can open such files and this cross-platform compliance makes them good candidates for storing data. One of the main advantages of txt and tsv files is that even if the file is corrupted, it is often easy to recover and continue processing the remaining content that is uncorrupted. Moreover, you can look at your data using the most basic text editors without the need for more advanced software. Remember that you can also open csv files with text editors but not Excel files.

We briefly mentioned `read.delim()` function from base R and `read_delim()` function from the package `readr`. These two functions can be used to import txt and tsv files into R. Before doing this, we first need a txt or tsv file. Go back to your Google Sheet and try to download the file as Tab-Separated Values or .tsv (Google Sheets does not have an option for downloading the file as .txt but these two file types are essentially the same.)

![Download as tsv file](images/02_csvfiles/02_data_csvfiles_10.png)

Upload the file to RStudio Cloud. Since the two functions mentioned above are similar (however, `read_delim()` is faster) we will use this code in order to import the data. The `delim = "\t"` attribute dictates that the values are separated by tabs and the `col_names = TRUE` dictates that the first row is column names. 


```r
my_text_data <- read_delim("sample_data.tsv", delim = "\t", col_names = TRUE)
head(my_excel_data)
```

### Exporting Data in R to csv or txt

The last topic of this lesson is about how to export data from R. So far we learned about importing data into R. However, sometimes you would like to share *your* data with others and need to export your data from R to some format that your collaborators can see. As we saw, csv format is a good candidate because of its simplicity and compatibility. Let's say you have a data frame in the R environment that you would like to export as csv. You have two ways similar to reading csv files. You can either use the `write.csv()` command from the base R or you can use `write_csv()` command from the `readr` package. Since both methods are fairly similar, let's look at the one from `readr` package. Since we've already created a data frame named `my_csv_data`, we can export it to a csv file using this. After typing this command, a new csv file called `my_csv_file.csv` will appear in the Files section.

```r
write_csv(my_csv_data, "my_csv_file.csv")
```

You can also save your data as a tsv file using the function `write_tsv()` function.


### Slides and Video

![csv, Excel, and txt Files](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/edit?usp=sharing)


{quiz, id: quiz_01_csvfiles}

### csv, Excel, and txt Files quiz

? What is a csv file?

a) A file that can contain various forms of data such as audio and video.
b) An Excel file first created by Microsoft Corporation.
c) A text data file in which values are separated by tabs.
D) A text data file in which values are separated by commas.

? Which of the following is NOT true about the `read.csv()` command?
a) By setting the `header` attribute to `TRUE` the first row will be imported as column names.
b) `sep = ","` dictates that the values are separated by comma.
C) It is a function from the package `readr`.
d) By using the `skip` attribute equal to 3 the first three rows will be skipped.

? Which of the following is TRUE about the difference between csv and Excel files? 
A) An Excel file is formatted but an csv file is not.
b) Both can be opened by basic text editors.
c) An Excel file is unformatted but a csv file is formatted.
d) Both can be imported using the `dplyr` package.

{/quiz}








