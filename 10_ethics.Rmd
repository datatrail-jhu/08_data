# Ethical Data Science

From the emails automatically marked as spam in your Inbox and facial recognition on Facebook to the targeted advertisements you see whenever you're online, data science has made its way into our everyday lives. Often, this is a positive because data scientists generally set out to improve the world (say, by analyzing crime data in hopes of reducing violent crime) or to make our lives easier (by preventing spams in our mailboxes, for example). However, data science projects are certainly not without negative consequences. We discussed some of the companies who have run up against issues properly securing user data in the last lesson; however, protecting the privacy of users' data is not the only time data scientists should consider the ethics of their work. In fact, **ethical considerations should be made from the start of a project and should never stop being made**. We'll discuss what we mean by that in this lesson.

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

To summarize this lesson up to this point, be sure to answer all of these questions for every data science project you carry out:

1. Does the **team** on this project include all the necessary individuals to avoid bias in our analysis?
2. Does our data collection plan address ways to **avoid sampling bias**?
2. Are the data we've collected / the data we're using to answer the question of interest **biased**? In what ways?
3. Has **informed consent** been obtained from all participants?
4. Do we have a mechanism do **remove an individual's data** from our dataset if they so choose?
5. Are the variables we've chosen to use for our analysis appropriate? Do they **discriminate** against anyone?
6. Is our analysis **transparent**? Do we understand *how* and *why* we're getting the answer we're getting?
7. Have we considered possible negative or unintended consequences of our analysis and its results?
8. Do we have a way to **update** our analysis/algorithm going forward should biases in the results be found?

### Ethics in Data Science

Now that we've discussed the ethical considerations to be made before and throughout every data science project, we'll discuss a few data science projects that were recently covered the popular media due to the questionable ethics of the project.

We present these examples not only to highlight the ethics of the particular project, but also to state the importance of considering the implications of your work. It is **not** enough to argue that you just "did the analysis" but "didn't think of the implications" of the work. As a data scientist **it is your responsibility to both do the analysis and consider the implications of your work**.

#### Data Science in Sentencing

