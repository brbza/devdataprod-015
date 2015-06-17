library(ggplot2)
data(mtcars)
columnNames <- c("Miles/(US) Gallon", "Number of Cylinders", "Displacement (cu.in.)", "Gross Horsepower",
                 "Rear Axle Ratio", "Weight (lb/1000)", "1/4 Mile Time", "V/S", "Transmission", 
                 "Number of Forward Gears", "Number of Carburetors")

shinyServer(
  function(input, output) {
    output$newLm <- renderPlot({
      column <- as.numeric(input$feature)
      df <- data.frame(mpg=mtcars[,1],feature=mtcars[,column])
      coef <- lm(mpg ~ feature, data = df)$coef
      ggplot(data=df) + geom_point(aes(x=feature,y=mpg)) + geom_abline(intercept=coef[1], slope=coef[2], colour="red") +
      annotate("text", label = paste("Intercept = ", coef[1]), size=6, x = min(df$feature), y = 13, vjust = 0, hjust = 0, colour="red") +
      annotate("text", label = paste("Slope = ", coef[2]), size=6, x = min(df$feature), y = 11, vjust = 0, hjust = 0, colour="red") +
      labs(title = paste("Linear Regression Between Miles/Gallon and", columnNames[column]), x = columnNames[column], y = "Miles/Gallon")
    })
  }
)