# Prediction

**Due 31 January 2025 by noon (12:00 PM) Pacific**

It's time to do some prediction.

Today we're going to predict housing-sales prices using a rich dataset on housing attributes.

**Purpose** We have three main goals with this project.

- We want you to **start thinking about** and **experiencing prediction** scenarios and how they may differ from other settings in econometrics—goals, challenges, data, decisions, *etc*.
- We also thought you could use a **refresher/review of `R`**.
- We would like to introduce you to **[Kaggle](https://kaggle.com)**.

## Help!

I put together a very [simple example of a Kaggle notebook](https://www.kaggle.com/edwardarubin/project-000-example).

Connor Lennon has a [helpful guide to Kaggle competitions](https://rpubs.com/Clennon/KagNotes). *Note:* Some of it uses stuff we haven't seen in our course **yet**.

## Steps

1. Read about [the competition](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/)
2. Open a notebook on Kaggle (or an `R` script, `.rmd`, or `.qmd` file if you're working on your own computer). I recommend you try a Kaggle notebook because we will be using them throughout the quarter. But it's your choice.
   - If you're working with a notebook on Kaggle: Sign in, start a new notebook (use the *Notebooks* tab in the competition), and make sure the folder `house-price-advanced-regression-techniques` shows up in your `input` folder. You access the `input` directory using `"../input"`.
   - If you want to work on your own computer: [Download the data](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data) (Search the page for "Download All").
3. Load `train.csv` dataset into R. This dataset is what you will use to *train* your model.
   - If you're `R`usty, recall that the `tidyverse` links together a bunch of very helpful packages (and thus, their functions). For example, `tidyverse` includes `readr`'s `read_csv()` function and `dplyr`'s functions for manipulating data (`select()`, `mutate()`, `filter()`, *etc.*).
   - Get a feel for the data—graphs, summaries, etc.
   - Don't forget `View()`—sometimes it is nice just to see your data.
   - The `skim()` function from the similarly named `skimr` package can be really helpful for summarizing a dataset.
   - The `datasummary_skim()` function from the `modelsummary` package is also nice.
   - The competition's [website describes variables](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data)—as does the file `data_description.txt`.
   - **Don't forget:** Commments (`# This is a comment`) in your code are important. They help you remember what you did and why you did it. They also help others understand your code. Use them!

## Get to work

4. Estimate several (at least three) predictive models of `SalePrice` using the training data.
   - You're in charge here, do whatever you think will achieve the goal of **good out-of-sample predictions**—interactions, polynomials, lots of variables, *etc.*
   - **Important:** You will need a way to "deal with" missing values (`NA`s)—*and* you will need to apply this strategy in both the training and in the testing datasets.
   - *Another hint:* You probably don't want to use `Id` when fitting your model.
   - *Note:* Some of the variables' names may make `R` angRy. For example, `R` doesn't like when a variable name starts with a number (e.g., `1stFlrSF`). 
      - The `clean_names()` function from the `janitor` package can help. Just make sure the output in the file you eventually submit to Kaggle is called `SalePrice`. 
      - Using `clean_names(your_data, case = 'big_camel')` would do the trick.
5. Use your trained model(s) to predict `SalePrice` in the test data.
   - *Hint:* The `predict()` function seems like a good candidate.
   - *Another hint:* The `predict()` function has a helpful argument called `newdata` that allows you to make predictions onto new data—observations your trained/fitted model has yet to see.
6. [Submit your predictions to the competition on Kaggle](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/submit).
   - *Note:* Your submission should be a CSV with only an `Id` column and a `SalePrice` column that has your predicted sale price.
   - *Hint:* You can see an example submission file (1) on Kaggle and (2) in the files you downloaded to get the training and testing data.

## To turn in

7. How did you do? Report your (1) TeamName, (2) Rank (#), and (3) Score.
8. How did you choose your variables? How might this process be improved (and formalized)? Imagine you eventually need to automate your process; how could you make things more efficient?
9. What do you think could improve your predictions? Think about the decisions you made for (i) data-cleaning and (ii) modeling—messy/complex variables, modeling assumptions, *etc.*
10. How does your training performance compare to the test performance?
      - *Hint 1:* "Test performance" is Kaggle's score when you submit. You need to calculate your training performance.
      - *Hint 2:* [Kaggle is using root mean squared error](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/overview/evaluation) of the logged prices.
11. Does your answer to `10.` suggest that you are overfitting? Explain.
12. You predicted the price (in dollars). Kaggle evaluated your predictions using the log of the price. Do you think predicting the log of the price would have been improved your models' performances? Why or why not?
13. *Bigger picture:* How does prediction differ from the topics you've typically focused on in econometrics (_e.g._, estimating treatment effects)?

Submit (electronically on Canvas) a short write up with answers to questions 7–13 (above). For this assignment, you do not need to submit your code.
