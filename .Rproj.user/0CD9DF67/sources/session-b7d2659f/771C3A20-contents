# Here's my designed shiny app code on evaluating the soil respiration fluxes (CO2 and CH4) in my study sites with different ecosystem types and treatments.
# Here're the three old features:
# Feature 1: Allow the user to search for their preferred entry (specific vegetation type and treatment) to check by using selectInput () under sidebarPanel().
# By entering your select entry, you can highlight your select study site's flux pattern over the growing season, for a detailed look and compare with other study sites.
# Feature 2: Allow the user to download the data table as.csv, with downloadButton() function.
# For open, reproducible science, you have direct access to Zoe's collected data.
# Feature 3: Place the 2 plots, a data table and a description page in separate tabs by using tabsetPanel().
# The App page allows you to access fluxes plots easily (FCO2 and FCH4), the dataset and the App description by clicking different tabs on the app.
# 
# Here're the four new features (feature 5 may be seen as an updated feature for feature 1):
# Feature 4: Allow the user to visually locate the study site by adding an image to the UI by using img(src = "imagename.png")
# You can check the locations of study area and specifically study sites from the image in the main panel.
# Feature 5: Allow the user to search for multiple entries (different vegetation types and treatments) by integrating the selectInput() with multiple = TRUE 
# By entering your select entries in the left panel, you can highlight flux patterns of selected study sites over the growing season, facilitating detailed comparisons across various ecosystem types and treatments.
# Feature 6: Allow the user to filter the dataset within a selected date range by incorporating dateRangeInput() for date selection in the sidebar panel and update 'renderDT({})' accordingly.
# You can interactively filter the dataset with the selected data range in the left panel.
# Feature 7: Allow the user to perform basic statistical analyses on the dataset by adding a new tab in the main panel for statistical analysis, this includes calculating the average (mean) and variance (var) of flux values.
# After selecting the desired data with specific entries and a date range, you can use the statistical analysis tab to examine the average values and variances of their selected flux measurements.

# Loading required libraries
library(shiny)
library(ggplot2)
library(DT)
library(dplyr)  # For data manipulation

# Load and prepare dataset
data <- read.csv("sample_data1.csv", stringsAsFactors = FALSE)
data$CollectionDate <- as.Date(data$CollectionDate)  # Convert CollectionDate to Date type

# Define UI layout
ui <- fluidPage(
  titlePanel("Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis"),
  sidebarLayout(
    sidebarPanel(
      # Feature 1 & 5: Selection inputs for ecosystem and treatment, with multiple selection enabled
      selectInput("ecosystem", "Select Ecosystem Type(s)", choices = unique(data$VegetationType), multiple = TRUE),
      selectInput("treatment", "Select Treatment(s)", choices = unique(data$Treatments), multiple = TRUE),
      hr(),
      # Feature 6: Date range input for filtering data
      dateRangeInput("dateRange", "Select Date Range", start = min(data$CollectionDate), end = max(data$CollectionDate)),
      hr(),
      # Feature 2: Download button for downloading data, moved below the date range selector
      downloadButton("downloadData", "Download Data")
    ),
    mainPanel(
      tabsetPanel(
        # Feature 3: Separate tabs for FCO2 and FCH4 time series plots, data table, and description
        tabPanel("FCO2 Time Series", plotOutput("fco2Plot")),
        tabPanel("FCH4 Time Series", plotOutput("fch4Plot")),
        tabPanel("Data Table", DTOutput("dataTable")),
        # Feature 7: Tab for statistical analysis
        tabPanel("Statistical Analysis", verbatimTextOutput("statAnalysis")),
        tabPanel("Description", verbatimTextOutput("descriptionText"))
      ),
      # Feature 4: Image of study site map
      img(src = "map_of_study_site.png", height = "300px", width = "100%")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression for filtered data based on selections
  filteredData <- reactive({
    data %>%
      filter(VegetationType %in% input$ecosystem, 
             Treatments %in% input$treatment, 
             CollectionDate >= input$dateRange[1], 
             CollectionDate <= input$dateRange[2])
  })
  
  # Function to create plots with dynamic unit labeling
  createPlot <- function(fluxType) {
    # Define the unit for y-axis label
    unit <- ifelse(fluxType == "FCO2", "µmol/m²/s", "nmol/m²/s")
    
    # Base plot with all data (lower opacity) and highlighted selected data (higher opacity)
    p <- ggplot(data, aes(x = CollectionDate, y = get(fluxType), group = interaction(VegetationType, Treatments))) +
      geom_line(aes(color = interaction(VegetationType, Treatments)), alpha = 0.2) +
      theme_minimal() +
      labs(title = paste(fluxType, "over Time"), y = paste(fluxType, "(", unit, ")")) +
      scale_color_discrete(name = "Ecosystem & Treatment")
    
    if (nrow(filteredData()) > 0) {
      p <- p + geom_line(data = filteredData(), aes(color = interaction(VegetationType, Treatments)), size = 1, alpha = 1)
    }
    
    return(p)
  }
  
  # Plot outputs for FCO2 and FCH4
  output$fco2Plot <- renderPlot({ createPlot("FCO2") })
  output$fch4Plot <- renderPlot({ createPlot("FCH4") })
  
  # Interactive Data Table reflecting selected data
  output$dataTable <- renderDT({ datatable(filteredData(), options = list(pageLength = 10)) })
  
  # Statistical analysis output
  output$statAnalysis <- renderText({
    if (nrow(filteredData()) > 0) {
      avgFCO2 <- mean(filteredData()$FCO2)
      avgFCH4 <- mean(filteredData()$FCH4)
      varFCO2 <- var(filteredData()$FCO2)
      varFCH4 <- var(filteredData()$FCH4)
      
      paste("Average FCO2: ", round(avgFCO2, 2), "µmol/m²/s",
            "\nAverage FCH4: ", round(avgFCH4, 2), "nmol/m²/s",
            "\nVariance of FCO2: ", round(varFCO2, 2),
            "\nVariance of FCH4: ", round(varFCH4, 2))
    } else {
      "No data available for the selected filters."
    }
  })
  
  # Description text with app usage instructions
  output$descriptionText <- renderText({
    paste(
      "This Shiny app facilitates the exploration of the impacts of various treatments and ecosystem types on CO2 (FCO2) and CH4 (FCH4) fluxes within a bog ecosystem.",
      "\n\nStudy Location: Burns Bog, located in Delta, BC.",
      "\nEcosystem Types: The study encompasses diverse ecosystems, including Pine Sphagnum Low Shrub (PSLS), Pine Sphagnum Tall Shrub (PSTS), and Pine Sphagnum Woodland (PSW).",
      "\nTreatments: The data includes areas with and without seedlings, allowing for comparative analysis.",
      "\n\nHow to Use the App:",
      "\n1) Select desired ecosystem types and treatments from the sidebar.",
      "\n2) Choose a specific date range for analysis.",
      "\n3) View time series plots for FCO2 and FCH4 in their respective tabs, displaying the flux pattern over the selected period.",
      "\n4) Examine detailed data in the 'Data Table' tab, which reflects your selections.",
      "\n5) Analyze mean and variance of flux values in the 'Statistical Analysis' tab.",
      "\n6) Download the filtered data set using the 'Download Data' button in the sidebar for further use or analysis."
    )
  })
  
  # Download handler for data download
  output$downloadData <- downloadHandler(
    filename = function() { paste("data-", Sys.Date(), ".csv", sep="") },
    content = function(file) { write.csv(filteredData(), file, row.names = FALSE) }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
