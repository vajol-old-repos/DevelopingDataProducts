---
title       : Motor Trend data analysis application
subtitle    : Shiny project for "Developing Data Products" course at Coursera
author      : Vajo Lukic
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone    # {selfcontained, draft}
knit        : slidify::knit2slides
---

## Introduction

The inspiration for this simple "Shiny" application ([Motor Trend Shiny app](http://vajol.shinyapps.io/motor_trend/)) came from one of previous courses - "Regression Models".
During that course, we needed to perform regression model analysis on "Motor Trend" dataset, searching for the 
best model to analyze impact of different variables on fuel consumption (mpg). My final report for this analysis can be found here: [Motor Trend dataset analysis](http://www.rpubs.com/vajol/20885)

The purpose of this application is to illustrate use of linear regression analysis and to make it easier to see
how the choice of predicting variables impacts the model.

---

## "Motor Trend" dataset

The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).


```r
str(mtcars)
```

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

---

## How to use the application?

1. Choose one dependent variable from the list,
2. Choose one or more predictors,
3. Analyze how chosen model fits by examining 'Model Summary' tab,
4. Analyze how chosen model fits by examining 'Residual Plots' tab

Later you can change dependent/predicting variables while examining the model and watch how it changes dynamically.

---

## How is linear regression working?

Linear regression describes relationship between dependent variable and one or more predicting variables.  

Here is one example of a model being created:

```r
data(mtcars)
model1 <- lm(mpg ~ wt + hp + am, data = mtcars)
```

And this is how model's summary is generated:

```r
summary(model1)
```

Finally, this is how plots are created:

```r
plot(model1)
```

Now go and play with the application !

[Motor Trend shiny app](http://vajol.shinyapps.io/motor_trend/)











