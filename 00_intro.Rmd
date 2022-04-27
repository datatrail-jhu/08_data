{
course-completeness: 100
course-attempts: 2
default-quiz-attempts: 2
default-random-choice-order: true
default-quiz-show-answers: none
}

# Where Does Data Come From?

We've previously discussed that data are everywhere. Every time you buy something with a credit card or like a photo on Instagram, data is generated. Spreadsheets where you track your finances are data. The photos you upload to social media are data. The tweets people write are data. The information on your favorite website is data. Clearly, in today's world, data are everywhere. And, as a data scientist, your job is to work with the data at your disposal to answer questions. Therefore, you need to know how to work with the data generated.

In previous courses in this Course Set, you've learned how to work with data in RStudio Cloud; however, in most of these cases we've either used data that are available in R by default *or* have given you the code to directly read the data into RStudio Cloud. In this course, we'll now formalize the various types of data that data scientists work with most often and teach you how to read each type of data into R. We'll also spend a little bit of time talking about some less conventional types of data in slightly less detail so you're aware packages that exist for working with these types of data, even if you aren't working with them every day.

We hope that having all this information in one place will help you not only understand the various file types but also provide you a resource to reference in the future as you work with various types of data! In this lesson we'll briefly introduce a number of different types of data. In the subsequent lessons of this course we'll walk through step-by-step on how to get these data into R,  discuss where you can find data sets to work with, and discuss important information about the required safety, privacy, and ethical concerns that arise when working with data.

### Basic Data files

Data Scientists are often working with data stored in spreadsheets. This probably doesn't come as a surprise, as most of the example data you've worked on throughout this Course Set so far has used data in this format. Often, these data are stored in **comma-separated value (CSV)** files. However, data of this format can also be stored in Google Sheets, Excel (.xlsx, .xls), and tab-delimited files (.txt), among others. We'll define the various file formats and discuss how to get these types of data into R in the next few lessons in this course.

### Data from the Internet

In addition to data in the form of spreadsheets that you have stored on your computer or in Google Sheets, there is *a lot* of data on the Internet. Sometimes this is in the form of data tables that are on a website and that you want to be able to read into R. Sometimes, you want to pull information from a webpage and get it into a usable format for your own analysis. In these cases, there are often ways to access this information.

#### APIs

**Application Programming Interfaces (APIs)** are, in the most general sense, software that allow to different web-based applications to communicate with one another over the Internet. APIs are used by software developers and programmers frequently to allow apps to communicate with one another; however, for our purposes APIs can be incredibly helpful for retrieving data.

For example, if there was a dataset on the Internet that you wanted to use in RStudio Cloud, you could use an API to communicate with the website where those data are located, get access to the data, and then have the data in RStudio Cloud to work with. All of this is possible because of APIs, allowing for all of that communication between applications to occur without us even being aware. We'll walk through the steps of getting data from the Internet via APIs in a later lesson in this course.

#### Web Scraping

Sometimes, data are on a web page but not necessarily in a nice data table. For example, imagine that there is a list of individuals working at a company with a picture of each individual, their job title, and a description of what each person does at the company. Now, imagine that there are a lot of these websites with similar information. Now, imagine that you're starting up a company and want to figure out what types of people you'll need at this company by using information from what others have done at similar companies. You *may* want to obtain the name and job title of the individuals at each company from their websites so that you can compare what job titles are working at each company. To do this, you would obtain the necessary information from each website and get it into a usable format. This process is called **web scraping**. We'll discuss how to do this in a future lesson in this course.

### Relational Databases

In addition to singular spreadsheets of data, data that are more complex than what can be stored in a single spreadsheet are often stored in what are known as **relational databases**. Relational databases contain multiple tables that are related to one another in some way. For example, consider a spreadsheet of all the restaurants in your area. This spreadsheet may contain information about the restaurant's name, its location, and what type of food it serves.

Now, imagine a separate spreadsheet containing information about food inspections. Each row could contain a different inspection, the date the inspection was performed, who performed the inspection, and information about how the restaurant performed. Each restaurant would have multiple inspections, assuming they restaurant has been open a while.

This means that if you wanted to know where a restaurant was located and information about how that restaurant has performed on inspection, you'd have to go the first spreadsheet, find the information about the restaurant's location there and then go search in the second spreadsheet and get all the rows that correspond to that restaurant's inspections.

This can all be accomplished with separate spreadsheets. However, these data can be more easily stored and searched using a relational database. In such a case, each restaurant would have a unique ID. This ID would be stored in both spreadsheets, allowing one to easily pull out all the desired information using that single ID. This is what we mean by **relational**. The information within the database is all related to one another (in our example, each contains information about restaurants); however, each spreadsheet within the database contains different information. You can pull out each type of information using the unique ID for the restaurant your interested in! Relational databases help keep track of data as datasets grow and new pieces of information are incorporated. We'll discuss how to work with relational databases within R in a later lesson in this course.

### Unconventional Data

In addition to information stored in spreadsheets and relational databases or data scraped from the web, there are *many* other types of data that one could work with, but that data scientists typically work with less frequently.

#### Text

Politicians give speeches. Authors write books. Everyone writes e-mails. All of these generate *a lot* of text. While not as straightforward as analyzing numbers, text too can be analyzed. From text, we can draw insights about what words have been used historically and how this has changed over time. We can use the words from a book to infer in what year that book was written, given the words used in the book. Or, we could analyze what words in an email elicit a response, and what words elicit that response most quickly. Thus, it's important to understand that it's possible to analyze text within RStudio Cloud.

#### Images

Similarly, it won't come as any surprise that images are all around us. Pictures are constantly being posted to social media, and nearly every online news story is accompanied by at least one image. The ability to analyze images allows Facebook to guess who you are when a picture is posted of you. And, it allows software programs to take to pictures and guess what those individuals' kids may look like. The ability to analyze images is, as stated for text, not always the most straightforward, but is also possible within RStudio Cloud.

#### Audio Files

We are constantly barraged with sound. We listen to music and podcasts through our phones, radios, and computers. And, we leave voicemails and voice messages for one another regularly. These generate audio files. Consider having access to audio files for thousands of popular songs. One could analyze these to group these files by genre and build a model that predicts which types of songs in the future will be the most popular.


### Slides and Video

![Where Does Data Come From](https://www.youtube.com/watch?v=yuA6k-xidsY)

* [Slides](https://docs.google.com/presentation/d/1GYO96TWYSP-fgO_w3CpT8UxSxzALn2yu19TTXYF8x4U/edit?usp=sharing)
