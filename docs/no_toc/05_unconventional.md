# Unconventional Sources of Data

Up to this point in the course set, we've primarily worked with data in a tidy spreadsheet format. Whether this was data that we had to wrangle to get into that format or data stored in a database already in a tidy format, it was tidy nonetheless. It's important, however, to know that data do not always come in a spreadsheet-friendly format. While as a data scientist you will often be working with data stored in spreadsheets, you'll also likely work with some *unconventional* types of data.

### Structured Data

So far, we have primarily focused on structured data. **Structured Data** are data that have a high degree of organization. Tidy spreadsheets where the data can be easily analyzed using the data wrangling and visualization skills discussed so far in this course set are an example of structured data.

### Unstructured Data

Unstructured data, on the other hand, are data that are not organized in a pre-defined manner. These data do not fit into rows and columns in a spreadsheet. Unstructured data may contain text, images, audio files, and even video files. Given the differences in these types of data, traditional methods for cleaning and analyzing these kind of data are not as helpful. Nevertheless, there are ways to work with these data in R. We'll introduce a number of different types of unstructured data and then give you a brief example of where you would start if you wanted to work with each unconventional data type in R.


![Unstructured data types](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g392f0f9db9_1_9)

### Text Data

While most of the data we've seen so far has been stored in rows and columns within a spreadsheet, text documents or words of any kind can also be data! **Text analytics** or **text mining** is the process of taking large collections of text, generating a dataset from the that can be analyzed, and analyzing the words in that dataset. In other words, text mining is the process of converting textual data from unstructured form to a structured form for analysis or visualization.

An application of text mining is **sentiment analysis**. In sentiment analysis, the goal is to categorize the text and quantify opinions expressed within the text. For instance, in a lot of satisfaction surveys, as you may have taken, the company asks you to express your opinion about your experience or a specific product in a few sentences. Historically, due to the fact that survey respondents could have typed anything they wanted in these boxes, these kind of data were often ignored when analyzing the survey data due to their *unstructured* nature. In other words, free text responses on a survey can be hard to analyze.

In cases where these data *were* analyzed, the text from each survey respondent would have been read by a human. That human would asses what the response and assign a score as to how positive or negative the text was. However, using sentiment analysis we are now able to read a vast amount of textual data and use an algorithm to assign that value to respondent's attitude toward the service or the product.

There are different approaches to sentiment analysis. Sometimes, a paragraph of text will be evaluated to assess how sad or happy the words in the text are. Other times, you'll use sentiment analysis to gauge how positive or negative the words in the text are. Other times still, words will be analyzed using sentiment analysis to determine how scientific or unscientific text is. For more on sentiment analysis read this [this article](https://www.crimsonhexagon.com/blog/what-is-sentiment-analysis/).


![Sentiment analysis](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g392f0f9db9_1_15)

#### Analyzing Text in R

While not the most typical type of data analyzed in R, R can be used to analyze text. There are three packages that are particularly helpful for analyzing textual data sing text mining:

* `tm` : a text mining package
* `tidytext` : a tidy analysis package ; works with tidy data tools (i.e. dplyr)
* `languageR` : Statistical analysis of linguistic data


