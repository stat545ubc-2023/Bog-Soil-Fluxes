# Loading required libraries
library(shiny)
library(ggplot2)
library(DT)
library(rsconnect)

# Load and prepare dataset
data <- read.csv("sample_data.csv", stringsAsFactors = FALSE)
data$CollectionDate <- as.Date(data$CollectionDate) # Converting CollectionDate to Date type

# Define UI layout
ui <- fluidPage(
  titlePanel("Burns Bog - 2016 Burned Zone Carbon Fluxes Analysis"), # Title of the app
  sidebarLayout(
    sidebarPanel(
      selectInput("ecosystem", "Select Ecosystem Type", choices = unique(data$VegetationType)), # Dropdown for ecosystem selection
      selectInput("treatment", "Select Treatment", choices = unique(data$Treatments)), # Dropdown for treatment selection
      hr(), # Horizontal line for visual separation
      downloadButton("downloadData", "Download Data") # Button for downloading data
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("FCO2 Time Series", plotOutput("fco2Plot")), # Tab for FCO2 time series plot
        tabPanel("FCH4 Time Series", plotOutput("fch4Plot")), # Tab for FCH4 time series plot
        tabPanel("Data Table", DTOutput("dataTable")), # Tab for showing data table
        tabPanel("Description", verbatimTextOutput("descriptionText"))  # Description tab for additional information
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Plot for FCO2
  output$fco2Plot <- renderPlot({
    # Creating FCO2 plot using ggplot2
    p <- ggplot(data, aes(x = CollectionDate, y = FCO2, group = interaction(VegetationType, Treatments))) +
      geom_line(aes(color = interaction(VegetationType, Treatments)), alpha = 0.3) + # Plotting lines for each group with transparency
      geom_line(data = data[data$VegetationType == input$ecosystem & data$Treatments == input$treatment, ],
                aes(color = interaction(VegetationType, Treatments)), size = 1.5) + # Highlighting selected group
      theme_minimal() +
      labs(title = "FCO2 over Time", y = "FCO2 (µmol/m²/s)") +
      scale_color_discrete(name = "Ecosystem & Treatment")
    
    return(p)
  })
  
  # Plot for FCH4
  output$fch4Plot <- renderPlot({
    # Creating FCH4 plot using ggplot2
    p <- ggplot(data, aes(x = CollectionDate, y = FCH4, group = interaction(VegetationType, Treatments))) +
      geom_line(aes(color = interaction(VegetationType, Treatments)), alpha = 0.3) + # Similar approach as for FCO2 plot
      geom_line(data = data[data$VegetationType == input$ecosystem & data$Treatments == input$treatment, ],
                aes(color = interaction(VegetationType, Treatments)), size = 1.5) +
      theme_minimal() +
      labs(title = "FCH4 over Time", y = "FCH4 (nmol/m²/s)") +
      scale_color_discrete(name = "Ecosystem & Treatment")
    
    return(p)
  })
  
  # Interactive Data Table
  output$dataTable <- renderDT({
    datatable(data, options = list(pageLength = 10)) # Rendering the data as a datatable
  })
  
  # Description text
  output$descriptionText <- renderText({
    # Multi-line description about the app and dataset
    paste("This shiny app is used for investigating the impacts of treatments 
and ecosystem types on CO2 and CH4 fluxes in a bog ecosystem.\n",
          "Study Location: Burns Bog, Delata, BC \n",
          "Ecosystem types:\n",
          "PSLS: Pine Sphagnum Low Shrub;\n",
          "PSTS: Pine Sphagnum Tall Shrub;\n",
          "PSW: Pine Sphagnum Woodland;\n",
          "Treatments:\n",
          "S: Study area with seedlings;\n",
          "R: Study area with seedlings removed.")
  })
  
  # Download Data Button
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(data, file, row.names = FALSE)
    }
  )
}

shinyApp(ui = ui, server = server)