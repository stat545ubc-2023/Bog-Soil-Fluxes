# Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis - Updated Version
## Introduction of the Shiny App
Burns Bog is a bog ecosystem located in Delta, BC. It has experienced a fire in 2016. The postfire area had a high density of pine seedlings, which could lower the water table depth and increase the carbon emissions. The local government started to remove those seedlings as post-fire management since 2019 and would like to test the hypothesis that seedling removal can decrease the CO2 flux (FCO2) and increase the CH4 flux (FCH4). The Burns Bog Flux Analysis app visualizes FCO2 and FCH4 in response to various treatments in bog ecosystems. Users can interact with field data collected by Zoe, ensuring transparency and promoting open science. 
## The Online App Link (shinyapps.io)
https://64ken0-hehan-zhang.shinyapps.io/Burns_Bog_Carbon_Fluxes_Analysis/
## Description of the App
**Overall Description**
> The Burns Bog Flux Analysis Shiny app offers an interactive experience for users to analyze the effects of ecological treatments on greenhouse gas emissions. It
> presents time-series visualizations of carbon dioxide (FCO2) and methane (FCH4) fluxes, allowing users to select specific vegetation types and treatment conditions
> with the dropdown menus to check for the corresponding temporal variations of carbon fluxes. The app integrates a data table for an in-depth examination of the raw
> data points. It ensures scientific transparency by granting access to the complete dataset, encouraging reproducible research and open data practices. Users can
> also download the dataset directly for offline analysis, supporting further scientific inquiry. You can also find the description tab with further information on
> vegetation types and treatments.

**Main Features**

> Feature 1: Allow the user to search for their preferred entry (specific vegetation type and treatment) by using selectInput () under sidebarPanel(). (By entering
>  your select entry, you can highlight your select study site's flux pattern over the growing season for a detailed look and compare it with other study sites)
> 
> Feature 2: Allow the user to download the data table as.csv with the downloadButton() function. (For open, reproducible science, you have direct access to Zoe's
>  collected data)
> 
> Feature 3: Place the two plots, a table and a description page in separate tabs using tabsetPanel(). (The App page allows you to access fluxes plots easily (FCO2
>  and FCH4), the dataset and the App description by clicking different tabs on the app)
## About the Dataset
The user can directly access the dataset by clicking the App's _Data Table_ tab. The user can download the dataset from the App by clicking the _Download Data_ button under the dropdown menu or directly from this GitHub Repository, _sample_data.csv_. Using a chamber-portable analyzer technique, Zoe manually collected the data from April 2023 to September 2023. If you want to know more about how Zoe collected the data, please contact Zoe at hehanzha@student.ubc.ca.
## About the Repository
`App.R`: the R code for this shiny app
