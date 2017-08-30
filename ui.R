#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("frase", "Write any words in english", "", placeholder = 'Insert text')
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('App',
                 wellPanel(
                   tags$h3('Text being analysed'),
                   textOutput("frase")),
                 wellPanel(
                   tags$h3('Predicted word'),
                   textOutput("value")
                 )
        ),
        tabPanel('About',
                 tags$h2('Word Preditor App'),
                 tags$body('This app was developed as a capstone 
                           project for the Coursera Data Science Specialization.'),
                 tags$body('To use it, just insert any text in english in the text box
                           and wait for a prediction of the next word on the tab App.'),
                 tags$h3('Additional information'),
                 tags$a('Find out more about this app in this slide deck', href = 'http://rpubs.com/paulomiramor/302847'),
                 tags$h3('Source code'),
                 tags$a('Check the source code here', href = 'https://github.com/EuPaulo/dataScienceCapstone')
        )
      )
    )
  )
)
)

