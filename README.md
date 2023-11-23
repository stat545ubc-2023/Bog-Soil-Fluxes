# Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis
## Introduction of the Shiny App
The Burns Bog Flux Analysis app visualizes CO2 (FCO2) and CH4 (FCH4) fluxes in response to various treatments in bog ecosystems. Users can interact with field data collected by Zoe (contact email: hehanzha@student.ubc.ca) in Delta, BC, ensuring transparency and promoting open science. 
## The Online App Link (shinyapps.io)
https://64ken0-hehan-zhang.shinyapps.io/assignment-b3-zoezhh/
## Description of the App
**Overall Description**
> The Burns Bog Flux Analysis Shiny app offers an interactive experience for users to analyze the effects of ecological treatments on greenhouse gas emissions. It
> presents time-series visualizations of carbon dioxide (FCO2) and methane (FCH4) fluxes, allowing users to select specific vegetation types and treatment conditions > to customize the plots with the dropdown menus. The app integrates a data table for an in-depth examination of the raw data points. It ensures scientific
> transparency by granting access to the complete dataset, encouraging reproducible research and open data practices. Users can also download the dataset directly
> for offline analysis, supporting further scientific inquiry. You can also find the description tab with further information on vegetation types and treatments.

**Main Features**

> Feature 1: Allow the user to search for their preferred entry (certain vegetation type and treatment) by using selectInput () under sidebarPanel().
> 
> Feature 2: Allow the user to download the data table as.csv with the downloadButton() function.
> 
> Feature 3: Place the two plots, a table and a description page in separate tabs using tabsetPanel().
## About the Dataset
The user can directly access the dataset by clicking the App's _Data Table_ tab. The user can download the dataset from the App by clicking the _Download Data_ button under the dropdown menu or directly from this GitHub Repository, _sample_data.csv_. Using a chamber-portable analyzer technique, Zoe manually collected the data from April 2023 to September 2023. If you want to know more about the data, please contact Zoe at hehanzha@student.ubc.ca.
## About the Repository
`App.R`: the R code for this shiny app

`sample_data.csv`: the dataset used in this app
