# Data Privacy

In the previous lesson, we covered good practices when connecting to WiFi and working on the Internet. We noted that data are safer when they're encrypted, but we didn't go into much more detail than that. In this lesson we'll cover what data privacy is, why it's important,
and discuss encryption in slightly more detail.

Again, remember that there are people who dedicate their entire careers to data privacy. This lesson simply touches on the basics. Feel free to search on the Internet to learn even more about Data Privacy!

### What is Data Privacy?

Data privacy is:

{cite: "Wikipedia", url: "https://en.wikipedia.org/wiki/Information_privacy"}
> the "relationship between the collection and dissemination of data, technology, the public expectation of privacy, and the legal and political issues surrounding them."

This complex definition correctly suggests that data privacy is not a simple matter. A simpler definition of data privacy would maybe be **how to keep personal and private information safe**.

Concerns arise with data privacy whenever there is personally identifiable information (PII) or sensitive information that is being collected, stored, used, (and eventually destroyed and deleted). When handled appropriately, only people who should have access to the information do. When mishandled, this information could be accessed by others who should not have that information.

Data are everywhere, so it's incredibly important to think about data privacy early on in every single data science project. It's much better to be **too vigilant** than to make a mistake, allow data to fall into the wrong hands, and have to try to clean up the mess, as you'll see in a few examples below. So, think of data privacy concerns early and often to avoid making a mistake.

### Personally Identifiable Information

