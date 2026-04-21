#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a Scatter plot
shinyServer(function(input, output) {
    
    x <- reactive({
        na.omit(airquality)[, input$xAxis]
    })
    
    y <- reactive({
        na.omit(airquality)[, input$yAxis]
    })
    
    output$plot <- renderPlotly({
       
        plot <- plot_ly(data = na.omit(airquality), x= ~x(), y= ~y(), type='scatter', mode= 'markers', name = 'Data')
        
        if(input$RegLine == TRUE){
            plot <- plot %>% add_lines(x=x(), y= fitted(lm(y() ~ x(), data = na.omit(airquality))), name="Regression")
        }
        
        else{
            plot <- plot
        }
        return(plot)
    })

})
