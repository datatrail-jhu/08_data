# Tidy Data

The idea of tidy data was formalized in 2014 in a [paper](http://vita.had.co.nz/papers/tidy-data.pdf) written by a leader in the data science field, [Hadley Wickham](http://hadley.nz/). The principles of tidy data, which are discussed below, provide a standard way of formatting a data set. A tidy dataset follows a number of rules relating to how rows, columns, and spreadsheets are matched up with observations, variables and types.

### Why Tidy Data?

Tidy datasets, by design, are easier to manipulate, model and visualize. By starting with data that are already in a tidy format *or* by spending the time at the beginning of a project to get data into a tidy format, all of the rest of the steps of your data science project will be easier.

### Data Terms

We've previously discussed what the rows and columns in a spreadsheet are. Here, we'll discuss what is meant by observations, varaiables, and types, all of which are used to explain the principles of tidy data. 

#### Variables
Variables in a spreadsheet are the different categories of data that will be collected. Here, we see there are 7 different variables: ID, LastName, FirstName, Sex, City, State, and Occupation. The names for variables are put in the first row of the spreadsheet.

![Variables](images/01_tidydata/01_data_tidydata-02.png)

#### Observations
The measurements taken from a person for each variable are called observations. Observations for each individual are stored in a single row, with each observation being put in the appropriate column for each variable. 

![Observations](images/01_tidydata/01_data_tidydata-03.png)

#### Types
Often, data are collected for the same indivdiuals from multiple sources. For example, when you go to the doctor's office, you fill out a survey about yourself. That would count as one type of data. The measurements a doctor collects at your visit, however, would be a different type of data. 

![Types](images/01_tidydata/01_data_tidydata-04.png)

### Principles of Tidy Data

1. Each variable you measure should be in one column

![Principle #1 of Tidy Data](images/01_tidydata/01_data_tidydata-05.png)

2. Each different observation of that variable should be in a different row

![Principle #2 of Tidy Data](images/01_tidydata/01_data_tidydata-06.png)

3. There should be one spreadsheet for each "type" of data

![Principle #3 of Tidy Data](images/01_tidydata/01_data_tidydata-07.png)

4. If you have multiple spreadsheets, they should include a column in each spreadsheet (with the same column label!) that allows them to be joined or merged

![Principle #4 of Tidy Data](images/01_tidydata/01_data_tidydata-08.png)


### Rules for Tidy Spreadsheets

In addition to these four principles, there are a number of rules to follow when entering data into a spreadsheet, or when re-organizing untidy data you have been handed for a project into a tidy format. They are rules that will help make data analysis and visualization easier down the road. They were formalized in a paper called ["Data organization in spreadsheets"](https://peerj.com/preprints/3183/), written by two prominent data scientists, [Karl Broman](http://kbroman.org/) and [Kara Woo](http://karawoo.com/). In this paper, in addition to ensuring the data are tidy, they suggest following these guidelines when entering data into spreadsheets:

1. Be consistent
2. Choose good names for things
3. Write dates as YYYY-MM-DD
4. No empty cells
5. Put just one thing in a cell
6. Don't use font color or highlighting as data
7. Save the data as plain text files

We'll go through each of these to make sure we're all clear on what a great tidy spreadsheet looks like.

#### Be consistent

Being consistent in data entry and throughout an analysis is key. It minimizes confusion and makes analysis simpler. For example, here we see sex is coded as "female" or "male." Those are the only two ways in which sex was entered into the data. This is an example of consistent data entry. You want to avoid sometimes coding a female's sex as "female" and then entering it as "F" in other cases. Simply, you want to pick a way to code sex and stick to it. 

With regard's to entering a person's sex, we were talking about how to code observations for a specific variable; however, consistency matters when you're choosing how to name a variable. If you use the variable name "ID" in one spreadsheet, use the same variable name ("ID") in the next spreadsheet. Do not change it to "id" (capitalization matters!) or "identifier" or anything else in the next spreadsheet. Be consistent!

Consistency matters across every step of the analysis. Name your files in a consistent format. Always code dates in a consistent format (discussed further below). Avoid extra spaces in cells. If you're careful about and consistent in data entry, it will be incredibly helpful when you get to analysis

![Be Consistent!](images/01_tidydata/01_data_tidydata-10.png)

#### Choose good names for things

Choosing good variable names is important. Generally, avoid spaces in variable names and file names. You'll see why this is important as we learn more about programming, but as for now know that "Doctor Visit 1" is not a good file name. "doctor_visit_v1" is much better. Stick to using underscores instead of spaces or any other symbol when possible. The same thing goes for variable names. "FirstName" is a good variable name while "First Name" with a space in the middle of it is not. 

Additionally, make sure that file and variable names are as short as possible while still being meaningful. "F1" is short, but it doesn't really tell you anything about what is in that file. "doctor_visit_v1" is a more meaningful file name. We know now that this spreadsheet contains information about a doctor's visit. 'v1' specifies version 1 allowing for updates to this file later which would create a new file "doctor_visit_v2." 

![Choose good names](images/01_tidydata/01_data_tidydata-11.png)

#### Write dates as YYYY-MM-DD

When entering dates, there is a global 'ISO 8601' standard. Dates should be encoded YYYY-MM-DD. What this means is that if you want to specify that a measurement was taken on February 27th, 2018, you would type 2018-02-27. YYYY refers to the year, 2018. MM refers to the month of February, 02. And DD refers to the day of the month, 27. This standard is used for dates for two main reason. First, it avoids confusion when sharing data across different countries, where date conventions can differ. By all using ISO 8601 standard conventions, there is less room for error in interpretation of dates. Secondly, spreadsheet software often mishandles dates and assumes things that are not dates are dates and vice versa. By encoding dates as YYYY-MM-DD, this confusion is minimized. 

![YYYY-MM-DD](images/01_tidydata/01_data_tidydata-12.png)

#### No empty cells

Simply, fill in every cell. If the data is unknown for that cell, put 'NA.' Without information in each cell, the analyst is often leeft guessing. In the spreasheets below, on the left, is the analyst to assume that the empty cells should use the date from the cell above? Or are we to assume that the date for that measurement is unknown? Fill in the date if it is known or type 'NA' if it is not. That will clear up the need for any guessing on behalf of the analyst. On the spreadsheet to the right, the first two rows have a lot of empty cells. This is problematic for the analysis. This spreadsheet does not follow the rules for tidy data. There is not a single variable per column with a single entry per row. These data would have to be reformatted before they could be use din analysis.

![No empty cells](images/01_tidydata/01_data_tidydata-13.png)


#### Put just one thing in a cell

Sometimes people are tempted to include a number and a unit in a single cell. For weight, someone may *want* to put '165 lbs' in that cell. Avoid this temptation! Keep numbers and units separate. In this case, put one piece of information in the cell (the person's weight) and either put the unit in a separte column, or better yet, make the variable name weight_lbs. That clears everything up for the analyst and avoids a number and a unit from both being put in a single cell. 

![One thing per cell](images/01_tidydata/01_data_tidydata-14.png)

#### Don't use font color or highlighting as data

Avoid the temptation to highlight particular cells with a color to specify something about the data. Instead, add another column to convey that information. In the example below, 1.1 looks like an incorrect value for an individual's glucose measure. Instead of highlighting the value in read, instead create a new variable. Here, on the right, this column has been named 'outlier.' Including 'TRUE' for this indivdiual suggests that this individual may be an outlier to the data analyst. Doing it in this way ensures that this information will not be lost. Using font color or highlighting however can easily be lost in data processing, as you will see in future lessons.

![No highlighting or font color](images/01_tidydata/01_data_tidydata-15.png)

#### Save the data as plain text files

The following lessons will go into detail about what file formats are ideal for saving data, such as text files (.txt) and comma-delimited files (.csv). These file formats can easily be opened and will never require special software, ensuring that they will be usable no matter what computer or analyst is looking at the data.

#### Tidy Data Summary

The data entry guidelines discussed here and a few additional rules have been summarized below and are [available online for reference](https://doi.org/10.7287/peerj.preprints.3139v5).

![Naming Guidelines](images/01_tidydata/01_data_tidydata-16.png)

Most importantly, however, remember that tidy data are rectangular data. The data should be a rectangle with each variable in a separate column and each entry in a different row. All cells should contain some text, so that the spreadsheet looks like a rectangle with something in every cell.

![Tidy Data = rectangular data](images/01_tidydata/01_data_tidydata-17.png)

Additional resources:
[Hadley Wickham's paper on Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf)
[Data Organization in Spreadsheets](https://peerj.com/preprints/3183/)
[How to Share Data for Collaboration](https://doi.org/10.7287/peerj.preprints.3139v5)
[Data Carpentry's Data Organization in Spreadsheets](http://www.datacarpentry.org/spreadsheet-ecology-lesson/02-common-mistakes/)
[Karl Broman's Data Organization blog post](http://kbroman.org/dataorg/)

### Slides and Video

![Tidy Data](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/1JTG8Kt9htfyNsGQcsleHZNNXHKLe1zUlOb-SsnVNf54/edit?usp=sharing)


{quiz, id: quiz_01_tidydata}

### Tidy Data quiz

This is the Tidy Data quiz

? Which is the best filename?
A) baseball_analysis_v1.txt
b) baseball.txt
c) baseball analysis.txt
d) baseball_analysis .txt

? Which of these is NOT a feature of tidy data?

a) rectangular
B) empty cells
c) single variable per column
d) one thing per cell


{/quiz}

