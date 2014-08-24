library(shiny)
library(ggplot2)

# Load the dataset "mtcars"
dsCars <- get("mtcars")

# Change column names to more descriptive ones
names(dsCars) <- c("mpg", "cylinders", "displacement", "horsepower", "axleratio", 
                   "weight", "qmiletime", "vs", "transmission", "gears", "carburetors")

# Change some columns to factors for easier analysis later
dsCars$transmission <- factor(dsCars$transmission)
dsCars$cylinders <- factor(dsCars$cylinders)
dsCars$gears <- factor(dsCars$gears)
dsCars$carburetors <- factor(dsCars$carburetors)
dsCars$vs <- factor(dsCars$vs)

# Change column values to more descriptive ones
levels(dsCars$transmission) <- c("automatic", "manual")

# Main Server function
shinyServer(function(input, output) {
  
  # Drop-down selection list for choosing a dependent variable
  output$choose_dependent <- renderUI({
    selectInput("sl1","Select dependent variable",choices = as.list(names(dsCars)), selected = "mpg")
  })
  
  # Check boxes to choose predictors for dependent variable
  output$choose_predictors <- renderUI({
    # Select columns names by excluding the one chosen as a dependent variable
    colnames <- names(dsCars)
    colnames <- colnames[which(colnames != input$sl1)]
    
    # Create checkboxes for predictors
    checkboxGroupInput('ch1', 'Select one or more predictors',
                       choices = colnames)
  })
  
  # Create summary of the dataset
  output$summary <- renderPrint({str(dsCars)})
  
  # Create output data for the table 
  output$carstable <- renderTable({ dsCars })
  
  # Building first part of the formula - dependent variable
  depVar <- reactive({
    dv <- input$sl1
    dv
  })
  
  # Building first part of the formula - predictor variables
  predVar <- reactive({
    pv <- paste(input$ch1, collapse = " + ")
    
    if(is.null(input$ch1))
      pv <- c(" . ")
    
    pv
    
  })
  
  # Building the formula for regression model
  regFormula <- reactive({
    dv <- depVar()
    pv <- predVar()
    fr <- paste(dv," ~", pv)
    fr
  })
  
  # Building summary of the regression model
  modelSummary <- reactive({
    rf <- regFormula()
    summary(lm(formula = rf, data = dsCars))
    
  })
  
  # Model summary variable
  output$modelsummary <- renderPrint({
    modelSummary()
  })
  
  # Building a plot for residuals
  residualPlots <- reactive({
    rf <- regFormula()
    fmodel <- lm(formula = rf, data = dsCars)
    par(mfrow = c(2, 2))
    plot(fmodel)
  })
  
  # Residual plot variable
  output$residualplots <- renderPlot({
    residualPlots()
  })
  
})
