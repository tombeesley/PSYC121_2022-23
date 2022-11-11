---
author: "John Towse, Tom Beesley"
date: "2022-11-11"
output:
  html_document: default
  pdf_document: default
---

# Week 6: Sampling, probability and binomial tests

> Written by Tom Beesley & John Towse

## Pre-lab work

-   Ensure you have watched the lecture for Week 6.

-   There  is a learnr tutorial to complete which will help you to think about **binomial tests**. You : [You can find it here](https://ma-rconnect.lancs.ac.uk/PSYC121_2022_W6_prep/){target="_blank"}.

-   If you create a folder and upload the file into RStudio before the lab class you'll be even more ready to follow along!

## Card sampling task

![](files/Week_6/cards.jpg)

In the first task this week we will look at the sampling of events and we will apply the basic statistical test of the binomial test: `binom.test()`

Each table has a set of cards. These will be 13 red cards and 13 black cards - please check your set to ensure you have the right number of each colour (it doesn't matter what suit the cards are).

In this task we will be drawing samples from the deck, and trying to tell whether the deck is biased towards red or black. Think of the cards as the population of scores out there in world, and when you can only see back of the cards, that data is unobserved. 

As an experimenter we are trying to estimate what is true about the world, and in order to do this we need to draw a sample. So each time you draw a card, you are observing one data point from the population, and based on a collection of data (the sample) you are going to draw an inference about what is true about the population.

### Set up and instructions:

1. One person on each table should act as the “world” (the dealer). Congratulations, you are God. That is, this person will determine what is true about the state of things in the world. In this example, that means they control what is contained in the deck of cards. For each experiment, secretly remove some cards from the deck and place those face down. It’s important that no one sees what these cards are. For example, you might take out 5 red cards, so that 13 black and 8 red are left; this deck is now biased to black. Or you might take out 3 red and 3 black; this deck is not biased.

2. The remaining people (1 or more) will act as the experimenters. Your job is to draw samples and work out whether you think the deck is biased or not towards either red or black. 

For each experiment, go through the following steps:

2.1 The world removes some cards from the full deck (the number and colour of the cards removed is up to them) and they place these face down on the table. They shuffle the deck ready to start the "experiment".

2.2 The experimenters "pre-register" their sample size. That is, they state how many cards they are going to draw.

2.3 Draw samples one at a time. Importantly - make sure you replace the cards each time and the world/dealer should give the pack a quick shuffle. 

2.4 Mark down whether the card was red or black in [your logbook](files/Week_6/Week_6_card_logbook.docx)

2.5 The world should shuffle the cards after each draw. Repeat 2.3 and 2.4 until you have reached your sample size.

2.6 At the end of each experiment, the experimenters should draw a conclusion based initially on their own "gut feeling" about the data. Do you think the deck was biased towards red, black, or was it unbiased?

2.7 As a group, run a `binom.test()` to provide a statistical result. Was this result unusual? How likely were the data given the null hypothesis? Note down the p value that this test gives you.

2.8 The "world" can then reveal the hidden cards. Was the deck actually biased or not? How does this sit with a) your initial conclusions, and b) the result of the binomial test?

3. Repeat steps 2.1-2.8 again for a new experiment, making sure that you try different parameters for the experiment. So vary a) how many cards are removed from the deck, b) the combination of cards removed from the deck, and c) the pre-registered sample size. Feel free to swap the roles around.

4. Once you've conducted a few experiments, discuss...



