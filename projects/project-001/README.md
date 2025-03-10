# Prediction

**Due Thursday 13 February 2025 by 11:59 PM (Pacific)**

With your fancy new ML tools, we are going to return to the problem of predicting housing-sales prices that you saw in the [first problem set](projects/project-000).

## Getting started

0. Refresh your knowledge about [the competition](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/) Open a notebook (or maybe an `R` script, `.rmd`, or `.qmd` if you're working on your own computer).
1. Load `train.csv` and `test.csv` datasets into R. Remember that the competition's [website describes variables](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data).

## DIY cross validation

2. In the **training** dataset, randomly assign each of the observations to one of five groups (cleverly named `1`, `2`, `3`, `4`, and `5`). (These groups will be your folds.) *Hint:* You can use the `sample()` function.
3. Choose your two best models from last time. If you don't like your old ones, it's find to come up with new ones.
4. Estimate each of these two models using the observations from folds `2` through `5`. To be clear: You should now have two estimated models—each estimated on ~80% of the data in the training dataset.
5. Now for each of the models, predict the prices for observations in fold `1`. Calculate the root mean squared error (RMSE) for each of the two models.
6. Copy your work from 2–5 and repeat it four more times, holding out a different fold each time. Ideally you should use a `for()` loop or function like `lapply()` or `map()` (rather than copying and pasting four times).
7. Calculate (1) the average RMSE and (2) the standard deviation of the RMSE across the five folds for each of your two models.
8. Use your calculations in 7 to compare the two models. Is one model demonstrably better than the other? Explain.

## Reflection

9. How does 5-fold cross validation compare to the validation-set approach? 
10. Why do we generally prefer cross validation to the validation-set approach?
11. Does the structure of our data or the goal of our prediction problem suggest that we should use a different approach to cross-validation? Briefly explain your answer.