In April of 2017, Wired reported in an opinion piece that [courts were using artificial intelligence to sentence criminals](https://www.wired.com/2017/04/courts-using-ai-sentence-criminals-must-stop-now/) and made the claim that such practices must be put to an end. The piece explained that courts and corrections departments across the United States collect data on defendants that are then used in an algorithm to determine the "risk" that defendant poses. This aim of this algorithm is to determine how likely it is that the individual will commit another crime.

These likelihoods of reoffending from the algorithm are then used to make decisions about how to set bail, what the sentence should be, and the details of that individual's parole. These tools are often built by private companies. This means that exactly *how* they work and what data are used to assess risk are not disclosed. The article in Wired highlights the use of [Compas](http://www.equivant.com/challenges/supervision-and-compliance-monitoring), one of these risk-assessment tools developed by a private company and used by the Department of Corrections in Wisconsin, in a judge's decision to give a man a long sentence, in part because of his "high risk" score from the algorithm. In a courtroom, however, because the specifics of how this algorithm works are not disclosed, a judge and jury would *not* be able to determine whether or not the likelihood of reoffending was calculated accurately by the algorithm.

Initially, arguments were made that removing human biases and judgment from bail, sentencing, and parole decisions would be for the benefit of society. This initial goal was a noble goal that would improve society. However, over time, biases in the data used to generate these algorithms that perpetuated into [biases in the algorithms' outcomes](https://www.propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing), the lack of transparency in how they work, and failure to check for inequities and biases in the algorithms after they were put in place have led to unfair decisions being made.

While individuals *may* have been looking to improve society with their algorithm at the outset of this project (or at least that argument can be made), lack of considerations of the implications of their work and lack of transparency in the process of generating and using the algorithm have led to questionable ethics in the use of algorithms to make sentencing decisions.

### Artificial Intelligence in the Military

In March of 2018, Gizmodo reported that [Google was helping the US Department of Defense use artificial intelligence to analyze drone footage](https://gizmodo.com/google-is-helping-the-pentagon-build-ai-for-drones-1823464533), a project that started in April of 2017. The project between Google and the Defense department is called Project Maven, and the goal of this project was initially to take drone footage and accurately identify objects (such as vehicles) and to track individuals in the footage collected.

A number of Google employees were upset that Google would provide resources to the military that would be used for surveillance in drone operations. Due to the fact that in other non-military situations [the use of machine learning has led to biased outcomes](https://www.propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing), other employees felt there needed to be further discussion about the ethics in developing and using machine learning technology before it was deployed by the military. In response to these concerns, a Google spokesperson stated that Google is working ["to develop policies and safeguards" ](https://gizmodo.com/google-is-helping-the-pentagon-build-ai-for-drones-1823464533), that the technology is being used for "non-offensive uses only."

In this and many large data science projects where machine learning and artificial intelligence are being used in situations where lives could be negatively impacted, the project would benefit from taking ethical considerations into account and discussing these in a transparent way *before* deploying the technology. Developing policies and safeguards after the fact is not enough.

#### Facial Recognition in Law Enforcement

In May of 2018, the [ACLU reported](https://www.aclunc.org/blog/amazon-teams-law-enforcement-deploy-dangerous-new-face-recognition-technology) that Amazon had teamed up with law enforcement agencies to use Amazon's face recognition technology, [Rekognition](https://aws.amazon.com/rekognition/). The ACLU called this new technology, which can quickly scan images to "identify, track, and analyze people in real time" both "powerful" and "dangerous." This story was picked up by many news sources, including [a piece](https://www.nytimes.com/2018/05/22/technology/amazon-facial-recognition.html) in the New York Times

Proponents of using facial recognition technology in law enforcement cite that such technology can help locate and identify criminals more quickly than we would have been able to in the past and that it will help ["keep residents and visitors...safe"](https://www.nytimes.com/2018/05/22/technology/amazon-facial-recognition.html). Proponents also argue that those who use the technology do so within the limits of the law.

Opponents, like the ACLU, however, cite the civil liberties and civil rights concerns that constant surveillance with using facial recognition technology pose. The ACLU argues that there is substantial "capacity for abuse" and due to this, that citizens should not be watched by the government any time they walk outside, that facial recognition systems threaten freedom, and that the deployment of these technologies post a greater threat to communities that are already unfairly targeted by the political climate.

Concerns with the technology cite that anyone can be identified, not just criminals, a problem for civil liberties. Opponents further question the accuracy of the technology. Inaccuracies, which would misidentify individuals and suggest they were guilty of a crime when they were in fact not is clearly a problem. Further, there are concerns that accuracy varies based on gender and race, which if true, poses a clear bias in the use of this technology for the identification of criminals as certain groups of individuals would be misidentified more frequently than others.

### Additional Resources

* [Ethical Checklist for Data Science](https://dssg.uchicago.edu/2015/09/18/an-ethical-checklist-for-data-science/), by Alan Fritzler
* [*Weapons of Math Destruction*](https://www.amazon.com/Weapons-Math-Destruction-Increases-Inequality/dp/0553418815), by Cathy O'Neil
* [*Automating Inequality*](https://www.amazon.com/Automating-Inequality-High-Tech-Profile-Police/dp/1250074312/ref=sr_1_1?s=books&ie=UTF8&qid=1531417315&sr=1-1&keywords=automating+inequality), by Virginia Eubanks
* [Courts are Using AI to Sentence Criminals. That must Stop Now](https://www.wired.com/2017/04/courts-using-ai-sentence-criminals-must-stop-now/), by Jason Tashea in Wired
* [Machine Bias](https://www.propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing), by Julia Angwin, Jeff Larson, Surya Mattu and Lauren Kirchner at ProPublica
* [Amazon Teams Up With Law Enforcement to Deploy Dangerous New Face Recognition Technology](https://www.aclunc.org/blog/amazon-teams-law-enforcement-deploy-dangerous-new-face-recognition-technology), by Matt Cagle and Nicole A. Ozer with the ACLU
* [Amazon Pushes Facial Recognition to Police. Critics See Surveillance Risk.](https://www.nytimes.com/2018/05/22/technology/amazon-facial-recognition.html), by Nick Wingfield at the New York Times
* [Google Is Helping the Pentagon Build AI for Drones](https://gizmodo.com/google-is-helping-the-pentagon-build-ai-for-drones-1823464533), by Kate Conger and Dell Cameron at Gizmodo

### Slides and Video

![Ethical Data Science](https://www.youtube.com/watch?v=0GAFbE-W2Xs)

* [Slides](https://docs.google.com/presentation/d/16uo-gTCdjtWjdGOxejVTIz9JdZi-Gu7lgSsNx2SdPhU/edit?usp=sharing)
