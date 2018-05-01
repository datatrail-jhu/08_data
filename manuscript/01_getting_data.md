{
course-completeness: 90
course-attempts: 2
default-quiz-attempts: 2
authors: Jeffrey Leek
contributors: Aboozar Hadavand
}

# Getting Data into R

The first step in working with data is to *import* them into your software environment or in other words *load* them into R. Importing data into R is straightforward but each data type requires a different way of importing. Data that you would like to import has to be in an R compatible format and has exist somewhere, i.e. it can be saved on your Chromebook or can be on the web. Since your intention is to learn data science on a Chromebook and the fact that Chromebooks don't have much space, your data is mostly stored on the cloud. 

To see what data is already loaded in your environment, Look at the environment panel. Any data that is already imported is loaded here.

![Environment Panel](images/01_getting_data/01_data_gettingdata_01.png)

If you would like to empty your environment before importing new data, you can *remove* all the data using the `rm(list=ls())` command. If you want to only remove a specific data you can use `rm(my_data)`. You will see that after removing the data, that specific data disappears from the environment panel.

In this lesson, we will try creating a sample data in Google Sheets. Then in the next few lessons, we will folow each of the following steps to import the data into R. We will

1. save the data locally as a .csv file and import it into R. 
2. save the data locally as .xlsx file and import it into R.
3. save the data as .csv and upload it to your Github repository and then load it into R.
4. import the data directly from Google Sheets.

So for now, let's create a data set from scratch on Google Sheets. Go to [Google Sheets](https://docs.google.com/spreadsheets/u/0/) and start a new spreadsheet and call it sample_data. In the first row, add the column names as college, city, state, size. the variable college is the name of the college, city and state are the location of the college and size is the number of students in each college. The first row of most data sets is usually the headers (column names). 

Under each column add the following data.

| college          | city          | state | enrollment   |
| ---------------- |:-------------:| -----:|--------------|
| Smith College    | Northampton   | MA    | 2,600        |
| Goucher College  | Baltimore     | MD    | 2,173        |
| Davidson College | Davidson      | NC    |              |
| Grinnell College | Grinnell      | IA    | 1,655        |

Note that we don't have the enrollment data for Davidson College so leave that cell empty. While you can import the data into R dirctly from Google Sheets, you can download the data and then import it into R. For downloading the data set you just created click on File and then on Download as and download the data in the format you like. We will import the data into R in future lessons. 

R uses its own formats for data files. The most common format is .rdata or .rda files. If a data is saved as .rdata it can be directly imported into R using the command `load("<FileName>.RDA")`.


### Slides and Video

![What is data](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/1w7qP4LXwMUv-9mJQZgRdOqMCuUL82z7-rUGk4EoydDg/edit?usp=sharing)


{quiz, id: quiz_01_getting_data}

### Getting Data into R quiz

? What does the `rm()` function does?

a) Import .csv files
b) Import .xlsx files
C) Delete data from R environment
d) Sort data in R

? Which of the following is an R data format type?
a) csv
B) rda
c) xlsx
d) txt


{/quiz}

