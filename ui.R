#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("test"),
  
  # Sidebar with a slider input for number of bins 
  sidebarMenu(
    menuItem(text = h5('Agencies'),
             checkboxInput('bar_agen', label = 'Select All', value = TRUE),
             selectizeInput('agen', label = '', choices = c(), multiple = TRUE)
    ),
    
    menuItem(text = h5(('Transporters'),
                      checkboxInput('bar_trans', label = 'Select All', value = TRUE),
                      selectizeInput('trans', label = '', choices = c(), multiple = TRUE)
                      )
             ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))

