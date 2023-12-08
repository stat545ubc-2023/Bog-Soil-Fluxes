# Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis - New Version
## Background Information of the Shiny App
Burns Bog is a bog ecosystem located in Delta, BC. It has experienced a fire in 2016. The postfire area had a high density of pine seedlings, which could lower the water table depth and increase the carbon emissions. The local government started to remove those seedlings as post-fire management since 2019 and would like to test the hypothesis that seedling removal can decrease the CO2 flux (FCO2) and increase the CH4 flux (FCH4). The Burns Bog Flux Analysis app visualizes FCO2 and FCH4 in response to various treatments in bog ecosystems. Users can interact with field data collected by Zoe, ensuring transparency and promoting open science. 

## The Online App Link (shinyapps.io)
https://64ken0-hehan-zhang.shinyapps.io/Burns_Bog_Carbon_Fluxes_Analysis/

## Purpose and Functioning of the App

The Burns Bog Flux Analysis Shiny app is a user-friendly tool for analyzing the impacts of various ecosystem types and ecological treatments on greenhouse gas fluxes in Burns Bog's burned area. The app features intuitive time-series visualizations of carbon dioxide (FCO2) and methane (FCH4) fluxes, allowing users to select specific datasets, including ecosystem types, treatments, and date ranges, for detailed flux pattern analysis. It provides basic statistical analysis tools to calculate mean and variance and includes a comprehensive data table for in-depth raw data examination. The app supports scientific transparency by offering full dataset access for reproducible research and open data practices. Additionally, users can download the dataset for offline analysis. The app provides descriptions and user guidance on the left panel to give insights into the app. This Shiny app provides comprehensive time-series visualizations, customizable data selection, and essential statistical analysis features, making it a practical resource for ecological research and data exploration.

## How to Use the App

1) Select desired ecosystem types and treatments from the sidebar. 
2) Choose a specific date range for analysis. 
3) View time series plots for FCO2 and FCH4 in their respective tabs, displaying the flux pattern over the selected period. 
4) Examine detailed data in the 'Data Table' tab, which reflects your selections. 
5) Analyze the mean and variance of flux values in the 'Statistical Analysis' tab. 
6) Download the filtered data set using the 'Download Data' button in the sidebar for further use or analysis.
   
## Details - Features for Old and New Version of Apps

Here are the three old features:

> Feature 1: Allow the user to search for their preferred entry (specific vegetation type and treatment) by using selectInput () under sidebarPanel(). (By entering your select entry, you can highlight your select study site's flux pattern over the growing season for a detailed look and compare it with other study sites)
> 
> Feature 2: Allow the user to download the data table as.csv with the downloadButton() function. (For open, reproducible science, you have direct access to Zoe's collected data)
> 
> Feature 3: Place the two plots, a table and a statistical analysis page in separate tabs using tabsetPanel(). (The App page allows you to access fluxes plots easily (FCO2 and FCH4), the dataset and the statistical analysis by clicking different tabs on the app)

Here are the four new features:

> Feature 4: Allow the user to visually locate the study site by adding an image to the UI by using img(src = "imagename.png"). (You can check the locations of the study area and specifically study sites from the image in the main panel)
>
>  Feature 5 (may be seen as an updated feature for feature 1): Allow the user to search for multiple entries (different vegetation types and treatments) by integrating the selectInput() with multiple = TRUE. (By entering your select entries in the left panel, you can highlight flux patterns of selected study sites over the growing season, facilitating detailed comparisons across various ecosystem types and treatments)
>
>  Feature 6: Allow the user to filter the dataset within a selected date range by incorporating dateRangeInput() for date selection in the sidebar panel and update 'renderDT({})' accordingly. (You can interactively filter the dataset with the selected data range in the left panel)
>
> Feature 7: Allow the user to perform basic statistical analyses on the dataset by adding a new tab in the main panel for statistical analysis; this includes calculating the average (mean) and variance (var) of flux values. (After selecting the desired data with specific entries and a date range, you can use the statistical analysis tab to examine their selected flux measurements' average values and variances)
> 
## About the Dataset
The user can directly access the dataset by clicking the App's _Data Table_ tab. The user can download the dataset from the App by clicking the _Download Data_ button under the dropdown menu or directly from this GitHub Repository, _sample_data1.csv_. Using a chamber-portable analyzer technique, Zoe manually collected the data from April 2023 to September 2023. If you want to know more about how Zoe collected the data, please contact Zoe at hehanzha@student.ubc.ca.
## About the Repository
`App.R`: the R code for this shiny app

`sample_data1.csv`: the dataset used in this app

`rsconnect folder`: contains a .dcf file presenting the specific information of the shinyapps.io online app I created.

`www folder`: the folder with the image (map_of_study_site.png) presented on the app

`Readme.md`: This readme file gives you information on the repository and the designation of the shiny app.
