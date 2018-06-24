library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict MPG of a car"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slidercyl", "How many cylindars", 4,8,value=4, step = 1),
      numericInput("numericdisp", "What is the displacement(cu.in.)?",
                   value =200, min = 70, max = 472, step=1),
      numericInput("numerichp", "What is the horsepower?",
                   value =100, min = 50, max = 335, step=1),
      numericInput("numericdrat", "What is the Rear axle ratio?",
                   value =3, min = 2.7, max = 4.95, step=0.1),
      numericInput("numericwt", "What is the weight (lbs/1000)?",
                   value =3, min = 1.5, max = 5.5, step=0.1),
      numericInput("numericqsec", "What is the 1/4 mile time?",
                   value =30, min = 14.5, max = 23, step=0.01),
      radioButtons("selectvs", "V-shape (vs=0) or Straight Line (vs=1)?", c(0,1)),
      radioButtons("selectam", "automatic (am=0) or manual (am=1) ?", c(0,1)),
      selectInput("selectgear", "Number of gears?", c(3,4,5)),
      sliderInput("slidercarb", "Number of carburetors?", 1,8,value=5, step = 1),
      submitButton("Submit")
                ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted MPG from Model:"),
     textOutput("pred")
              )
      )
  ))