# Saving and Exporting data from R

We learned about exporting data in R environment to a csv file in previous lessons. 

You can export data from R to file formats readable by various statistical software such as SPSS, Stata, etc. You can also export your data as an Excel file. This feature is helpful, however, sometimes you like to preserve the data structures such as column data types (numeric, character, or factor). 

![Exporting R Data to Various Formats](images/05_exporting/05_data_exporting_01.png)

For this purpose, it's better if you save your data in R data format. More specifically we'll learn how to save and load rds and RData files. rds and RData files are mainly identical with the difference that rds files can only contain one object whereas RData files can contain multiple objects. These data types are sometimes called R *native* files. Another advantage of these native files is that they are usually faster to load into R. Read [this article](https://www.r-bloggers.com/efficiently-saving-and-sharing-data-in-r/) for an efficiency analysis of various data types. Another difference between the two data formats is that rds files can be assigned to a variable, however, you can't assign RData files. You can only load them to your environment.


![Difference between RData and rds files](images/05_exporting/05_data_exporting_02.png)


We'll learn how to save a single R object, save multiple R objects or save your entire workspace in a specified file. To save a single object to a file, we will use the function `saveRDS()`. By running this function the object will be saved as an `rds` file. Once you save the object into a file, the file can be called (or restored as some people put it) using the `readRDS()` function. Here is how. As a practice, let's create one data frame called `df1` and one list called `list1`. The data frame has three columns and three rows and the list has three elements with different lengths. 

```r
df1 <- data.frame("id" = 1:3, "Age" = c(23, 25, 19), "Name" = c("John","Dora","Natasha"))
df1
list1 <- list(2.5, TRUE, 5:10)
list1
```

### Saving data as .rds

Now we can use the `saveRDS()` command to individually save the data frame and the list into separate files on called `my_data_frame.rds` and the other called `my_list.rds`.

```r
# Save an object to a file
saveRDS(df1, file = "my_data_frame.rds")
saveRDS(list1, file = "my_list.rds")
```

Note that you will now see two files under the section Files with the those names. If you save to files in RStudio rather than RStudio Cloud, you files will be saved locally in your working directory.

![Saved objects](images/05_exporting/05_data_exporting_05.png)

Now, you can share these files with others. Or save them for later. Now we'll practice how to load the saved files back to the environment. As we saw, we can use the function `readRDS()`. Let's say we want to import them into an object with a different name.

```r
# Loading an rds file
loaded_data_frame <- readRDS(file = "my_data_frame.rds")
loaded_list <- readRDS(file = "my_list.rds")
```

After loading the data back, you will notice the two objects in your environment.

![Objects in the environment after loading them](images/05_exporting/05_data_exporting_07.png)

### Saving data as .RData

Did you notice that we saved objects individually. This is because `saveRDS()` can only save one object to one file. However, we can use the function `save()` and save multiple objects to one RData file. Let's save our two objects `df1` and `list1` in one file called `all_objects.RData`. Note that we can no longer use the file type rds since it can only contain one object.

```r
# Saving multiple objects in one file
save(df1, list1, file = "all_objects.RData")
```

This saves the two objects into one file. If you now look at the Files section, you will see the new RData file.

![RData file](images/05_exporting/05_data_exporting_09.png)

Loading an RData into R is done by using the command `load()`. You will just have to specify the name of the file. In our case, since we saved the file as `all_objects.RData`, we simply execute `load("all_objects.RData")`.

One last thing that is a nice feature is that you can save your entire workspace into one file. You don't have to specify each object individually. You can simply look the command `save.image()`. Let's try. After executing the command, under Files you will see the new file that contains all the objects in your workspace.

```r
# Save entire workspace into a file named my_work_space.RData
save.image(file = "my_work_space.RData")
```


### Slides and Video

![Ethics](ADD VIDEO LINK)

* [Slides](https://docs.google.com/presentation/d/1pJ9MeAa_fOM-1ZdjJsoGcAxLS_sd00sLW8DrIJEZMC0/edit?usp=sharing)

{quiz, id: quiz_08_ethics}

### Saving and Exporting data from R quiz

? What is the difference between rds and RData files?
a) Only rds files are native R data files.
B) rds files cannot contain multiple objects but RData files can.
c) rds files cannot be assigned.
d) rds files are usually larger.

? What is the command `readRDS()` used for?
A) loading rds files into R.
b) loading RData files into R.
c) saving an object as an rds file.
d) algebric operations on rds files.


? which one of the following functions can be used to save the entire workspace in one file?
a) `save()`
b) `readRDS()`
c) `saveRDS()`
D) `save.image()`


{/quiz}