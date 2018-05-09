We learned about exporting data in R environment to a csv file in previous lessons. 

You can export data from R to file formats readable by various statistical software such as SPSS, Stata, etc. You can also export your data as an Excel file. This feature is helpful, however, sometimes you like to perserve the data structures such as column data types (numeric, character, or factor). 

For this purpose, it's better if you save your data in R data format. More specifically we'll learn how to save and load rds and RData files. rds and RData files are mainly identical with the difference that rds files can only contain one object whereas RData files can contain multiple objects. These data types are sometimes called R native files. Another advantage of these native files is that they are usually faster to load into R. Another difference between the two data formats is that rds files can be assigned to a variable, however, you can't assign RData files. You can only load them to your environment.

We'll learn how to save a single R object, save multiple R objects or save your entire workspace in a specified file. To save a single object to a file, we will use the functino save R D S. By running this function the object will be saved as an r d s file. Once you save the object into a file, the file can be called (or restored as some people put it) using the read R D S function. Here is how. As a practice, let's create one data frame called d f 1 and one list called list 1. The data frame has three columns and three rows and the list has three elements with different lengths. 

Now we can use the save R D S command to individually save the data frame and the list into separate files on called my data frame dot r d s and the other called my list dot r d s.

Note that you will now see two files under the section Files with the those names. If you save to files in RStudio rather than RStudio Cloud, you files will be saved locally in your working directory.

You can share these files with others. Or save them for later. Now we'll practice how to load the saved files back to the environment. As we saw, we can use the function read R D S. Let's say we want to import them into an object with a different name.

After loading the data back, you will notice the two objects in your environment.

Did you notice that we saved objects individually. This is because save R D S can only save one object to one file. However, we can use the function save and save multiple objects to one RData file. Let's save our two objects d f 1 and list 1 in one file called all objects dot R Data. Note that we can no longer use the file type rds since it can only contain one object.

This saves the two objects into one file. If you now look at the Files section, you will see the new RData file. Loading an RData into R is done by using the command load. You will just have to specify the name of the file. In our case, since we saved the file as all objects dot R Data, we simply execute load all objects dot R Data.

One last thing that is a nice feature is that you can save your entire workspace into one file. You don't have to specify each object individually. You can simply look the command save dot image. Let's try. After executing the command, under Files you will see the new file that contains all the objects in your workspace.