require(markdown)

shinyUI(fluidPage(
  titlePanel("Mileage per Gallon and Its Relation to Another Car's Aspects"),
  includeMarkdown("README.md"),
  sidebarPanel(
    selectInput("feature", label = h4("Car Aspect"), 
                choices = list("Number of Cylinders" = 2, "Displacement (cu.in.)" = 3, "Gross Horsepower " = 4,
                               "Rear Axle Ratio" = 5, "Weight (lb/1000)" = 6, "1/4 Mile Time" = 7,
                               "V/S" = 8, "Transmission" = 9, "Number of Forward Gears" = 10, 
                               "Number of Carburetors" = 11), 
                selected = 1)
  ),
  
  mainPanel(
    plotOutput('newLm')
  )
))