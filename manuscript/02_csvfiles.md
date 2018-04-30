# csv and txt files

Before anything let's see what a csv file is. A csv file or a comma-separated values file allows us to have tabular data in plain text format. Think about storing a set of data that includes information about heights blood types of three individuals. You could make a table that has three columns (names, heights, and blood types) and three rows (one for each person). However, there is also another way of storing this data in plain text without needing to put them in table format. In a csv format, the values of each column for each person in the data are separated by commas and each row (each person in our case) is separated by new lines. So you could have your data in the following text file:

![sample csv](images/02_csvfiles/00_sample_csv.png)

A csv file has a .csv extention at the end. One of the advantages of csv files is their simplicity which is also why they are used as one of the most common forms of data. One of the challenges of data science is that each software rely on specific formats that are incompatible for other sofwatre. However, a csv file can be read by most programs. 

As we saw in previous lesson, csv files can be created and opened in Google Sheets or software such as Microsoft Excel. Since we have already entered the data, we just need to download it as a csv file. Go to the Google Sheets you created and click on File and then Dowonload as and choose Comma-separated values. The data set that you created will be downloaded as a csv file on your Chromebook. Make sure you know the location of your file.

### Importing csv files into R



### Disadvantages of csv files

Remember the basic idea behind comma-separated documents is that fields (columns) values for each row are separated by commas. But what if the value has commas in it? Or what if the value itself includes a line break? A simple csv standard may not be able to handle such values. In such cases other csv formats are used. For instance the value might be sorrounded by quotations. In some other cases, quotations may not be the answer either and we could use escape characters, semicolons, or TABS. This is why csv does not follow a single standard and csv formats can vary in the choice of separator character.

Another caveats of csv files is that thee are best used for data records that have identical list of fields. An example would be to have more fileds such as eye color and weight for the second row but not for the other rows. We will learn about hierarchical data later that are impossible to represent in csv format. csv is therefore is not really appropriate for documents such as those created with HTML, XML, or other markup or word-processing technologies.

### Text files



# Text Data Files







Because of their simplicity, text files are commonly used for storage of information. They avoid some of the problems encountered with other file formats, such as endianness, padding bytes, or differences in the number of bytes in a machine word. Further, when data corruption occurs in a text file, it is often easier to recover and continue processing the remaining contents. A disadvantage of text files is that they usually have a low entropy, meaning that the information occupies more storage than is strictly necessary.




Text data files, it must be admitted, are not always as compact or as efficient to read and write as binary files. It can be a bit more work to set up the code which reads and writes them. But they have some powerful advantages: any time you need to, you can look at them using ordinary text editors and other tools. If program A is writing a data file which program B is supposed to be able to read but cannot, you can immediately look at the file to see if it's in the correct format and so determine whether it's program A's or B's fault. If program A has not been written yet, you can easily create a data file by hand to test program B with. Text files are automatically portable between machines, even those where integers and other data types are of different sizes or are laid out differently in memory. Because they're not expected to have the rigid formats of binary files, it tends to be more natural to arrange text files so that as the data file format changes slightly, newer (or older) versions of the software can read older (or newer) versions of the data file. Text data files are the focus of this chapter; they're what I use all the time, and they're what I recommend you use unless you have compelling reasons not to.

When we're using text data files, we acknowledge that the internal and external representations of our data are quite different. For example, a value of type int will usually be represented internally as a 2- or 4-byte (16- or 32-bit) piece of memory. Externally, though, that integer will be represented as a string of characters representing its decimal or hexadecimal value. Converting back and forth between the internal and external representations is easy enough. To go from the internal representation to the external, we'll almost always use printf or fprintf; for example, to convert an int we might use %d or %x format. To convert from the external representation back to the internal, we could use scanf or fscanf, or read the characters in some other way and then use functions like atoi, strtol, or sscanf.

We have a great many options when it comes to performing this mapping, that is, when converting between the internal and external representations. Our choice may be determined by the layout we want the data file to have, or by what's easiest to implement, or by some combination of these factors. Some of the choices are pretty arbitrary; but in any case, what matters most is obviously that the reading and writing code ``match'', that is, that the data file writing code write the data in the right format such that the data file reading code can accurately read it. For the rest of this section, we'll explore several ways of writing and reading data to and from text data files, using various combinations of the stdio functions (and perhaps one or two of our own).









<!---
Try to think about a way to 
Fields with embedded commas or double-quote characters must be quoted.
1997,Ford,E350,"Super, luxurious truck"

Each of the embedded double-quote characters must be represented by a pair of double-quote characters.
1997,Ford,E350,"Super, ""luxurious"" truck"

Fields with embedded line breaks must be quoted (however, many csv implementations do not support embedded line breaks).
1997,Ford,E350,"Go get one now
they are going fast"
--->


### Slides and Video

![What is data](UPDATE LINK)

* [Slides](https://docs.google.com/presentation/d/199w7E8ggb0nrf40A7WvVIYmNKJdVbUkcWpgnLBysZzM/edit?usp=sharing)


{quiz, id: quiz_01_csvfiles}

### csv and TXT files quiz




{/quiz}








