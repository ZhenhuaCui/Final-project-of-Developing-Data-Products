library(shiny)

shinyServer(function(input, output) {
  model <- lm(mpg ~ ., data = mtcars)
            
  modelpred <- reactive({
    cardata = data.frame(cyl = input$slidercyl, disp=input$numericdisp, hp=input$numerichp, drat= input$numericdrat, wt=input$numericwt, 
                         qsec=input$numericqsec, vs=as.numeric(input$selectvs), am=as.numeric(input$selectam), gear=as.numeric(input$selectgear), carb=input$slidercarb)
    predict(model, newdata = cardata)
  })
  

  
  output$plot <- renderPlot({
    cardata = data.frame(cyl = input$slidercyl, disp=input$numericdisp, hp=input$numerichp, drat= input$numericdrat, wt=input$numericwt, 
                         qsec=input$numericqsec, vs=as.numeric(input$selectvs), am=as.numeric(input$selectam), gear=as.numeric(input$selectgear), carb=input$slidercarb)
    hist(mtcars$mpg, xlab = "Miles Per Gallon",xlim = c(10, 35),breaks=20, main="Histogram of MPG")
    abline(v=modelpred(),col="red")
    
    
  })
  
  output$pred <- renderText({
    round(modelpred(), digits = 2)
  })
})