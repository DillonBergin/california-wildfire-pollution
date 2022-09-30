library(tidyverse)
library(here)
library(janitor)
library(sf)
library(lubridate)
library(rio)
library(DT)
library(tidycensus)
library(tigris)
library(tmap)


weighted_grids <-read_csv(here("data", "processed", "childs_county_level_results", "annual_county_smokePM.csv"))

ca_fips <- counties("CA") %>% 
  select(county = NAME, county_fips = GEOID) %>% 
  st_drop_geometry()

ca_county_geoms <- counties("CA") %>% 
  select(county = NAME) 

weighted_grids_join <- 
  weighted_grids %>% 
  inner_join(ca_fips, by = "county_fips") %>% 
  select(county, year, pm25 = annual_avg_smokePM)


weighted_counties_sf <- weighted_grids_join %>% 
  inner_join(ca_county_geoms, by = "county") %>% 
  st_sf()


small_multiples <- tm_shape(weighted_counties_sf) +
  tm_polygons("pm25",
              style = "quantile",
              title = "Impact of Wildfire Smoke on Californian's Air") + 
  tm_text("county", size = 1/4) +
  tm_facets("year")

tmap_save(small_multiples, "weighted_county_small_multiples.svg")
