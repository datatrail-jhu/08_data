# Importing Data from Google Sheets

In the last lesson we discussed how to read various file types into R. In each of these examples, we first had to upload the file into our RStudio Cloud project before we could read the file into R using one of the `read_*()` functions. What if we could cut out that first step, eliminating the need to upload the file into our project? This way, we could just use one function to read data directly into RStudio Cloud. This is capable thanks to data stored Google Sheets and the fantastic R package `googlesheets`.

Additionally, using this approach, we can read in and analyze data hosted on Google Sheets in real-time. This means that as the data are updated over time, you can read the data into R and analyze it in its current state. Then, when the data are updated, you just re-run your code, and you'll get an updated analysis. To see what we mean specifically, let's take a look at an example.

Imagine you've sent out a survey to your friends asking about how they spend their day. Let's say you're mostly interested in knowing the hours spent on work, leisure, sleep, eating, socializing, and other activities. So in your Google Sheet you add these six items as columns and one column asking for your friends names. To collect this data, you then share the link with your friends, giving them the ability to edit the Google Sheet. 

![Survey Google Sheets](images/02_googlesheets/02_data_googlesheets-1.png)

Your friends will then one-by-one complete the survey. And, because it's a Google Sheet, everyone will be able to update the Google Sheet, regardless of whether or not someone else is also looking at the Sheet at the same time. As they do, you'll be able to pull the data and import it to R for analysis at any point. You won't have to wait for everyone to respond. You'll be able to analyze the results in real-time by directly reading it into R from Google Sheets, avoiding  the need to download it each time you do so. 

In other words, every time you import the data from the Google Sheets link using the `googlesheets` package, the most updated data will be imported. Let's say, after waiting for a week, your friends' data look something like this:

![Survey Data](images/02_googlesheets/02_data_googlesheets-2.png)

### The `googlesheets` package

The `googlesheets` package allows R users to take advantage of the Google Sheets API. In the first lesson in this course we mentioned that an API allows different application to communicate with one another. In this case, Google has released an API that allows other software to communicate with Google Sheets and retrieve data and information directly from Google Sheets. The `googlesheets` package enables R users (you!) to then easily access that API and retrieve your Google Sheets data. 

Using this package is is the best and easiest way to analyze and edit Google Sheets data in R. In addition to the ability of pulling data, you can also edit a Google Sheet or create new sheets. Like any other package, we first need to install and attach the package. 

#### Getting Started with `googlesheets`

```r
install.packages("googlesheets")
library(googlesheets)
```

Now, let's get to importing your survey data into R. Every time you start a new session, you need to authenticate the use of `googlesheets` package with your Google account. This is a great features as it ensures that you *want* to allow access to your Google Sheets and allows the Google Sheets API to make sure that you *should* have access to the files you're going to try to access.

The command `gs_auth(new_user = TRUE)` will open a new page in your browser that asks you which Google account's Google Sheets you'd like to give access to. Click on the appropriate Google user to provide `googlesheets` access to the Google Sheets API.

![Authenticate](images/02_googlesheets/02_data_googlesheets-4.png)

After you click "ALLOW", giving permission for the `googlesheets` package to connect to your Google account, you will likely be shown a screen where you will be asked to copy an authentication code. Copy this authentication code and paste it in your RStudio Cloud console.

![Allow](images/02_googlesheets/02_data_googlesheets-5.png)

#### Navigating `googlesheets`: `gs_ls()` and `gs_title()`

Once authenticated, you can use the command `gs_ls()` to list all your worksheets on Google Sheets as a table.

In order to access a specific sheet, in this case the sheet that you created and named "survey", you need to use the function `gs_title()`. We'll assign this information to the object `survey_sheet`.

```r
survey_sheet <- gs_title("survey")
```

If you type the name of the sheet correctly, you will see a message that says *Sheet successfully identified: "survey"*. 

![Sheet successfully identified](images/02_googlesheets/02_data_googlesheets-7.png)


#### Reading data in using `googlesheets`: `gs_read()`

At this point, you can read the data into R using the function `gs_read()` with the `survey_sheet` object output from `gs_title()` as your input to `gs_read()`:

```r
survey_data <- gs_read(survey_sheet)
```

![Sheet successfully read into R](images/02_googlesheets/02_data_googlesheets-8.png)

There are additional (optional) arguments to `gs_read()`, some are similar to those in `read_csv()` and `read_excel(),` while others are more specific to reading in Google Sheets:

* `skip = 1` : will skip the first row of the Google Sheet
* `ws = 1` : specifies that you want `googlesheets` to read in the first worksheet in your Google Sheet
* `col_names = FALSE` : specifies that the first row is not column names
* `range = "A1:G5"` : specifies the range of cells that we like to import is A1 to G5. 
* `n_max = 100` : specifies the maximum number of rows that we want to import is 100.

#### Adding rows and editing cells

In addition to reading in data from Google Sheets directly using the `googlesheets` package, you can also modify your Google Sheet directly through R. For example, you can edit a cell or add a row to your sheet. 

Let's say you'd like to add your own respond to the survey. For this you can use the command `gs_add_row()`. Note that the `input` argument specifies what you would like to add in the new row. If everything goes well, you will get a message saying *Row successfully appended*. 

```r
my_response <- c("Me", 10, 8, 2, 2, 1, 1)
gs_add_row(survey_sheet, input = my_response)
```

![`gs_add_row()`](images/02_googlesheets/02_data_googlesheets-10.png)


If you now check the sheet on Google Sheets, you will see the appended row.

![Survey Data with Added Row](images/02_googlesheets/02_data_googlesheets-11.png)


To edit a specific cell you can use the command `gs_edit_cell()` but you will have to tell `googlesheets` which specific cell to edit. Let's say we want to change the value of the cell *D4* from 0 to 2. For this we will use the `gs_edit_cells()` function. The `anchor` argument points to the cell that we want to modify and the `input` argument contains the new value that we want to assign to the cell.

```r
gs_edit_cells(survey_sheet, anchor = "D4", input = 2)
```

![`gs_edit_cells()`](images/02_googlesheets/02_data_googlesheets-12.png)

If you were to return to your Google Sheets, you'd notice that cell D4 now has a 2, rather than a 0 in it!

### Slides and Video

![Importing Data from Google Sheets](ADD VIDEO LINK)

* [Slides](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/edit?usp=sharing)

{quiz, id: quiz_02_googlesheets}

### Importing Data from Google Sheets quiz

{choose-answers: 4}
? Which of the following packages is used for importing data directly from Google Sheets?

C) googlesheets
o) dplyr
o) readr
o) google
o) googleAPI
o) gs_read

{choose-answers: 4, points: 2}
? Which of the following is NOT something that can be accomplished from the functions in the package `googlesheets`? (Note you may have to Google to learn more about other functions in `googlesheets`.)

C) Creating graphs directly from a Google sheet
m) Downloading the Google Sheet as a CSV
m) Moving a Google Sheet to the Trash on Google Drive
o) Editing cells in a Google sheet
o) Adding a new row in a Google sheet
o) Importing data from a Google sheet into R
o) Giving the Google Sheets API permission to access your Google Sheets

{choose-answers: 4}
? Which of the following arguments tells the `gs_edit_cells` function which cell to edit?

C) `anchor`
o) `n_max`
o) `range`
o) `input`
o) `by_row`
o) `col_names`
o) `trim`
o) `verbose`


{/quiz}