# CSV, Excel, and TSV Files

In this lesson, we'll discuss a few of the main file types used to store tabular data. To review briefly, **tabular data** are the type of data stored in spreadsheets. Information from different variables are stored in **columns** and each observation is stored in a different **row**. The values for each observation is stored in its respective **cell**.

### CSV files

**Comma-separated values (CSV)** files allow us to store tabular data in a simple format. CSVs are **plain-text** files, which means that all the important information in the file is represented by text (where text is numbers, letters, and symbols you can type on your keyboard).

For example, consider a dataset that includes information about the heights and blood types of three individuals. You could make a table that has three columns (names, heights, and blood types) and three rows (one for each person) in Google Docs or Microsoft Word. However, there is a better way of storing this data in plain text without needing to put them in table format. CSVs are a perfect way to store these data. In the CSV format, the values of each column for each person in the data are separated by commas and each row (each person in our case) is separated by a new line. This means your data would be stored in the following format:


![sample CSV](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g2bfdb07292_0_151)

Notice that CSV files have a .csv extension at the end. You can see this above at the top of the file. One of the advantages of CSV files is their *simplicity*. Because of this, they are one of the most common file formats used to store tabular data. Additionally, because they are plain text, they are compatible with *many* different types of software.  CSVs can be read by most programs. Specifically, for our purposes, these files can be easily read into R (or Google Sheets, or Excel), where they can be better understood by the human eye. Here you see the same CSV opened in Google Slides, where it's more easily interpretable by the human eye:


![CSV opened in Google Slides](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g3a4d18d722_0_92)

As with any file type, CSVs do have their limitations. Specifically, CSV files are best used for data that have a consistent number of variables across observations. For example, in our example, there are three variables for each observation: "name", "height", and "blood_type". If, however, you had eye color and weight for the second observation, but not for the other rows, you'd have a different number of variables for the second observation than the other two. This type of data is not best suited for CSVs. However, whenever you have information the same number of variables across all observations, CSVs are a good bet!

### Downloading CSV files

If you entered the same values used above into Google Slides first and wanted to download this file as a CSV to read into R, you would enter the values in Google slides, and then click on "File" and then "Download" as and choose "Comma-separated values (.csv, current sheet)". The dataset that you created will be downloaded as a CSV file on your computer. Make sure you know the location of your file (if on a Chromebook, this will be in your "Downloads" folder).


![Download as CSV file](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_56)


### Reading CSV files into RStudio Cloud

Now that you have a CSV file, let's discuss how to get it into RStudio Cloud! Log in to your RStudio Cloud account. Create a new project. On the RStudio workspace that you see, click on *Upload* under *Files* on the bottom right corner of the screen. On the window that pops up click on *Choose File*.


![Upload a file on RStudio Cloud](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_10)

Now, find where you saved the file (for instance "Downloads") and click on *OPEN*. After this, the window closes automatically and you'll be back in your workspace on RStudio Cloud. You will see that your CSV file now appears among other files. (A reminder: if you were working on a data science project, this would go in your "raw_data" directory. For this example, however, we'll keep it in "cloud/project")


![Find local file](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_1)

Now, while the file has now been uploaded to your RStudio Cloud project, it's important to recognize the file is not yet imported to your R environment as an object. We'll do that now!

The best way to accomplish this is using the function `read_csv()` from the `readr` package. (Note, if you haven't installed the `readr` package, you'll have to do that first.) Inside the parenthesis of the function, write the name of the file in quotes, including the file extension (.csv). Make sure you type the exact file name. Save the imported data in a data frame called `df_csv`. Your data will now be imported into R environment. If you use the command `head(df_csv)` you will see the first several rows of your imported data frame:

```r
## install.packages("readr")
library(readr)

## read CSV into R
df_csv <- read_csv("sample_data - Sheet1.csv")

## look at the object
head(df_csv)
```


![`read_csv()`](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_16)

Above, you see the simplest way to import a CSV file. However, as with many functions, there are other arguments that you can set to specify how to import your specific CSV file, a few of which are listed below. However, as usual, to see all the arguments for this function, use `?read_csv` within R.

- `col_names = FALSE` to specify that the first row does NOT contain column names.
- `skip = 2` will skip the first 2 rows. You can set the number to any number you want. Helpful if there is additional information in the first few rows of your data frame that are not actually part of the table.
- `n_max = 100` will only read in the first 100 rows. You can set the number to any number you want. Helpful if you're not sure how big a file is and just want to see part of it

By default, `read_csv()` converts blank cells to missing data (NA).

