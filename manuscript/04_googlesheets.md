# Importing Data from Google Sheets

One of the advantages of R is its ability to read real-time data hosted on Google Sheets. Why is this an advantage? Well, imagine you are sending out a survey to your friends asking about how they spend their day. You already know about Google Sheets so one easy way is to create a Google Sheet and share the link with your friends. Again, you should know by now how to share a Google Sheets.

Let's say you're mostly interested in knowing the hours spend on work, leisure, sleep, eating, socilizing, and other activities. So in your Google Sheet you add these six items as columns and one column asking for your friends names. Something like this. Make sure you name your sheet with something, for instance *survey*.

![Survey Google Sheets](images/04_googlesheets/04_data_googlesheets_01.png)


Your friends will one by one complete the survey but the nice thing is that you can pull the data and import it to R for analysis in real-time and directly from Google Sheets without downloding it. In other words, everytime you import the data from the Google Sheets link, the most updated data will be imported. Let's say, after waiting for a week, your friends' data look like this.

![Survey Data](images/04_googlesheets/04_data_googlesheets_02.png)

### The `googlesheets` package


But how is this possible? We can do this using `googlesheets` package in R. `googlesheets` is a Google Sheets R API and is the best way to analyze and edit Google Sheets data in R. In addition to the ability of pulling data, you can also edit a google Sheet or create new sheets. Like any other package, we first need to install and attach the package. 

```r
install.packages("googlesheets")
library(googlesheets)
```

Let's import your survey data into R. Every time you start a new session, you need to authenticate the use of `googlesheets` package with your Google account. The command `gs_auth(new_user = TRUE)` will open a new page in your browser that asks you accessing your Google Sheets. After you allow the connection to your Google account, you can use the command `gs_ls()` to list all your worksheets on Google Sheets as a table.

In order to access a specific sheet, in this case the sheet that you created and named *survey*, you need to use the function `gs_title`. If you type the name of the sheet correctly, you will see a message that says *Sheet successfully identified: "survey"*. Now you can read the data into a variable using the function `gs_read`. Note that if you use the attribute `skip = 1` the first row will be skipped. You can change the row number to any row number you need to be ignored. However, since our first row of our survey sheet is our column names, we need to import everything so we won't use the attribute `skip`. By using this your data will be imported as a table in the variable `survey_data`. If you want your data as a data frame, you can use the command `as.data.frame` to save your data as a data frame.

```r
survey_sheet <- gs_title("survey")
survey_data <- gs_read(survey_sheet)
survey_data_df <- as.data.frame(survey_data)
```

The following attributes can be used when using the `gs_read` command. The `range` attribute gives the range of cells that we like to import. For instance `range = "A1:G5"` means that we like to import cells A1 to G5. `n_max` can be used to limit the number of rows that we want to import. `col_names` dictates whether we want the first row as column names. If we use `col_names = FALSE` no column names will be imported.


### Adding rows and editing cells

What else is cool about `googlesheets`? You can modify your Google sheet throught R. You can edit a cell or add a row to your sheet. Let's say you like to add your own respond to the survey. For this you can use the command `gs_add_row`. If everything goes well, you will get a message saying *Row successfully appended*. 

```r
my_response <- c("Me", 10, 8, 2, 2, 1, 1)
gs_add_row(survey_sheet, input = my_response)
```

If you now check the sheet on Google Sheets, you will see the appended row.

![Survey Data with Added Row](images/04_googlesheets/04_data_googlesheets_07.png)


In orther to edit a specific cell you can use the command `gs_edit_cell` but you will have to tell which specific cell. Let's say we want to change the value of the cell *D4* from 0 to 2. For this we will use the `gs_edit_cells` command like this. The `anchor` attribute points to the cell that we want to modify and the `input` attribute contains the new value that we want to assign to the cell.

```r
gs_edit_cells(survey_sheet, anchor = "D4", input = 2)
```


### Slides and Video

![Importing Data from Google Sheets](ADD VIDEO LINK)

* [Slides](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/edit?usp=sharing)

{quiz, id: quiz_04_googlesheets}

### Importing Data from Google Sheets quiz

? Which of the following packages is used for importing data directly from Google Sheets?

a) dplyr
b) readr
c) google
D) googlesheets

? Which of the following is not one of the functions of the package `googlesheets`?
a) Editing cells in a Google sheet
b) Adding a row in a Google sheet
C) creating graphs from a Google sheet
d) Importing data from a Google sheet

? Which of the following attributes tells the `gs_edit_cells` function which cell to edit?
A) `anchor`
b) `n_max`
c) `range`
d) `input`


{/quiz}