To see an example of text analysis in R, check out David Robinson's post [Text analysis of Trump's tweets confirms he writes only the (angrier) Android half](http://varianceexplained.org/r/trump-tweets/), where he uses the `tidytext` package, `twitteR` package, and Twitter API to analyze the tweets from Donald Trump during his presidential campaign.



![Analysis of tweets in R](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_7)

### JSON: JavaScript Object Notation

In an earlier lesson in this course we touched on the fact that JSON is a text-based way to send information between a browser and a server and a frequent format in which you'll retrieve data from an API call. We also mentioned that JSON format requires objects to be comprised of **key-value pairs**. For example, in the case of: `{"Name": "Isabela"}`, "Name" would be a key, "Isabela" would be a value, and together they would be a key-value pair.


![JSON data contain key-pairs](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_21)

That's where we left our explanation of JSON data in the earlier lesson. Here we'll use a snippet of JSON data to explain that in addition to using key-pairs JSON data are *nested* and *hierarchical*. This means that key-pairs can be organized into different levels (hierarchical) with some levels of information being stored *within* other levels (nested).

Using a snippet of JSON data here, we see a portion of JSON data from Yelp explaining a restaurant. We're looking at the `attributes` of this restaurant. Within `attributes`, there are four nested categories: `Take-out`, `Wi-Fi`, `Drive-Thru`, and `Good For`. In the hierarchy, attributes is at the top, while these four categories are within attributes. Within one of these attributes `Good For`, we see another level within the hierarchy. In this third level we see a number of other categories nested within `Good For`. This should give you a slightly better idea of how JSON data are structured.


![JSON data are hierarchical and nested](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_13)

#### Analyzing JSON in R

Above we discussed how to analyze pure text (meaning, text written by humans in their native written and spoken language). Here, we'll discuss how to briefly how others have wrangled text-based data from the Internet in the JSON format within R. This is possible because of the R package `jsonlite`, which was used in the following example:

[Kan Nishida](https://blog.exploratory.io/@kanaugust), a data scientist, was interested in [understanding what restaurant types found most frequently in each state or province](https://blog.exploratory.io/working-with-json-data-in-very-simple-way-ad7ebcc0bb89). To do this, he used JSON data originally released from Yelp. He wrangled the data from JSON format into a tabular format using `jsonlite` and other data wrangling packages, such as `dplyr`, to ultimately determine the types of restaurants found most frequently in a number of different states and provinces.


![Wrangling Yelp data from JSON into tidy tabular data](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_17)

### XML: Extensible Markup Language

**Extensible Markup Language (XML)**, is another human- and machine-readable language that is used frequently by web services and APIs. However, instead of being based on key-value pairs, XML relies on **nodes**, **tags**, and **elements**. The author defines these *tags* to specify what information is included in each *element* of the XML document and allows for elements to be nested within one another. The **nodes** define the hierarchical structure of the XML (which means that XML is hierarchical and nested like JSON)!


![XML format relies on nodes, tags, and elements](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_128)

XML accomplishes the same goal as JSON, but it just does it in a different format. Thus, the two formats are used for similar purposes -- sharing information on the web; however, because the format in which they do this is different, a different R package is needed to process XML data. This packages is called `xml2`.

#### Analyzing XML in R

To see an example of not only using `xml2` to parse XML data, but also another example of using `rvest` to obtain the XML data, check out this post from [José Roberto Ayala Solares](https://towardsdatascience.com/@jroberayalas) where he took the text from a New York Times article called ["Trump's Lies"](https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html), scraped the data from the web (obtaining it in XML), and then [wrangled it into a tidy format](https://towardsdatascience.com/web-scraping-tutorial-in-r-5e71fd107f32) using `xml2`.


![`rvest` and `xml2` are helpful for web scraping and working with XML data](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_148)

In this lesson, our goal is to make you aware that data from the Internet (and APIs in particular) will often come in either JSON or XML format. Thus, the JSON and XML examples provided here only give you a bit of an idea of what JSON and XML data are and how to work with them. Nevertheless, the more frequently you retrieve data from APIs and the Internet, the more comfortable you'll have to become with both JSON and XML. And, `jsonlite` and `xml2` will help you as you work with these data in R!

### Images

Only a few decades ago, analyzing a large dataset of images was not feasible for most researchers. Many didn't even think of images as data. But, there is so much we can get from analyzing image data. Although we will not study images processing techniques in this lesson, let's look at one example that give us an idea of how image data can be used.

Within Google Maps there is a Street View feature that allows panoramic views from positions along many streets in the world. One of the things you may notice if you're looking around on Google Maps' street view is that for many streets in the world you do not only see houses; you are also able to see cars.


![Google Maps street view](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g392f0f9db9_0_4)


Some 50 million images of cars from over 200 cities were used by researchers to detect the make, model, body type, and age of the cars in each neighborhood. They were able to take unstructured image data and compile a structured data set! These same researchers then pulled together a structured dataset from the Census and the 2008 elections of demographic information (such as race and income), and voting history in these same neighborhoods.


![Data used from Google Maps street view to predict demographics of a neighborhood](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g2bfdb07292_0_151)

Using these two datasets (the Google Street view car image data and the demographic data), researchers used a technique known as **machine learning** to build an algorithm that could, from the images of cars in a neighborhood, predict the demographics (race, income, etc) and how that area is likely to vote. Comparing these two sets of data, they were able to accurately estimate income, race, education, and voting patterns at the zip code level from the Google Street view images.


![Cars in a neighborhood can predict how the area votes](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_0)



#### Analyzing Images in R

Like with text, there are packages in R that will help you carry out analysis of images. In particular, `magick` is particularly helpful for advanced image processing within R, allowing you to process, edit, and manipulate images within R. Like JSON and XML, where there is more than one file format for a similar task, there are also a number of different image file formats. We touched on the pros and cons of a number of these in the Data Visualization course; however, of importance here is the fact that the `magick` package is capable of working with many different types of images, including PNG, JPEG, and TIFF. The `magick` package has a particularly helpful [vignette](https://cran.r-project.org/web/packages/magick/vignettes/intro.html#drawing_and_graphics) where you can learn the ins and outs of working with images using `magick`'s functionality. Their documentation will discuss how to read image data into R, how to edit images, and even how to add images to your R plots!


![`magick` package's example of adding an image to a plot](![Google Maps street view](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/export/png?id=1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU&pageid=g3d555e2b2e_0_153)



### Audio Files

So much of the data generated today comes in the form of audio files. This could be all the data contained within the MP3 files of your favorite songs or the audio files saved in the archives from the speeches of politicians. While certainly not tabular data, there is a lot of information stored within all the audio files we've generated!

It likely isn't surprising that there are [many different file types](https://en.wikipedia.org/wiki/Audio_file_format) to store audio data. MP3s are currently the most common file format, becoming popular as CDs became less popular due to the fact that the same audio file saved as an [MP3](https://en.wikipedia.org/wiki/MP3) would take up *much* less space than the same file stored on a CD. However, if working with audio files, one would want to learn much more about how audio files are stored in different file formats.

#### Analyzing Audio Files in R

There are two packages that will likely be helpful for analyzing audio files in R:

* `tuneR` - package to analyze music and speech
* `seewave` - package to analyze, manipulate, display, edit and synthesize sound waves

Admittedly, working with audio files in R is not as common as working with tabular data; however, that just means there's room for development and exploration of how to approach audio files in R. To see how others have worked with audio files in R, take a look through the following examples:

* [transcribing music in R using `tuneR`](http://www.vesnam.com/Rblog/transcribing-music-from-audio-files-2/), by [Vessy](http://www.vesnam.com/Rblog/aboutme/)
* [clustering music in R using `tuneR` and `seewave`](http://www.vesnam.com/Rblog/sortmymusic/), by [Vessy](http://www.vesnam.com/Rblog/aboutme/)


### Summary

In this lesson, we've briefly reviewed a number of different unconventional sources of data. These are data sources that are unstructured and not tabular. We've provided examples for each type of unconventional data and links to where you may start if you wanted to work with each type of data in R. This lesson is an introduction into these types of data, but is by no means exhaustive. To get more practice, it's best to complete the exercise accompanying this lesson, where you'll get practice working with the `tidytext` package and sentiment analysis!


### Additional Resources

#### Text Mining

* [`tm` vignette](http://varianceexplained.org/r/trump-tweets/)
* ["Text Mining with R"](https://www.tidytextmining.com/), by [Julia Silge](https://juliasilge.com/) and [David Robinson](http://varianceexplained.org/about/)
* [Analysis of Trump's tweets](http://varianceexplained.org/r/trump-tweets/), by [David Robinson](http://varianceexplained.org/about/)
* [tutorial: "Text Mining in R""](https://www.springboard.com/blog/text-mining-in-r/), by Shubham Simar Tomar

#### JSON & XML
* [JSON Yelp Tutorial](https://blog.exploratory.io/working-with-json-data-in-very-simple-way-ad7ebcc0bb89), by [Kan Nishida](https://blog.exploratory.io/@kanaugust)
* [An Introduction to XML](https://www.sitepoint.com/really-good-introduction-xml/)
* [`xml2` package](https://blog.rstudio.com/2015/04/21/xml2/)
* [`xml2` Trump's Lies example](https://towardsdatascience.com/web-scraping-tutorial-in-r-5e71fd107f32)

#### Images

* [`magick` package](https://cran.r-project.org/web/packages/magick/vignettes/intro.html)
* ["Google Street View Can Reveal How Your Neighborhood Votes"](https://www.citylab.com/transportation/2017/12/google-street-view-data-demographics-cars-research/547436/); [Original Publication](http://www.pnas.org/content/pnas/early/2017/11/27/1700035114.full.pdf?sid=fb6ef880-a27f-4280-a693-5c2ab16fe65d)

#### Audio

* [`tuneR` and `seewave` tutorial](http://samcarcagno.altervista.org/blog/basic-sound-processing-r/?doing_wp_cron=1527700628.0053870677947998046875), by [Sam Carcagno](http://samcarcagno.altervista.org/index.html)
* [`tuneR` tutorial: transcribing music](http://www.vesnam.com/Rblog/transcribing-music-from-audio-files-2/), by [Vessy](http://www.vesnam.com/Rblog/aboutme/)
* [`tuneR` and `seewave` tutorial: clustering music](http://www.vesnam.com/Rblog/sortmymusic/), by [Vessy](http://www.vesnam.com/Rblog/aboutme/)


### Slides and Video

![Unconventional Sources of Data](https://www.youtube.com/watch?v=MTnInCPxUjo)

* [Slides](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/edit?usp=sharing)
