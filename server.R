## This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram

shinyServer(function(input, output) {
    values <- reactiveValues()
    observe({
        input$calc_loan_amount
        values$Loan <- isolate({
            input$loan_amount + (input$loan_amount * input$loan_rate/100)*(input$loan_years)
        })
    })
    
    # Display in right pannel of frontend
    output$atual_amount <- renderText({
        input$calc_loan_amount
        paste("Loan Amount (in EUR): ", isolate(input$loan_amount))
    })
    
    output$atual_rate <- renderText({
        input$calc_loan_amount
        paste("Interest Rate (in %): ", isolate(input$loan_rate))
    })
    
    output$atual_years <- renderText({
        input$calc_loan_amount
        paste("Number of Years: ", isolate(input$loan_years))
    })
    
    # This is the total amount that we will pay for your loan
    
    output$cc_result <- renderText({
        if(input$calc_loan_amount == 0) ""
        else
            paste("The total amount that you will pay during the life of the loan is: ", values$Loan)
    })
})

    
    