Finally, we introduce the function `read_csv` here and recommend that you use it, as it is the simplest and fastest way to read CSV files into R. However, we note that there *is* a function `read.csv` which is available by default in R. You will likely see this function in others' code, so we just want to make sure you're aware of it.

### Excel files

While CSV files hold plain text as a series of values separated by commas, an Excel (or .xls or .xlsx) file holds information in a workbook that comprises both values and formatting (colors, conditional formatting, font size, etc.). You can think of Excel files a fancier CSV file. While this may sound appealing, we'll remind you that CSV files can be read by many different pieces of software, Excel files can only be viewed in specific pieces of software, and thus are generally less flexible. That said, many people save their data in Excel, so it's important to know how to work with them in RStudio Cloud.

Let's go back to the Google Sheet that we created and instead of downloading the file locally as as CSV, download it as *Microsoft Excel (.xlsx)* file.


![Download as Excel file](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_33)

Save the file where you can find it. Similar to the CSV file, first, upload the file into your RStudio Cloud workspace.

### Reading Excel files into RStudio Cloud

To read this file into R, we'll have to use a different function than above, as this file is not a CSV file. We'll use the `read_excel()` function from the `readxl` package. Install the package first and then use the function `read_excel()` from the package read the Excel file into your R Environment. As above, by default, `read_excel()` converts blank cells to missing data (NA).


```r
## install and load package
install.packages("readxl")
library(readxl)

df_excel <- read_excel("sample_data.xlsx")
head(df_excel)
```


![Find local file](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/export/png?id=199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM&pageid=g399e5a917a_0_41)


### Text files

Another common form of data is text files that usually come in the form of TXT or TSV file formats. Like CSVs, text files are simple, plain-text files; however, rather than columns being separated by commas, they are separated by tabs (represented by "\t" in plain-text). Like CSVs, they don't allow text formatting (i.e. text colors in cells) and are able to be opened on many different software platforms. This makes them good candidates for storing data.


### Reading TSV files into RStudio Cloud

The process for reading these files into R is similar to what you've seen so far. We'll again use the `readr` package, but we'll instead use the `read_tsv()` function.


```r
## read TSV into R
df_tsv <- read_tsv("sample_data - Sheet1.tsv")

## look at the object
head(df_tsv)
```

### Reading TXT files into RStudio Cloud

Sometimes, tab-separated files are saved with the .txt file extension. TXT files can store tabular data, but they can also store simple text. Thus, while TSV is the more appropriate extension for tabular data that are tab-separated, you'll often run into tabular data that individuals have saved as a TXT file. In these cases, you'll want to use the more generic `read_delim()` function from `readr`.

Google Sheets does not allow tab-separated files to be downloaded with the .txt file extension (since .tsv is more appropriate); however, if you were to have a file "sample_data.txt" uploaded into your RStudio Cloud project, you could use the following code to read it into your R Environment, where "\t" specifies that the file is tab-delimited.

```r
## read TXT into R
df_txt <- read_delim("sample_data.txt", delim = "\t")

## look at the object
head(df_txt)
```

This function allows you to specify how the file you're reading is in delimited. This means, rather than R knowing by default whether or not the data are comma- or tab- separated, you'll have to specify it within the argument `delim` in the function.

`read_delim()` is a more generic version of `read_csv()`. What this means is that you *could* use `read_delim()` to read in a CSV file. You would just need to specify that the file was comma-delimited if you were to use that function.

### Exporting Data in R to CSV

The last topic of this lesson is about how to export data from R. So far we learned about reading data into R. However, sometimes you would like to share *your* data with others and need to export your data from R to some format that your collaborators can see.

As discussed above, CSV format is a good candidate because of its simplicity and compatibility. Let's say you have a data frame in the R environment that you would like to export as a CSV. To do so, you could use `write_csv()` from the `readr` package.

Since both methods are fairly similar, let's look at the one from `readr` package. Since we've already created a data frame named `df_csv`, we can export it to a CSV file using the following code. After typing this command, a new CSV file called `my_csv_file.csv` will appear in the Files section.

```r
write_csv(df_csv, path = "my_csv_file.csv")
```

You could similar save your data as a TSV file using the function `write_tsv()` function.

We'll finally note that there are default R functions `write.csv()` and `write.table()` that accomplish similar goals. You may see these in others' code; however, we recommend sticking to the intuitive and quick `readr` functions discussed in this lesson.

### Slides and Video

![CSV, Excel, and TSV Files](https://www.youtube.com/watch?v=qzo8RLJfy_U)

* [Slides](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/edit?usp=sharing)
