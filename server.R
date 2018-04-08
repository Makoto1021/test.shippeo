#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

Agencies <- c('agency A', 'agency A', 'agency A',
              'Agency B', 'Agency B', 'Agency B',
              'Agency C', 'Agency C', 'Agency C') 
Transporters <- c("Transporter A1", "Transporter A2", "Transporter A3", 
                  "Transporter B1", "Transporter B2", "Transporter B3", 
                  "Transporter C1", "Transporter C2", "Transporter C3") 

Ontime_rate <- as.numeric(c(2, 5, 7, 3, 5, 7, 8, 4, 10))

df = data.frame(Agencies, Transporters, Ontime_rate) 
write.csv(df, file = "data.csv")
data <- read.csv("data.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  ggplot(data, aes(input$agen, y = Ontime_rate)) + geom_bar(stat="identity")
  
  output$distPlot <- renderPlot({
    
    ggplot(data = data) + geom_histogram()
    
    observe({
      
      updateSelectizeInput(session,
                           'agen',
                           label = NULL,
                           choices = data$Agencies(),
                           selected = if (input$bar_agen) data$Agencies())
      
      updateSelectizeInput(session,
                           'trans',
                           label = NULL,
                           choices = data$Transporters(),
                           selected = if (input$bar_trans) data$Transporters())
    
    })
  })
})
