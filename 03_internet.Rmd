# Getting Data From the Internet

In the introductory lesson, we mentioned that there is a lot of data on the Internet, which probably comes at no surprise given the vast amount of information on the Internet. Sometimes these data are in a nice CSV format that we can quickly pull from the Internet. Sometimes, the data are spread across a web page, and it's our job to "scrape" that information from the webpage and get it into a usable format. Knowing first that this is possible within R and second, having some idea of where to start is an important start to beginning to get data from the Internet.

We'll walk through three R packages in this lesson to help get you started in getting data from the Internet. So, before we jump in, we'll have you install these packages:

```r
## Install packages
install.packages(c("httr", "rvest", "jsonlite"))
```

### API access

In the first lesson we mentioned that **Application Programming Interfaces (APIs)** are, in the most general sense, software that allow to different web-based applications to communicate with one another over the Internet. Modern APIs conform to a number of standards. This means that many different applications are using the same approach, so a single package in R is able to take advantage of this and communicate with many different applications, as long as the application's API adheres to this generally agreed upon set of "rules".

The R package that we'll be using to acquire data and take advantage of this is called `httr`. This package name suggests that this is an "R" package for "HTTP". So, we know what R is, but what about HTTP?

You've probably seeing HTTP before at the start of web addresses, (ie http://www.gmail.com), so you may have some intuition that HTTP has something to do with the Internet, which is absolutely correct! HTTP stands for Hypertest Transfer Protocol. In the broadest sense, HTTP transactions allow for messages to be sent between two points on the Internet. You, on your computer can request something from a web page, and the protocol (HTTP) allows you to connect with that webpage's server, do something, and then return you whatever it is you asked for.

Working with a web API is similar to accessing a website in many ways. When you type a URL (ie www.google.com) into your browser, information is sent from your computer to your browser. Your browser then interprets what you're asking for and displays the website you've requested. Web APIs work similarly. You **request** some information from the API and the API sends back a **response**.

The `httr` package will hep you carry out these types of requests within R. Let's stop talking about it, and see an actual example!


![HTTP access via `httr`](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_69)

### Getting Data: `httr`

HTTP is based on a number of important verbs : `GET()`, `HEAD()`, `PATCH()`, `PUT()`, `DELETE()` and `POST()`. For the purposes of retrieving data from the Internet, you may be able to guess which verb will be the most important for our purposes! `GET()` will allow us to *fetch* a resource that already exists. We'll specify a URL to tell `GET()` where to go look for what we want. While we'll only highlight `GET()` in this lesson, for full understanding of the many other HTTP verbs and capabilities of `httr`, refer to the additional resources provided at the end of this lesson.

`GET()` will access the API, provide the API with the necessary information to request the data we want, and retrieve some output.


![API requests are made to an API endpoint to get an API response](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_90)

### Example 1: GitHub's API