In the US, [Personally Identifiable Information](https://en.wikipedia.org/wiki/Personally_identifiable_information), often simply referred to by the terms initials, PII, is any "information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual. This could be a first and last name, a picture of someone's face, a driver's license number, a date of birth, an address, an individual's genetic code, or a telephone number, among many other pieces of information. All of these pieces of information could help identify a person. It's these type of data that *must* be handled extremely carefully.

When you sign up for an app on your computer or phone, you likely provide that company with some PII. You often give them your name and your address (among other information). You likely assume that this company will handle your data appropriately, and, if everyone is following the rules, they will. This means they won't share it with others, use it for purposes other than those for which you've given them permission, or allow others companies/people to steal your information. However, as reported regularly in the news, companies do *not* always handle your data as they should. We'll discuss what concerns *you* should have as you're working with other people's data and how data *should* be handled.

### What is encryption?

To review from the last lesson, when data are [encrypted](https://en.wikipedia.org/wiki/Encryption), all the information is jumbled into a code that can only be decoded by someone who has the key. This means that if data are intercepted while being transferred, the person who has intercepted the data will not be able to understand the data, as they won't have access to the key and will only have the completely jumbled information. It is a security measure to help keep data safe.

#### Working in RStudio Cloud

In earlier lessons, you've been working in RStudio Cloud and will continue to do so as your hone your data science skills. Data on RStudio Cloud are encrypted at rest (when they're sitting in your project) and in transit (when they're being uploaded or downloaded). This means that, if intercepted, the person who has intercepted the data will not be able to decipher the information contained, as they don't have the key.

However, if you download data from RStudio Cloud and store them directly on your computer, they are no longer encrypted. If you have PII in a dataset that is stored on your laptop directly, that information is not protected. So, be careful working with datasets that contain PII that have been downloaded to your computer.

#### HTTPS

An additional reminder: websites that have https:// (rather than just http://) also use encryption for data transfer, increasing security for data that are transferred. When working with PII and transferring data, be sure that the websites you're working with are using HTTPS.

### Human Security

[Human security](https://en.wikipedia.org/wiki/Human_security) is the concept that individual people (rather than just countries) should be kept safe and secure. With regards to data science, this means that when working on the Internet, regulations and laws should be made not just to protect the security of a nation, but rather to **protect every individual and their data**.

Data Science projects should NOT:
* increase risk or harm
* pose threats to individuals
* make individuals' PII publicly-available or susceptible to theft
* break any laws
* share data with other groups/companies without the consent of the individuals
* saved data insecurely

### Computer Security

Computer Security (or cybersecurity) is

{cite: "Wikipedia", url: "https://en.wikipedia.org/wiki/Computer_security"}
> "the protection of computer systems from the theft and damage to their hardware, software or information, as well as from disruption or misdirection of the services they provide."

This means that, in addition to keeping individuals' data safe (maximizing human security), data science projects must *also* consider how to ensure that the computers and software they use and create are designed in a secure manner. For data science projects, this means that data being transferred over the Internet should be done so safely (using encryption) and that software you develop or use should not post PII or other sensitive to the Internet.

### Open Science

There is an important movement in science currently where individuals promote what is known as open science. Practitioners of open science support making their scientific studies as transparent as possible. Specifically, they provide all the data, programming code, and software necessary to repeat their analyses. Open science is great for the scientific community and public, as everyone has access to the tools and data used. However, it is not without its privacy risk.
Open Science practitioners are still responsible for protecting PII. This means that individual-level information (names, dates of birth, addresses, etc.) must all be removed from one's dataset before it is released to the public. Being a supporter and practitioner of open science is great, but you must always ensure that when you're releasing and sharing data, you are not inadvertently putting others at risk.

#### Open Data

Open data are data that are freely-available to anyone. Local and federal governments as well as many scientists make their data freely-available to the public. Open data are wonderful in that anyone can work with them. Sharing data is a great thing! But, sharing must be done with the caveats already mentioned. Individual-level information (PII) should be removed from datasets prior to release. Individuals should *not* be identifiable from data freely-available on the Internet.

#### Open-source Software

Like open data, open-source software are software that are designed to be freely-available to anyone. This means that the software code is all available, so others can not only download and use the software for free, *but also* can download the code and modify it for their own purposes. The R programming language is itself an open-source project and all packages made for R are also open-source. This means that programming in R will always be free, and the code will always be publicly-available.

### Data Breaches

To understand data privacy, it's good to know definitions and best practices, but it's also important to learn from past mistakes. Companies have not always handled data securely. Here, we'll discuss a few famous data breaches and touch on what went wrong so these errors can be avoided in the future.

#### Facebook

In March of 2018, The [New York Times](https://www.nytimes.com/2018/03/17/us/politics/cambridge-analytica-trump-campaign.html) and [The Guardian](https://www.theguardian.com/news/2018/mar/17/cambridge-analytica-facebook-influence-us-election) both broke stories about how data from at least 50 million Facebook profiles were used by a company called Cambridge Analytica to build profiles of individual US voters, allowing individuals be to targeted with personalized political advertisements.

While the details are provided in the links provided above, briefly here, the data were mined from individuals who had consented for their data to be used for academic purposes. *However*, Cambridge Analytica was collecting these data for non-academic purposes  *and* collecting data from friends of these individuals who had consented to have their data collected but who had not consented to have their data used.

This **data breach** at Facebook demonstrated that Facebook did not have sufficient protocols in place to protect user data. As a result, Mark Zuckerberg, Facebook's CEO, has [had to testify before Congress](https://www.nytimes.com/2018/04/10/us/politics/mark-zuckerberg-testimony.html) and the company has [promised to make changes to improve data security](https://www.independent.co.uk/life-style/gadgets-and-tech/news/mark-zuckerberg-facebook-2018-resolution-fix-post-update-latest-challenge-personal-a8142181.html).

#### Equifax

In the Fall of 2017 Equifax, a credit-reporting agency, [disclosed that partial driver's license information was stolen from 2.4 million US consumers](https://www.equifaxsecurity2017.com/). This hack was traced back to a ["preventable software flaw"](http://www.businessinsider.com/how-did-equifax-get-hacked-2017-9). In other words, in March of 2017, Equifax identified a weakness in a piece of software they were using. However, they did not move to fix that weakness quickly. Partial drivers licenses were stolen from May until June of 2017. Thus, Equifax knew about the problem before any data were actually breached. The entire breach could have been avoided. Prioritizing security and moving to fix problems immediately upon realizing an issue is critically important.

#### Ashley Madison

In July of 2015, Ashley Madison, a website that helps people cheat on their spouses, [was hacked](http://fortune.com/2015/08/26/ashley-madison-hack/) and personal information, including e-mail addresses, from 32 million site member's were stolen and published. The windfall rippled through society, leading to [resignations, divorces and suicides](https://www.theguardian.com/technology/2016/feb/28/what-happened-after-ashley-madison-was-hacked). The "Impact Team," the group of hackers responsible for this hack, publicly stated that part of the reason they decided to release the data was because Ashley Madison had been charging users a $19 fee to completely erase their profile information, but that Ashley Madison had failed to actually scrub these data from their records. The security lesson here is that there should always be a mechanism by which users can remove themselves from a dataset. In the European Union, the General Data Protection Regulation (GDPR) has stated that, by law, companies must have this feature built-in. Users should always be able to remove themselves from a dataset.

#### OKCupid

In May of 2016, researchers [scraped profiles](https://motherboard.vice.com/en_us/article/8q88nx/70000-okcupid-users-just-had-their-data-published) [from 70,000 users on OKCupid](https://www.vox.com/2016/5/12/11666116/70000-okcupid-users-data-release), an online dating site, and made them completely open to the public. These researchers did not (1) have permission from OKCupid, (2) obtain informed consent from the users, nor did they (3) remove PII from the data prior to release. Since their original release on [The Open Science Framework](https://osf.io/), given the issues with the dataset just mentioned and the fact that the collection of the data did not follow OKCupid's Terms of Service, the dataset was taken down. However, [hundreds of people had already downloaded the data](https://www.vox.com/2016/5/12/11666116/70000-okcupid-users-data-release) at that point.

In this case, a set of researchers did not comply with the Terms of Service they agreed to by signing up for OKCupid. While it was likely not illegal to obtain the data, as OKCupid made the data sort-of-public, it was certainly unethical, as the researchers did not take individual data security practices into consideration. So, even when you're not necessarily doing something *illegal*, you can still do something unethical that does not follow good data privacy practices.

#### Strava

A similar example of using data legally but with unintended negative consequences occurred when data from Strava, a popular fitness-tracking app, [gave away the location of secret US army bases](https://www.theguardian.com/world/2018/jan/28/fitness-tracking-app-gives-away-location-of-secret-us-army-bases) throughout the world in late 2017.

Individual users would use the app to track their activity; however, in foreign countries, where Strava-users are almost exclusively foreign military personnel, bases can be identified easily from Strava heatmaps, which show all the activity tracked by its app users, as they are the only individuals contributing to the maps in those areas. The lesson to be learned here is that when releasing data, always consider possible unintended consequences. Think hard about the implications of your data and your analyses. Being vigilant and always considering data privacy and possible unintended consequences of your work are incredibly important.

### Conclusions

Hopefully we've explained a number of considerations to take into account when working with and sharing data. Data are powerful. It's important to use them responsibly.

* Be careful with PII
* Fix security issues immediately
* Keep individuals' data safe
* Don't steal data
* Even if it's legal, it may not be right or ethical
* Consider unintended consequences of your work

### Slides and Video

![Data Privacy](https://www.youtube.com/watch?v=PbnLPkpcJkM)

* [Slides](https://docs.google.com/presentation/d/1kGRtBbbQ6rCkH6OAdPE5-GlQJN0rPwaiE8XQlx-k7uA/edit?usp=sharing)
