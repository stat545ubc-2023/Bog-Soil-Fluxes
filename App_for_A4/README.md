# Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis - Updated Version
## Introduction of the Shiny App
Burns Bog is a bog ecosystem located in Delta, BC. It has experienced a fire in 2016. The postfire area had a high density of pine seedlings, which could lower the water table depth and increase the carbon emissions. The local government started to remove those seedlings as post-fire management since 2019 and would like to test the hypothesis that seedling removal can decrease the CO2 flux (FCO2) and increase the CH4 flux (FCH4). The Burns Bog Flux Analysis app visualizes FCO2 and FCH4 in response to various treatments in bog ecosystems. Users can interact with field data collected by Zoe, ensuring transparency and promoting open science. 
## The Online App Link (shinyapps.io)
https://64ken0-hehan-zhang.shinyapps.io/Burns_Bog_Carbon_Fluxes_Analysis/
## Description of the App
**Overall Description**
> The Burns Bog Flux Analysis Shiny app is an interactive tool designed to analyze ecological treatments' impact on greenhouse gas emissions in Burns Bog's burned area. This app displays time-series charts of carbon dioxide (FCO2) and methane (FCH4) fluxes. Users can choose specific data sets through the left panel, including ecosystem types, treatments, and a date range. This selection process reveals the corresponding carbon flux changes over time. The app also offers basic statistical analysis options, such as calculating mean and variance for the selected data. Additionally, it features a data table for a detailed examination of raw data points. A key aspect of the app is its commitment to scientific transparency, as it provides full access to the dataset, fostering reproducible research and open data practices. Users have the option to download the dataset for further offline analysis. Moreover, the app includes a description tab with information about the study sites and guidance on using the app.
**How to Use the App**
1) Select desired ecosystem types and treatments from the sidebar. 
2) Choose a specific date range for analysis. 
3) View time series plots for FCO2 and FCH4 in their respective tabs, displaying the flux pattern over the selected period. 
4) Examine detailed data in the 'Data Table' tab, which reflects your selections. 
5) Analyze mean and variance of flux values in the 'Statistical Analysis' tab. 
6) Download the filtered data set using the 'Download Data' button in the sidebar for further use or analysis.
**Details - Features for Old and New Version of Apps**
Here are the three old features:
> Feature 1: Allow the user to search for their preferred entry (specific vegetation type and treatment) by using selectInput () under sidebarPanel(). (By entering your select entry, you can highlight your select study site's flux pattern over the growing season for a detailed look and compare it with other study sites)
> 
> Feature 2: Allow the user to download the data table as.csv with the downloadButton() function. (For open, reproducible science, you have direct access to Zoe's collected data)
> 
> Feature 3: Place the two plots, a table and a description page in separate tabs using tabsetPanel(). (The App page allows you to access fluxes plots easily (FCO2 and FCH4), the dataset and the App description by clicking different tabs on the app)
Here are the four new features:
> Feature 4: Allow the user to visually locate the study site by adding an image to the UI by using img(src = "imagename.png"). (You can check the locations of the study area and specifically study sites from the image in the main panel)
>
>  Feature 5: Allow the user to search for multiple entries (different vegetation types and treatments) by integrating the selectInput() with multiple = TRUE. (By entering your select entries in the left panel, you can highlight flux patterns of selected study sites over the growing season, facilitating detailed comparisons across various ecosystem types and treatments)
>
>  Feature 6: Allow the user to filter the dataset within a selected date range by incorporating dateRangeInput() for date selection in the sidebar panel and update 'renderDT({})' accordingly. (You can interactively filter the dataset with the selected data range in the left panel)
>
> Feature 7: Allow the user to perform basic statistical analyses on the dataset by adding a new tab in the main panel for statistical analysis, this includes calculating the average (mean) and variance (var) of flux values. (After selecting the desired data with specific entries and a date range, you can use the statistical analysis tab to examine their selected flux measurements' average values and variances)
> 
## About the Dataset
The user can directly access the dataset by clicking the App's _Data Table_ tab. The user can download the dataset from the App by clicking the _Download Data_ button under the dropdown menu or directly from this GitHub Repository, _sample_data1.csv_. Using a chamber-portable analyzer technique, Zoe manually collected the data from April 2023 to September 2023. If you want to know more about how Zoe collected the data, please contact Zoe at hehanzha@student.ubc.ca.
## About the Repository
`App.R`: the R code for this shiny app
