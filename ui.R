#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#    http://shiny.rstudio.com/
#


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("united"),

    
    titlePanel("Total amount to be paid during the life of a loan"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Please insert the data related to your loan to know how much you will pay at the end"),
            br(),
            numericInput("loan_amount",label = h4("Please insert the loan amount (in EUR):"),min = 0, max = 100,0), #, value = 70
            br(),
            numericInput("loan_rate",label = h4("Please insert the interest rate (in %):"),min = 0, max = 100,0), #, value = 70
            br(),
            numericInput("loan_years",label = h4("Please insert the number of years:"),min = 0, max = 100,0), #, value = 70
            br(),
            actionButton("calc_loan_amount", label = "Calculate total amount to be paid")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel
            (
                tabPanel("Calculation of the total amount paid during the loan",
                         p(h4("Loan data")),
                         textOutput("atual_amount"),
                         br(),
                         textOutput("atual_rate"),
                         br(),
                         textOutput("atual_years"),
                         br(),
                         p(h4("Total amount to be paid during the life of the loan:")),
                         textOutput("cc_result")
                ),         
                tabPanel(
                    "Documentation",
                    p(h4("Amount to be paid during the life of loan")),
                    br(),
                    helpText("This application computes the total amount that you will pay during the life of your loan")
                   
                )
            )        
        )
    ))
)
