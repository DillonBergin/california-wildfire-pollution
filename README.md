# Analysis of wildfire-specific PM2.5 in California from 2006 to 2020

This repository contains data and findings for an ongoing MuckRock and California Newsroom collaboration on the increasing impact of wildfire smoke on Californians' health.

# Data 

The data used in this analysis comes from the paper *[Daily Local-Level Estimates of Ambient Wildfire Smoke PM2.5 for the Contiguous US](https://pubs.acs.org/doi/10.1021/acs.est.2c02934)* by Childs et. al, which has [its own GitHub repository of scripts and data](https://github.com/echolab-stanford/daily-10km-smokePM).

To analyze the study's findings at the county-level for the state of California, we used three subsets of the original study's data:

- [ca_county_grid.csv](data/processed/childs_county_level_results/ca_county_grid.csv) - Wildfire-specific PM2.5 estimates at spatial resolution of 10km by 10km 
- [annual_county_smokePM.csv](data/processed/childs_county_level_results/annual_county_smokePM.csv) - Wildfire-specific PM2.5 estimates weighted by the population within each 10km by 10km grid then aggregated up to the county-level, provided by Childs
- [ca_extreme_days_pop_estimates.csv](data/processed/childs_county_level_results/ca_extreme_days_pop_estimates.csv) - Total yearly population in the state that were exposed to at least one day of over 100 micrograms of wildfire-specific PM2.5, provided by Childs


# Methodology 

### Weighting
When mapping the increase of wildfire-specific PM2.5 on the state of California, we chose to weight the values by population to emphasize wildfire smoke's impact where humans can breath it. 

### Extreme Smoke
We defined the amount of Californians exposed to extreme smoke pollution as Californians exposed to at least one day of over 100 micorgrams of PM2.5. This methodology was employed by Childs' team. On the federal air quality index, or AQI, 100 micrograms of wildfire-specific PM2.5 level is a level of around 175, the the middle of the "unhealthy" range. 


# Questions / Feedback
Contact Dillon Bergin at dillon@muckrock.com 
