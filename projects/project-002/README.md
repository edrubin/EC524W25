# Penalized regression, logistic regression, and classification

We're heading back to the US 2016 election. Your job: predict which party "won" each county (received the most votes for their presidential candidate).

All the data you will need are stored in [`election-2016.csv`](https://raw.githack.com/edrubin/EC524W25/master/projects/project-002/election-2016.csv).

*Sources:* This dataset combines data from 

- [a Kaggle project for the 2016 election](https://www.kaggle.com/benhamner/2016-us-election?select=county_facts.csv)
- [MIT's election data and science lab](https://electionlab.mit.edu/data).

The outcome you are predicting  is `i_republican_2016`. This variable is a simple, binary indicator for whether Republicans won the given county in 2016. 

**Important:** For true **classification** methods (*e.g.*, logistic regression), you will need an outcome variable that is `character` or `factor` (not simply a binary numerical variable). So you'll need to add another column to the dataset or transform the current column.

**Note:** You can work on this project however you like (RStudio, Kaggle, etc.). Just make sure you can submit (on Canvas) a nice document with your answers, R code, and figures. The submission can be a file (*e.g.*, a knitted PDF) or a link (*e.g.*, to a Kaggle notebook or hosted )

**Hint:** Think carefully about whether all the variables should be used as predictors and whether interactions or polynomial expansions might help.

In addition to the state name (`state`), the county name (`county`), and the county FIPS code (`fips`), you have 29 inputs (predictor variables) to use in your prediction model (plus any transformation of these variables). You should have 3,116 counties.

I've tried to name the variables with fairly intuitive names, *e.g.*,

- `n_votes_republican_2012` contains the number of votes that theRepublican presidential candidate received in the general election of 2012
- `pop` is the county's population (estimated for 2014)
- `pop_pct_black` is the percent of the county's population that is Black
- `persons_per_hh` is the number of persons per household in the county

The [table](https://github.com/edrubin/EC524W22/tree/master/projects/project-001#variable-descriptions) at the bottom of this file briefly describes each variable in the dataset. 

## Part 0: Getting started

**00\.** Load the dataset. Get to know your data. (For example, try out `skim()` from `skimr`.) Does anything pop out to you? Create a few aesthetically pleasing and informative figures (labeled, titled, etc.). Any new insights?

## Part 1: Penalized regression

**01\.** Using 5-fold cross validation: Tune a Lasso regression model. Don't forget: You can add interactions, transformations, etc. in your `recipe`; Lasso only can select from the variables (including transformations) that you give it—you're in charge of the "feature engineering". You'll also want to standardize your variables.

**02\.** What is the penalty for your 'best' model?

**03\.** Which metric did you use to define the 'best' model? Does it make sense in this setting? Explain your answer.

**04\.** Now tune an elasticnet prediction model.

**05\.** What do the chosen hyperparameters for the elasticnet tell you about the Ridge vs. Lasso tradeoff in this setting?

## Part 2: Logistic regression

**06\.** Now fit a logistic regression (`logistic_reg()` in `tidymodels`) model—using 5-fold cross validation to get a sense of your model's performance (record the following metrics: accuracy, precision, specificity, sensitivity, ROC AUC).

*Hint:* You can tell `tune_grid()` or `fit_resamples()` which metrics to collect via the `metrics` argument. You'll want to give the argument a [`metric_set()`](https://yardstick.tidymodels.org/reference/metric_set.html).

**07\.** What is the cross-validated *accuracy* of this logistic model? 

**08\.** Is your accuracy "good"? Explain your answer—including a comparison to the null classifier.

**09\.** What do the other metrics tell you about your model? Is it "good"? Are you consistently missing one class of outcomes? Explain.

## Part 3: Logistic Lasso

**10\.** Now fit a logistic Lasso regression (`logistic_reg()` in `tidymodels`, but now tuning the penalty) model—using 5-fold cross validation. Again: record the following metrics: accuracy, precision, specificity, sensitivity, ROC AUC.

**11\.** How does the performance of this logistic Lasso compare to the logistic regression in Part 2?

**12\.** Do you think moving to a logistic elasticnet would improve anything? Explain.

## Part 4: Reflection

**13\.** Why might we prefer Lasso to elasticnet (or vice versa)?

**14\.** What are the the differences between logistic regression and linear regression? What are the similarities?

**15\.** Imagine you worked for a specific political party. In this setting do you care about accuracy, precision, sensitivity, or something else? Explain.

**16\.** Do you think that your estimated test accuracy will apply to the 2020 or 2024 (or future) presidential elections? Why or why not?

**17\.** Does the standard "random sampling" approach to cross validation make sense with these data? If not: What approach could make more sense?

**18\.** Using *math* (not code): Derive what *R-squared* tells us when the outcome is binary and the prediction is also binary.

**19\.** Similarly, derive what *R-squared* tells us when the outcome is binary and the prediction is a probability.

**20\.** What is the most interesting concept you've learned in this class? Why do you find it interesting/important?

## Variable descriptions

For more information on the county demographic variables, see [the source documentation](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ).

| Variable name | Description | Type |
|:----|:----|:---:|
| `fips`                   | FIPS code (unique for a county)                             | `int` |
| `county`                 | County name                                                 | `chr` |
| `state`                  | State name                                                  | `chr` |
| `i_republican_2016`      | Repub. presidential candidate won county in 2016            | `int` |
| `n_votes_republican_2012`| Number of votes for Repub. presid. candidate in 2012        | `int` |
| `n_votes_democrat_2012`  | Number of votes for Democ. presid. candidate in 2012        | `int` |
| `n_votes_other_2012`     | Number of votes for other parties' candidates in 2012       | `int` |
| `n_votes_total_2012`     | Number of votes in presidential election in 2012            | `int` |
| `i_republican_2012`      | Repub. presidential candidate won county in 2012            | `int` |
| `pop`                    | County population                                           | `int` |
| `pop_pct_change`         | County percent population change 2010-2014                  | `num` |
| `pop_pct_below18`        | County percent population below 18 years of age             | `num` |
| `pop_pct_above65`        | County percent population above 65 years of age             | `num` |
| `pop_pct_female`         | County percent population female                            | `num` |
| `pop_pct_asian`          | County percent population Asian                             | `num` |
| `pop_pct_black`          | County percent population Black                             | `num` |
| `pop_pct_native`         | County percent population Am. Indian/Al. Native             | `num` |
| `pop_pct_pacific`        | County percent population Native Haw./Other Pac. Islander   | `num` |
| `pop_pct_white`          | County percent population White                             | `num` |
| `pop_pct_multiracial`    | County percent population multi-racial                      | `num` |
| `pop_pct_hispanic`       | County percent population Hispanic                          | `num` |
| `pop_pct_foreign`        | County percent population born outside US                   | `num` |
| `pop_pct_nonenglish`     | County percent population that speaks non-English lang.     | `num` |
| `pop_pct_bachelors`      | County percent population with Bachelors degree             | `num` |
| `pop_pct_veteran`        | County percent population who are veterans                  | `num` |
| `pop_pct_homeowner`      | County percent population homeowners                        | `num` |
| `pop_pct_poverty`        | County percent population below the poverty line            | `num` |
| `home_median_value`      | County median value of owner-occupied housing units         | `num` |
| `persons_per_hh`         | County average persons per household                        | `num` |
| `income_pc`              | County per capita income                                    | `int` |
| `income_median_hh`       | County median household income                              | `int` |
| `n_firms`                | County number of firms                                      | `int` |
| `land_area_mi2`          | County land area (square miles)                             | `num` |
