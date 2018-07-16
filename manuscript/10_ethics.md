# Ethical Data Science

From the emails automatically marked as spam in your Inpox and facial recognition on Facebook to the targeted advertisements you see whenever you're online, data science has made its way into our everyday lives. Often, this is a positive because data scientists generally set out to improve the world (say, by analyzing crime data in hopes of reducing violent crime) or to make our lives easier (by preventing spams in our mailboxes, for example). However, data science projects are certainly not without negative consequences. We discussed some of the companies who have run up against issues properly securing user data in the last lesson; however, protecting the privacy of users' data is not the only time data scientists should consider the ethics of their work. In fact, **ethical considerations should be made from the start of a project and should never stop being made**. We'll discuss what we mean by that in this lesson.

When we talk about the ethics of data science, we're talking about how to use data to improve the lives of individuals in our society in the world without causing harm to any groups with our work. We're talking about putting in the work ahead of time to avoid unintended negative consequences of our work. Rather than acting surprised when groups are inadvertently harmed or only dealing with unintended consequences after they occur and harm others, an ethical data scientist will consider whether they are doing any harm at each step along the way. 

### Data Science Team

Data science projects can be done by an individual; however, more often, they are carried out by a team of individuals who are all interested in using data to answer an interesting question. Whether it's one person setting out to answer the question or a team working to answer this question, it's important at this outset of a project to really think about whether all the necessary individuals are on the team.

For example, if a group of data scientists were setting out to reduce crime in a neighborhood, it would be in their best interest to either be very familiar with that neighborhood (say, live there themselves) or to talk to individuals who currently live in that neighborhood to be as informed as possible before they set out to analyze their data. By working with individuals who have more knowledge about the neighborhood than someone who has never been there, the team will be less likely to make incorrect assumptions or leave out critical pieces of information when analyzing the neighborhood's data.

### The Data

After ensuring that the team you've assembled to answer the question is the right team to do so, there are *many* considerations to be made when collecting data. 

#### Sampling Bias

When data are collected, it's difficult to ever get information about an entire population. Thus, when data are conducted, researchers will typically get data from a subset of individuals within the population (a process called sampling) and then *infer* something about the entire population using what they learned from the subset of individuals. They will try to ensure that their subset is a random subset of the population. However, whenever sampling of a population is done, there's a chance for sampling bias. 

Sampling bias occurs whenever the sample of the population collected does not accurately reflect the population as a whole. For example, if the population you're interested in studying is half female and half male, but the subset of people you've sampled is made up of 70% females and 30% males, then your sample is biased. Having a plan to avoid sampling bias is an important first step in the process of data collection. 

Checking the data after the data have been collected to ensure that the sample is not biased is an equally important step. When data are collected by survey for example, they may be sent out to an equal number of males and females; however, maybe more males respond than females. Even though your plan was solid, your responses are biased. This has to be accounted for during the analysis, as your responses do not accurately represent the population as a whole. 

And to be clear, gender is not the only consideration to make when sampling. Samples can be biased by many factors including (but not limited to) race and ethnicity, age, income, and education. Sampling bias should always be avoided both when planning to collect data and after the data are collected.

#### Informed Consent

In addition to collecting data in an unbiased manner, data must be collected ethically. This means that individuals must consent to participating in data collection. **Informed consent** requires that the individual agreeing to share their information knows what data are being collected, has been informed of any possible consequences, and has been provided full knowledge of any risks or benefits of participation. 

If data are collected on individuals and later on a data scientist wants to use those data for a different purpose, they can only do so if the initial consent allowed for the data to be used in this manner. Alternatively, if the data are de-identified, they may be able to be used for future analysis; however, this must be done with care.

#### Privacy

While discussed in a previous lesson, for completion's sake, we'll discuss again here. When collecting personally-identifiable information, these data must be protected. They should not be shared without the participants' consent and they should be stored in a secure manner.

#### Withdrawal of consent

If an individual consents to their data being collected and later changes their mind, they have every right to do so. It is your responsibility as the person collecting the data to have an effective plan for removing any data already collected from that individual.

### The Analysis

After avoiding sampling bias, collecting data ethically, avoiding privacy issues in data storage, there are still a number of ethical considerations to take into account during ones analysis. While we don't discuss the details in these courses, machine learning is currently a popular way to analyze data. In general, it uses existing data to predict how individuals will behave in the future. This means that the any biases in the data used to build the model (the existing data) will likely be perpetuated in the predictions. This means that, for example, in predictive policing, where data scientists are trying to predict where crimes are more likely to happen, if the data used to build the model (often referred to as an **algorithm**) come from crimes that have occurred in primarily black neighborhoods, they are going to predict that crime happens more in primarily black neighborhoods. Then, if police officers are placed in these neighborhoods, they are going to find more crime, *not* because crime has increased, but just because there are more of them in the neighborhood now. Essentially, any biases in the data used initially are going to be perpetuated in the models they generate. This means that it is *critically* important that data scientists fully know and understand the data their working with, its biases, and its limitations.

Further, even *when* something like race is predictive in the model, it's important for a data scientist to consider whether or not that variable *should* be included. Are you *absolutely positive* that race is the important variable and it's not just that you have a biased sample? Instead, if you're trying to predict crimes, it's likely best to use data about crimes that have occurred and where they have occurred in the model rather than race, since race is not a measure of what you're interested in modeling. Considering the implications of ones work when carrying out an analysis is incredibly important, and making decisions that do not unnecessarily harm any group of people is critical

