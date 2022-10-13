# Analysis of wildfire-specific PM2.5 in California from 2006 to 2020

This repository contains data and findings that support a MuckRock and California Newsroom article on the increasing impact of wildfire smoke on Californian's health.

# Data 

The data used in this analysis comes from the paper *[Daily Local-Level Estimates of Ambient Wildfire Smoke PM2.5 for the Contiguous US](https://pubs.acs.org/doi/10.1021/acs.est.2c02934)* by Childs et. al, which has [its own GitHub repository of scripts and data](https://github.com/echolab-stanford/daily-10km-smokePM).

To bring Childs' study down to the county-level for the state of California, we used three subsets of the original study's data. 

- `[ca_county_grid](data/processed/childs_county_level_results)`
- annual_county_smokePM.csv
- ca_extreme_days_pop_estimates.csv

https://github.com/echolab-stanford/daily-10km-smokePM

 The first data set is the base data of her group’s paper, the second weights that data by population and subsets by county, the third does the same as the second but only for areas that experienced at least one day of 100 micrograms of wildfire-specific PM2.5.


# Methodology 


# Questions / Feedback
