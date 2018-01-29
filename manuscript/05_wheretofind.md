# Where to Find Data?

Now that we know what data are, the next question you should be asking is where to find data. In some cases you create your own data set but in other cases you need to use data that others have created. 

## Public versus private data

Before discussing where to find data, we need to know what privately-accessed and public data are. While you normally do now have access to privately-accessed data or restricted data, most public data are publicly and freely available. Note that sometimes you can access for private data by simply just requesting or paying for the data and sometimes even public data are avialable upon request. Most company data are private while most government data are public. 

## Sources of data

Data can be found from differernt sources. As you choose an occupation in data science, a lot of your job is to work with corportae data. 



## Importing CSV files from the web

Sometimes the data you need to work with is online. While we will later learn that you can import them directly into R, it's good to know that you can also import CSV files hosted on the web directly into Google Sheets. For instance, the dataset [here](https://raw.githubusercontent.com/datasets/gdp/master/data/gdp.csv) is a CSV file containing countries GDPs (national incomes). In order to import the file directly to Google Sheets, open a blank Google Sheets document as we learned before. In the first cell (top left corner) type in `=importData("https://raw.githubusercontent.com/datasets/gdp/master/data/gdp.csv")`. Make sure to include the equal sign (=) in the beginning. This will import all the data to your Google Sheets document. 