# ========================================================
# This is the server logic of a Shiny web application
# You can run the application by clicking 'Run App' above.
# ========================================================

library(shiny)
library(ggplot2)
library(dplyr)

d <- diamonds[, 1:7]

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({

    d <- filter(diamonds, 
                carat,
                grepl(input$cut, cut), 
                grepl(input$col, color), 
                grepl(input$clar, clarity),
                depth,
                table
                )

    fit <- lm(price ~ carat, d)

    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar,
                                              depth = input$dep,
                                              table = input$tbl
                                              )
                    )

    plot <- ggplot(data = d, aes(x = carat, y = price)) +
      geom_point(aes(color = cut), alpha = 0.5)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$car, color = "green")+
      geom_hline(yintercept = pred, color = "green")
    plot
  })
  output$result <- renderText({

    d <- filter(diamonds, 
                carat,
                grepl(input$cut, cut), 
                grepl(input$col, color), 
                grepl(input$clar, clarity),
                depth,
                table
    )
    fit <- lm(price ~ carat, d)
    pred <- predict(fit, newdata = data.frame(carat = input$car,
                                              cut = input$cut,
                                              color = input$col,
                                              clarity = input$clar,
                                              depth = input$dep,
                                              table = input$tbl
                                              )
                    )
    res <- paste(round(pred, digits = 2), "$")
    res
  })
  
})
