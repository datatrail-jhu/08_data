# Unconventional Sources of Data

Data does not always come in a tidy clean format and it's not always intended. The somewhat lesser understood types of data are the ones that are usually generated as a by-product of some other process. These types of data are usually overlooked or even considered waste. But you will realize as a data scientists that you can find meaningful trends using these more *unconventional* types of data. 

### Unstructured data

One of the terms that you will hear a lot is unstructured data. Unstructured data are in general data that are not organized in a pre-defined manner. Unstructured data may contain text, dates, images, audio files, or even video files. Therefore, traditional methods for cleaning and analyzing these kind of data are not as helpful. On the other hand, spreadsheets are considered structured data since they can be quickly scanned for information.

![Unstructured data types](images/06_unconventional/06_data_unconventional_01.png)


Let's focus on images. Only a few decades ago analyzing text data at least in large scale and for an average data scientist was not feasible. Most people back then wouldn't even consider images as data. But there is so much we can get from analyzing image data. Although we will not study images processing techniques in this series, let's look at one example that helps us understand how image data can be used. 

You (hopefully) know by now what Google Maps is and we all may have used Google's Street View feature which allows panoramic views from positions along many streets in the world. It's fun to check it out. One of the things you notice checking most streets in the world or in the US is that not only you can see houses, but on most streets you are able to see cars. Fun facts: all tag numbers is blurred out.

![Google Maps street view](images/06_unconventional/06_data_unconventional_02.png)


Researchers from multiple universities used the piece of information (car models in each neighborhood) to be able to predict demographic mix and voting distributions of each neighborhood in the United States. They used two types of data. First, they used machine learning (you will learn about machine learning in the advance track) techniques to read images and figure out car models in each neighborhood. This was the unstructured part of data. Then they used a second set of data that contained information about what type of people own what types of cars. This was the structured part of data that they obtained from surveys. Comparing these two sets of data, they were able to accurately estimate income, race, education, and voting patterns at the zip code levels.

![Google Maps street view in predicting demographics](images/06_unconventional/06_data_unconventional_03.png)



### Textual data

As we discussed, another form of unstructured data are text data. In fact, most people think of unstructured data as text data. Like images, audio, and video, text data can tell us so many things. Text analytics or text mining is the process of examining large collections of text data to generate more analysis-friendly data. In other words, text mining is the process of converting textual data from unstructured form to structured form for analysis or visualization.

An application of text mining is sentiment analysis. In sentiment is the process of categorizing and quantifying opinions expressed as text. For instance, in a lot of satisfaction surveys, as you may have taken, the company asks you to express your opinion about your experience or a specific product in a few sentences. Traditionally these kind of data would likely to be ignored in any analysis. At best, the text had to be read by human readers who would then subjectively assign a score to for instance how positive or negative the text was. However, using sentiment analysis we are now able to read vast amount of textual data and let an algorithm assign a value to the writer's attitude towards the service or the product. There are different dimensions of sentiment analysis. We can evaluate a paragraph of text to see how sad vs. happy, positive vs. negative, scientific vs. unscientific, etc. it is. For more on sentiment analysis read this [this article](https://www.crimsonhexagon.com/blog/what-is-sentiment-analysis/).

![Sentiment analysis](images/06_unconventional/06_data_unconventional_04.png)


Another application of text mining is processing messages, emails, etc. for finding spams. Textual data in this case is evaluated in various dimensions and a score is assigned to it. This score captures the probability that the text is spam given historical data. If the probability is high, the algorithm decides that the text is spam.


### Unstructured data analysis in R

R and similar software that are open source are great tools for analyzing unstructured data since over time hundreds of packages have been developed for analyzing such data. We will learn more of these tools in the advanced data science track. However, it's good to know a few of the popular packages used in analysis of unstructured data. Among them `tidytext` and `tm` are great for text mining and the package `rvest` make web scraping for further text analysis easy. The package `languageR` provides statistical tools for analysis of textual data. The `magick` package can be used for image processing. `seewave` can be used for audio data analysis. The following example is David Robinson's analysis of Trump tweets in R using `tidytext` and `twitteR`.


![Analysis of tweets in R](images/06_unconventional/06_data_unconventional_06.png)


### Slides and Video

![Unconventional Sources of Data](ADD VIDEO LINK)

* [Slides](https://docs.google.com/presentation/d/1r5T8BgmyVkHQMxXuZ8o575D1515v3RSCeciG8uyBghU/edit?usp=sharing)

{quiz, id: quiz_05_unconventional}

### Unconventional Sources of Data quiz

? Which one of the following is NOT an example of unstructured data?
a) Lung x-ray images of smokers
B) Recorded student grades in a school
c) Tweets posted by politicians
d) Traffic videos in Tokyo


### Which of the following packages is specifically designed for analysis of unstructured data?

A) `tm`
b) `googlesheets`
c) `car`
d) `purrr`


{/quiz}