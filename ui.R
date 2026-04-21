#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Antonio Espinoza Medina


library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Simple Linear Regression - Air Quality"),

    sidebarLayout(
        sidebarPanel(
            selectInput("xAxis", "Choose an X-Axis", choices = c("Solar.R", "Wind")),
            
            radioButtons("yAxis", "Choose an Y-Axis", choices = c("Ozone", "Temp")),
            
            checkboxInput("RegLine", "Regression Line", value = FALSE)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("plot")
        )
    )
))