The example is based on a wonderful [blogpost](https://www.tylerclavelle.com/code/2017/randapis/) from [Tyler Clavelle](https://www.tylerclavelle.com/about/). In this example, we'll use will take advantage of GitHub's API, because it's accessible to anyone. Other APIs, while often freely-accessible, require credentials, called an **API key**. We'll talk about those later, but let's just get started using [GitHub's API](https://developer.github.com/v3/) now!

#### API Endpoint

The URL you're requesting information from is known as the **API endpoint**. The documentation from GitHub's API explains what information can be obtained from their API endpoint: [https://api.github.com](https://api.github.com). That's the base endpoint, but if you wanted to access a particular individual's GitHub repositories, you would want to modify this base endpoint to: `https://api.github.com/users/username/repos`, where you would replace `username` with *your* GitHub username.   

#### API request: `GET()`

Now that we know what our API endpoint is, we're ready to make our **API request** using `GET()`.

The goal of this request is to obtain information about what repositories are available in *your* GitHub account. To use the example below, you'll want to change the username `janeeverydaydoe` to your GitHub username.

```
## load package
library(httr)
library(dplyr)

## Save GitHub username as variable
username <- 'janeeverydaydoe'

## Save base endpoint as variable
url_git <- 'https://api.github.com/'

## Construct API request
api_response <- GET(url = paste0(url_git, 'users/', username, '/repos'))
```

Note: In the code above, you see the function `paste0()`. This function concatenates (links together) each the pieces within the parentheses, where each piece is separated by a comma. This provides `GET()` with the URL we want to use as our endpoints!


![`httr` code to access GitHub](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_54)


#### API response: `content()`

Let's first take a look at what other variables are available within the `api_response` object:

```r
## See variables in response
names(api_response)
```


![`httr` response](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_112)


While we see ten different variables within `api_response`, we should probably first make sure that the request to GitHub's API was successful. We can do this by checking the status code of the request, where "200" means that everything worked properly:

```r
## Check Status Code of request
api_response$status_code
```

But, to be honest, we aren't really interested in just knowing the request worked. We actually want to see what information is contained on our GitHub account.

To do so we'll take advantage of `httr`'s `content()` function, which as its name suggests, extracts the contents from an API request.

```r
## Extract content from API response
repo_content <- content(api_response)
```


![`httr` status code and `content()`](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_117)

You can see here that the length of `repo_content` in our case is 6 by looking at the Environment tab. This is because the GitHub account `janeeverydaydoe` had six repositories at the time of this API call. We can get some information about each repo by running the function below:

```r
## function to get name and URL for each repo
lapply(repo_content, function(x) {
  df <- data_frame(repo = x$name,
                   address = x$html_url)}) %>%
  bind_rows()
```


![output from API request](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_132)

Here, we've pulled out the name and URL of each repository in Jane Doe's account; however, there is *a lot* more information in the `repo_content` object. To see how to extract more information, check out the rest of Tyler's wonderful post [here](https://tclavelle.github.io/blog/r_and_apis/).


### Example 2: Obtaining a CSV

In a previous course in this Course Set on Data Visualization, we assigned a project where the data for the project had already been saved on RStudio Cloud for you in CSV format. *However*, these data are available on the Internet. Now that we know how to use `httr` and have an understanding about APIs, let's do that now!

So, the data are available for download from this link: [data.fivethirtyeight.com](https://data.fivethirtyeight.com/), but are also hosted on GitHub [here](https://github.com/fivethirtyeight/data), and we will want to use the specific URL for this file: [https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv](https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv) in our `GET()` request.


![steak-survey on GitHub](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_148)

To do so, we would do the following:

```r
## Make API request
api_response <- GET(url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/steak-survey/steak-risk-survey.csv")

## Extract content from API response
df_steak <- content(api_response, type="text/csv")
```


![`GET()` steak-survey CSV](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_154)

Here, we again specify our url within `GET()` followed by use of the helpful `content()` function from `httr` to obtain the CSV from the `api_response` object. `df_steak` includes the data from the CSV directly from the GitHub API, without having to download the data first!


### API keys

Not all API's are as "open" as GitHub's. For example, if you ran the code for the first example above exactly as it was written (and didn't change the GitHub username), you would have gotten information about the repos in janeeverydaydoe's GitHub account. Because it is a fully-open API, you're able to retrieve information about not only your GitHub account, but also other users' public GitHub activity. This makes good sense because sharing code among public repositories is an important part of GitHub.

Alternatively, while Google also has an API (or rather, *many* API's), they aren't quite as open. This makes good sense. There is no reason I should have access to the files on someone else's Google Drive account. Controlling whose files one can access through Google's API is an important privacy feature.

In these cases, what is known as a key is required to gain access to the API. **API keys** are obtained from the website's API site (ie, for Google's APIs, you would start [here](https://developers.google.com/apis-explorer/#p/). Once acquired, these keys should **never be shared on the Internet**. There is a reason they're required, after all. So, be sure to **never push a key to GitHub or share it publicly**. (If you do ever accidentally share a key on the Internet, return to the API and disable the key immediately.)

For example, to access the Twitter API, you would obtain your key and necessary tokens from [Twitter's API](https://developer.twitter.com/en/docs/tweets/search/overview) and replace the text in the `key`, `secret`, `token` and `token_secret` arguments below. This would authenticate you to use Twitter's API to acquire information about your home timeline.

```r
myapp = oauth_app("twitter",
                   key = "yourConsumerKeyHere",
                   secret = "yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```

### Web Scraping

Now that we've walked through two cases of obtaining data using an API and discussed API keys, let's transition a little bit to talking about how to pull pieces of data from a website, when the data aren't (yet!) in the format that we want them.

In the first lesson of this course, we talked about the example of wanting to start a company but not knowing exactly what people you'll need. So, you go to the websites of a bunch of companies similar to the company you start and pull off all the names and titles of the people working there. You then compare the titles across companies and voila, you've got a better idea of who you'll need at your new company.

You could imagine that while this information may be helpful to have, getting it manually would be a pain. Navigating to each site individually, finding the information, copying and pasting each name. That sounds awful! Thankfully, there's a way to scrape the web from R directly!

This uses the helpful package `rvest`. It gets its name from the word "harvest." The idea here is you'll use this package to "harvest" information from websites! However, as you may imagine, this is less straightforward than pulling data that are already formatted the way you want them (as we did above), since we'll have to do some extra work to get everything in order.

#### `rvest` basics

When `rvest` is given a webpage (URL) as input, an `rvest` function reads in the HTML code from the webpage. HTML is the language websites use to display everything you see on the website. You've seen HTML documents before, as this is one of the formats that you can Knit to from an R Markdown (.Rmd) document! Generally, all HTML documents require each webpage to have a similar structure. This structure is specified by using different **tags**. For example, a header at the top of your webpage would use a specific tag. Website links would use a different tag. These different tags help to specify how the website should appear. `rvest` takes advantage of these tags to help you extract the parts of the webpage you're most interested in. So let's see exactly how to do that all of this with an example.


![Different tags are used to specify different parts of a website](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_179)


#### SelectorGadget

To use `rvest`, there is a tool that will make your life *a lot* easier. It's called SelectorGadget. It's a "javascript bookmarklet." What this means for us is that we'll be able to go to a webpage, turn on SelectorGadget, and help figure out how to appropriately specify what components from the webpage we want to extract using `rvest`.

To get started using SelectorGadget, you'll have to enable the Chrome Extension.

To enable SelectorGadget:  

1. Click [here](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb) to open up the SelectorGadget Chrome Extension

2. Click "ADD TO CHROME"


![ADD TO CHROME](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_9)


3. Click "Add extension"


![Add extension](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_5)

4. SelectorGadget's icon will now be visible to the right of the web address bar within Google Chrome. You will click on this to use SelectorGadget in the example below.


![SelectorGadget icon](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_0)

#### Web Scraping Example

Similar to the example above, what if you were interested in knowing a few recommended R packages for working with data. Sure, you could go to a whole bunch of websites and Google and copy and paste each one into a Google Sheet and have the information. But, that's not very fun!

Alternatively, you could write and run a few lines of code and get all the information that way! We'll do that in the example below.

##### Using SelectorGadget

To use SelectorGadget, navigate to the webpage we're interested in scraping: [http://jhudatascience.org/stable_website/webscrape.html](http://jhudatascience.org/stable_website/webscrape.html) and toggle SelectorGadget by clicking on the SelectorGadget icon. A menu at the bottom-right of your web page should appear.


![SelectorGadget icon on webpage of interest](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_22)

Now that SelectorGadget has been toggled, as you mouse over the page, colored boxes should appear. We'll click on the the name of the first package to start to tell SelectorGadget which component of the webpage we're interested in.


![SelectorGadget selects `strong` on webpage of interest](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_31)

An orange box will appear around the component of the webpage you've clicked. Other components of the webpage that SelectorGadget has deemed similar to what you've clicked will be highlighted. And, text will show up in the menu at the bottom of the page letting you know what you should use in `rvest` to specify the part of the webpage you're most interested in extracting.

Here, we see with that SelectorGadget has highlighted the package names and nothing else! Perfect. That's just what we wanted. Now we know how to specify this element in `rvest`!

##### Using `rvest`

Now we're ready to use `rvest`'s functions. We'll use `read_html()` to read in the HTML from our webpage of interest.

We'll then use `html_nodes()` to specify which parts of the webpage we want to extract. Within this function we specify "strong", as that's what SelectorGadget told us to specify to "harvest" the information we're interested in.

Finally `html_text` extracts the text from the tag we've specified, giving us that list of courses we wanted to see!

```
## load package
library(rvest)

## provide URL
courses <- read_html("http://jhudatascience.org/stable_website/webscrape.html")

## Get Courses
courses %>%
  html_nodes("strong") %>%
  html_text()
```

![`rvest` code](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_188)

With just a few lines of code we have the information we were looking for!


![List of packages](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_36)

#### A final note: SelectorGadget

SelectorGadget selected what we were interested in on the first click in the example above. However, there will be times when it makes its guess and highlights more than what you want to extract. In those cases, after the initial click, click on any one of the items currently highlighted that you don't want included in your selection. SelectorGadget will mark that part of the webpage in red and update the menu at the bottom with the appropriate text. To see an example of this, watch this short video [here](https://vimeo.com/52055686).

### JSON

In talking about APIs and API request calls, we left out a *tiny* bit of information. API requests generally return data in one of two data formats: JSON or XML. We'll discuss a bit more about each these data formats in future lessons. However, as this is a lesson about obtaining information from the Internet, we'd be remiss not to mention that there are ways to work with JSON data in R, using the package `jsonlite`.

*Very* briefly here (more to come later!), JSON (JavaScript Object Notation) is a text-based way to send information between a browser and a server. JSON is easy for humans to read and to write. Thus, it makes sense that API calls would return information in the JSON format. JSON data adhere to certain rules in how they are structured. For simplicity, JSON format requires objects to be comprised of **key-value pairs**. For example, in the case of: `{"Name": "Isabela"}`, "Name" would be a key, "Isabela" would be a value, and together they would be a key-value pair. Let's take a look at how JSON data looks in R.

```r
library(jsonlite)

## generate a JSON object
json <-
'[
  {"Name" : "Woody", "Age" : 40, "Occupation" : "Sherriff"},
  {"Name" : "Buzz Lightyear", "Age" : 34, "Occupation" : "Space Ranger"},
  {"Name" : "Andy", "Occupation" : "Toy Owner"}
]'

## take a look
json
```

This format cannot, as it is, be easily worked with within R; however, there is an R package to take data from JSON format to an object-based format, that *can* be worked with in R. The R package `jsonlite` is just what to work with whenever you have data in JSON format. When using the defaults of the function `fromJSON()`, `jsonlite` will take the data from JSON array format and helpfully return a data frame.

```r
## take JSON object and covert to a data frame
mydf <- fromJSON(json)

## take a look
mydf
```


![`fromJSON()`](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_219)


Data frames can also be returned to their original JSON format using the function: `toJSON()`.

```r
## take JSON object and convert to a data frame
json <- toJSON(mydf)
```


![`toJSON()`](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/export/png?id=1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg&pageid=g3d5b27bb5d_0_228)


Here, we've just briefly touched on what JSON format is; however, in a future lesson we'll discuss this in greater detail. For now, however, it's important to know that the `jsonlite` package is there for you whenever you have JSON data. And, it has two very helpful functions (among other functions in the package!): `toJSON()` and `fromJSON()` for such situations.


### Keeping Track of your Data

So far, we've discussed how to work with data you've obtained from the Internet. However, things on the Internet can change. If you're not downloading the file to your system directly, you won't have a static copy saved on your system. This means that while you're saving space on your computer and not creating unnecessary copies of an identical file, the next time you go to access the file, it may not be there *or* it may have been updated. For these reasons, it's incredibly important to record the date of when you acquired the data. This can be recorded in your R Markdown file where you're doing your analysis or your data science lab notebook (to be discussed in a later lesson). Regardless, however, a record of the date you acquired the data is incredibly important.

### Summary

In this lesson we've covered a lot! We've gone through the basics of accessing API's and scraping data from websites. And, we've touched on how to work with data that come to you in JSON format. Knowing what R is capable is a big part of this lesson. And, getting comfortable with the few examples here will be helpful when you branch out and start to use these packages on your own in the future! As we've just scraped the surface in this lesson, take a look at the additional resources below to get a better understanding of these topics!

### Additional Resources

#### httr
* [HTTP basics](https://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)
* [httr: Quick Start Guide](https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html)
* [httr tutorial](https://www.tylerclavelle.com/code/2017/randapis/), by [Tyler Clavelle](https://www.tylerclavelle.com/about/)
* [GitHub API Documentation](https://developer.github.com/v3/)

#### rvest
* [rvest tutorial](https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/), from RStudio
* [rvest documentation](https://github.com/hadley/rvest)
* [SelectorGadget documentation + video](https://selectorgadget.com/)


#### jsonlite
* [jsonlite: Getting Started](https://cran.r-project.org/web/packages/jsonlite/vignettes/json-aaquickstart.html)
* [blogpost on jsonlite](https://www.opencpu.org/posts/jsonlite-a-smarter-json-encoder/), by [Jeroen Ooms](https://github.com/jeroen)
* [JSON information](https://www.json.org/)
* [JSON : What It Is, How It Works, & How to Use It](https://www.copterlabs.com/json-what-it-is-how-it-works-how-to-use-it/)

### Slides and Video

![Getting Data From the Internet](https://www.youtube.com/watch?v=CEo1eLI2CY4)

* [Slides](https://docs.google.com/presentation/d/1oK-vBO2kVl9VlzsZTwd61pqURcdKfRulmrOoxYkjlLg/edit?usp=sharing)