It was previously common for analysts to say that "data do not lie" and "algorithms are impartial," but recent history has shown that that is simply not the case. Data are collected by humans, and humans are not without their biases. The best way to avoid bias in your data is to be aware of this and constantly check to make sure you're not disadvantaging groups of people with your analyses.

Before considering any data analysis and publishing your results, make sure:

1. You have gone through your data and have made sure there is not any major flaw in your data collection. Data can be biased. You can't use the result of a study that is mostly based on data from men to say anything about women.
2. You have checked for common mistakes in your analysis and know that your methodology is valid and defensible. Messing up the data for a single variable can drastically change the result of your analysis.
3. The results of your work can not be used to harass people, especially minorities, in any way.
4. Your analysis is independent of your opinion about the specific problem you're trying to solve using data. When carrying out an analysis, you should be looking for the answer to a question, but be careful not to *want* a specific answer. By wanting the analysis to go a certain way, you can subconsciously analyze the data to get that answer. It's best just to collect the data ethically and analyze it carefully. Then, the answer is whatever the answer from the analysis says it is.

You can do awesome things with your data science skills: cure diseases, analyze health data, prevent climate change, improve your city, or fact check politicians. Don't let your biases or mistakes get in the way.

### After the Algorithm

Finally, after someone answers an awesome data science question with their really great analysis and tell the world, they often think their job is done. However, if you've designed an algorithm that is going to predict something going forward or that is going to continue to be used, it is your job to maintain that algorithm. That means that it's your job to check for biases after the fact. Is your analysis disadvantaging groups of people? If it is, should it be? Does something need to be changed. There *has* to be a way for you to update your algorithm going forward. If something is continuing to be used by others, your job isn't done once you've built the algorithm. It's your job to check for biases after the fact and to update your algorithm should there be a need.


#### Ethical Questions to Answer

To summarize this lesson, be sure to answer all of these questions for every data science project you carry out:

1. Does the **team** on this project include all the necessary individuals to avoid bias in our analysis?
2. Does our data collection plan address ways to **avoid sampling bias**?
2. Are the data we've collected / the data we're using to answer the question of interest **biased**? In what ways?
3. Has **informed consent** been obtained from all participants?
4. Do we have a mechanism do **remove an individual's data** from our dataset if they so choose?
5. Are the variables we've chosen to use for our analysis appropriate? Do they **discriminate** against anyone?
6. Is our analysis **transparent**? Do we understand *how* and *why* we're getting the answer we're getting?
7. Have we considered possible negative or unintended consequences of our analysis and its results?
8. Do we have a way to **update** our analysis/algorithm going forward should biases in the results be found?

### Additional Resources

* [Ethical Checklist for Data Science](https://dssg.uchicago.edu/2015/09/18/an-ethical-checklist-for-data-science/), by Alan Fritzler
* [*Weapons of Math Destruction*](https://www.amazon.com/Weapons-Math-Destruction-Increases-Inequality/dp/0553418815), by Cathy O'Neil
* [*Automating Inequality*](https://www.amazon.com/Automating-Inequality-High-Tech-Profile-Police/dp/1250074312/ref=sr_1_1?s=books&ie=UTF8&qid=1531417315&sr=1-1&keywords=automating+inequality), by Virginia Eubanks

### Slides and Video

![Ethical Data Science](https://www.youtube.com/watch?v=Ol56GULf_qU)

* [Slides](https://docs.google.com/presentation/d/16uo-gTCdjtWjdGOxejVTIz9JdZi-Gu7lgSsNx2SdPhU/edit?usp=sharing)

{quiz, id: quiz_10_ethics}

### Ethical Data Science quiz

? Which of the following is a required step for a more ethical data analysis?

a) Checking to see if the analysis can be used to harass people.
b) Making sure the analysis is objective and not influenced by our opinion.
c) Making sure the methodology used in the analysis is legitimate.
D) all of the above.

{choose-answers:4}
? Which of the following is an example of sampling bias?

C) Your population is comprised of individuals making less than $30,000/year. The median income of your sample is $100,000/year.
o) A population is 50% white, 40% black, and 10% asian. Your sample is 49.9% white, 50.1% black, and 10% asian.
o) A population is 50% female, and 50% male. Your sample is comprised of half females and half males.
o) 20% of a population is over the age of 65. Your sample is 80% individuals less than 65 years old. 
o) A population has a random distribution of favorite colors. Your sample also has a random distribution of respondent's favorite colors.
o) In your population, about 40% people have graduated from college. In your sample, a similar percentage of people have graduated from college.


{choose-answers:4}
? Which statement is NOT true about informed consent?

C) Once informed consent is granted, an individual can not remove it
C) Once an individual is told about how their data will be used, they must consent 
o) It requires an individual grant permission for their data to be collected
o) It requires an individual be told about the possible risks of participation
o) It requires an individual be told about the possible benefits of participation
o) It requires an individual be told about how their data will be used

? When should you consider the ethical implications of your data science project?

a) before you start
b) during data collection
c) during the analysis
d) after the analysis
E) the entire time

{/quiz}
