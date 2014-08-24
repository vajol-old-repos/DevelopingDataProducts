shinyUI(fluidPage(
  
  titlePanel("Motor Trend dataset analysis"),
  
  sidebarPanel(
    uiOutput("choose_dependent"),
    
    uiOutput("choose_predictors")
    
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Application Summary", 
               p("This application is an example of regression model analysis performed on a 'Motor trend' dataset."),
               p("It is a handy tool and a good addition to the report I have created as a part of 'Regression Models' course:"),
               a(href = "http://www.rpubs.com/vajol/20885", "Motor Trend Analysis report"),
               p("In that report, we tried to fit the best model for 'mpg' as a dependent variable. This application however,"),
               p("allows us to cross analyze different variables and choose any of them as either dependent, or predictor."),
               p("How to use this application:"),
               p(" - Choose dependent variable from the list,"),
               p(" - Choose one or more predictors,"),
               p(" - Analyze how chosen model fits by examining 'Model Summary' tab,"),
               p(" - Analyze how chosen model fits by examining 'Residual Plots' tab"),
               p("Change dependent/predicting variables while examining the model and watch how it changes dynamically.")
      ),
      tabPanel("Dataset Summary", verbatimTextOutput("summary")),
      tabPanel("Dataset Table", tableOutput("carstable")),
      tabPanel("Model Summary", verbatimTextOutput("modelsummary")),
      tabPanel("Residual Plots", plotOutput("residualplots"))
    )
  )
))
