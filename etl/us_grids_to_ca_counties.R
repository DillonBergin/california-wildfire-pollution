library(sf)
library(tidyverse)
library(ggplot2)
library(here)
library(janitor)
library(tigris)
library(rio)

# 1. LOAD DATA 
# load pm2.5 predicitions for every grid across all days and years in the study 
pm25_predictions <- read_csv(here("data", "raw", "childs_et_al_study_data", "smokePM_predictions_20060101_20201231.csv"))
# load in map of 10km by 10km grid represneted in grid_ids in the dataset above 
map <- st_read(here("data","raw", "childs_et_al_study_data", "prediction_grid_10km", "prediction_grid_10km.shp")) 


# 2. EXTRACT THE GRIDS THAT FIT WITHIN CALIFORNIA COUNTIES 
# get US states from TIGRIS package and California counties
us_states <- states() %>% 
  select(NAME, geometry)
ca_counties <- counties("CA") %>% 
  select(NAME, geometry) 
# make state, county, and grid polygons into sf objects with coordinate reference of EPSG 4326
us_states_sf <- st_transform(st_as_sf(us_states), crs = 4326)
map_sf <- st_transform(st_as_sf(map), crs = 4326)
ca_counties_sf <- st_transform(st_as_sf(ca_counties), crs = 4326)
# how many grids overlap in the state of California? 7,162
#ca_overlap <- state_overlap %>% 
  #filter(NAME == "California")
# do we get the same number of grid overlap when we use California counties?
ca_county_overlap <- st_join(ca_counties_sf, map_sf) 



# 3. JOIN CALIFORNIA COUNTY GRIDS WITH PM25 PREDICTIONS AND GET RID OF SHAPE DATA 
ca_county_grid <- 
  ca_county_overlap %>% 
  st_drop_geometry() %>% 
  inner_join(pm25_predictions, by = "grid_id") %>% 
  select(county = NAME, date, grid_id, pm25 = smokePM_pred)

# 4. EXPORT AS SHAPE FILE FILE FOR ANALYSIS 
export(ca_county_grid, "data/processed/output_etl/ca_county_grid.csv")



