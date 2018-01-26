# Text Data Files







Because of their simplicity, text files are commonly used for storage of information. They avoid some of the problems encountered with other file formats, such as endianness, padding bytes, or differences in the number of bytes in a machine word. Further, when data corruption occurs in a text file, it is often easier to recover and continue processing the remaining contents. A disadvantage of text files is that they usually have a low entropy, meaning that the information occupies more storage than is strictly necessary.




Text data files, it must be admitted, are not always as compact or as efficient to read and write as binary files. It can be a bit more work to set up the code which reads and writes them. But they have some powerful advantages: any time you need to, you can look at them using ordinary text editors and other tools. If program A is writing a data file which program B is supposed to be able to read but cannot, you can immediately look at the file to see if it's in the correct format and so determine whether it's program A's or B's fault. If program A has not been written yet, you can easily create a data file by hand to test program B with. Text files are automatically portable between machines, even those where integers and other data types are of different sizes or are laid out differently in memory. Because they're not expected to have the rigid formats of binary files, it tends to be more natural to arrange text files so that as the data file format changes slightly, newer (or older) versions of the software can read older (or newer) versions of the data file. Text data files are the focus of this chapter; they're what I use all the time, and they're what I recommend you use unless you have compelling reasons not to.

When we're using text data files, we acknowledge that the internal and external representations of our data are quite different. For example, a value of type int will usually be represented internally as a 2- or 4-byte (16- or 32-bit) piece of memory. Externally, though, that integer will be represented as a string of characters representing its decimal or hexadecimal value. Converting back and forth between the internal and external representations is easy enough. To go from the internal representation to the external, we'll almost always use printf or fprintf; for example, to convert an int we might use %d or %x format. To convert from the external representation back to the internal, we could use scanf or fscanf, or read the characters in some other way and then use functions like atoi, strtol, or sscanf.

We have a great many options when it comes to performing this mapping, that is, when converting between the internal and external representations. Our choice may be determined by the layout we want the data file to have, or by what's easiest to implement, or by some combination of these factors. Some of the choices are pretty arbitrary; but in any case, what matters most is obviously that the reading and writing code ``match'', that is, that the data file writing code write the data in the right format such that the data file reading code can accurately read it. For the rest of this section, we'll explore several ways of writing and reading data to and from text data files, using various combinations of the stdio functions (and perhaps one or two of our own).

