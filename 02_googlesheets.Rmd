# Importing Data from Google Sheets

In the last lesson we discussed how to read various file types into R. In each of these examples, we first had to upload the file into our RStudio Cloud project before we could read the file into R using one of the `read_*()` functions. What if we could cut out that first step, eliminating the need to upload the file into our project? This way, we could just use one function to read data directly into RStudio Cloud. This is capable thanks to data stored Google Sheets and the fantastic R package `googlesheets`.

Additionally, using this approach, we can read in and analyze data hosted on Google Sheets in real-time. This means that as the data are updated over time, you can read the data into R and analyze it in its current state. Then, when the data are updated, you just re-run your code, and you'll get an updated analysis. To see what we mean specifically, let's take a look at an example.

Imagine you've sent out a survey to your friends asking about how they spend their day. Let's say you're mostly interested in knowing the hours spent on work, leisure, sleep, eating, socializing, and other activities. So in your Google Sheet you add these six items as columns and one column asking for your friends names. To collect this data, you then share the link with your friends, giving them the ability to edit the Google Sheet.


![Survey Google Sheets](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g2bfdb07292_0_151)

Your friends will then one-by-one complete the survey. And, because it's a Google Sheet, everyone will be able to update the Google Sheet, regardless of whether or not someone else is also looking at the Sheet at the same time. As they do, you'll be able to pull the data and import it to R for analysis at any point. You won't have to wait for everyone to respond. You'll be able to analyze the results in real-time by directly reading it into R from Google Sheets, avoiding  the need to download it each time you do so.

In other words, every time you import the data from the Google Sheets link using the `googlesheets` package, the most updated data will be imported. Let's say, after waiting for a week, your friends' data look something like this:


![Survey Data](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g398ce98dcf_0_1)

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


![Authenticate](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d555bce3d_0_4)

After you click "ALLOW", giving permission for the `googlesheets` package to connect to your Google account, you will likely be shown a screen where you will be asked to copy an authentication code. Copy this authentication code and paste it in your RStudio Cloud console.


![Allow](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d555bce3d_0_12)

#### Navigating `googlesheets`: `gs_ls()` and `gs_title()`

Once authenticated, you can use the command `gs_ls()` to list all your worksheets on Google Sheets as a table.

In order to access a specific sheet, in this case the sheet that you created and named "survey", you need to use the function `gs_title()`. We'll assign this information to the object `survey_sheet`.

```r
survey_sheet <- gs_title("survey")
```

If you type the name of the sheet correctly, you will see a message that says *Sheet successfully identified: "survey"*.


![Sheet successfully identified](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d555bce3d_0_23)


#### Reading data in using `googlesheets`: `gs_read()`

At this point, you can read the data into R using the function `gs_read()` with the `survey_sheet` object output from `gs_title()` as your input to `gs_read()`:

```r
survey_data <- gs_read(survey_sheet)
```


![Sheet successfully read into R](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d555bce3d_0_28)

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


![`gs_add_row()`](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g398ce98dcf_0_18)


If you now check the sheet on Google Sheets, you will see the appended row.


![Survey Data with Added Row](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g398ce98dcf_0_23)


To edit a specific cell you can use the command `gs_edit_cell()` but you will have to tell `googlesheets` which specific cell to edit. Let's say we want to change the value of the cell *D4* from 0 to 2. For this we will use the `gs_edit_cells()` function. The `anchor` argument points to the cell that we want to modify and the `input` argument contains the new value that we want to assign to the cell.

```r
gs_edit_cells(survey_sheet, anchor = "D4", input = 2)
```


![`gs_edit_cells()`](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g398ce98dcf_0_29)

If you were to return to your Google Sheets, you'd notice that cell D4 now has a 2, rather than a 0 in it!

### Importing CSV files from the web

This lesson has focused on getting data from Google Sheets into RStudio Cloud; however, sometimes the data you need to work with is elsewhere online but you'd like to store it in a Google Sheet. While we will later learn that you can import them directly into R, it's good to know that you can also import CSV files hosted on the web directly into Google Sheets. For instance, the dataset [here](https://raw.githubusercontent.com/datasets/gdp/master/data/gdp.csv) is a CSV file containing countries GDPs (national incomes). In order to import the file directly to Google Sheets, open a blank Google Sheets document as we learned before. In the first cell (top left corner) type in `=importData("https://raw.githubusercontent.com/datasets/gdp/master/data/gdp.csv")`. Make sure to include the equal sign (=) in the beginning.


![importing data directly into Google Sheets](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d79cb939b_0_4)

This will import all the data to your Google Sheets document. You can then use the steps discussed above any time you want to work with these data in RStudio Cloud.


![data in Google Sheets](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/export/png?id=1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA&pageid=g3d79cb939b_0_0)

### Summary

In this lesson, we've introduced the R package `googlesheets`. We've discussed the need for authentication and have demonstrated a number of its basic capabilities. We've walked through an example of how to read a Google Sheet into R and how to add and edit content directly to your Google Sheet from R. We also briefly covered how to import CSV data into Google Sheets directly. While we've covered the basics, there are certainly a number of additional capabilities of the package, so feel free to explore even more!

### Additional Resources

* [`googlesheets` on GitHub](https://github.com/jennybc/googlesheets) - includes an incredibly helpful README from Jenny Bryan on the basic functions of the package as well as a table with brief descriptions of all the functions
* [`googlesheets` vignette](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html) - a more in-depth tutorial at the packages' functionality from Jenny Bryan and Joanna Zhao


### Slides and Video

![Importing Data from Google Sheets](https://www.youtube.com/watch?v=U3MP1QVLL4Q)

* [Slides](https://docs.google.com/presentation/d/1BtZv6mbC0ufQASlkWjdnXY1MQKVsC3Mo0rGmzfMadyA/edit?usp=sharing)
