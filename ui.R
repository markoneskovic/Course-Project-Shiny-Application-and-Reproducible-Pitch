# ========================================================
# This is the server logic of a Shiny web application
# You can run the application by clicking 'Run App' above.
# ========================================================

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Diamond price prediction"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This application predicts the price of a diamond based on its characteristics."),
      h3(helpText("Select:")),
      numericInput("car", label = h4("Carats"), value = 0.02, min = 0.02, max = 5.01, step = 0.01),
      selectInput("cut", label = h4("Cut"), selected = 'Fair',
                  choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                 "Very Good" = "Very Good", "Premium" = "Premium",
                                 "Ideal" = "Ideal")),
      selectInput("col", label = h4("Color"), selected = 'D',
                  choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                 "F" = "F", "G" ="G",
                                 "H" = "H", "I" = "I",
                                 "J" = "J")),
      selectInput("clar", label = h4("Clarity"), selected = 'I1',
                  choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                 "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                 "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
      numericInput("dep", label = h4("Depth"), value = 43, min = 43, max = 79, step = 1),
      numericInput("tbl", label = h4("Table"), value = 43, min = 43, max = 95, step = 1)
    ),
    
    mainPanel(
      plotOutput("distPlot"),
      h4("Predicted value of this diamond is:"),
      h3(textOutput("result"))
    )
  )
))