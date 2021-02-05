library(shiny); library(plotly)

shinyUI(fixedPage(
    titlePanel(title = "Check Covid 19 Statistics for your country!"),
    sidebarLayout(
        sidebarPanel(
            textInput(inputId = "country_name",
                      label = "Enter the country name here:",
                      value = "World",
                      placeholder = "First letter must be uppercase!"),
            submitButton(text = "Submit Changes!")
        ),
        mainPanel(
            tabsetPanel(
                type = "pills",
                tabPanel(title = "Total Cases", br(), br(),
                         plotlyOutput(outputId = "total_cases", height = "500px")),
                tabPanel(title = "New Cases", br(), br(),
                         plotlyOutput(outputId = "new_cases", height = "500px")),
                tabPanel(title = "Total Deaths", br(), br(),
                         plotlyOutput(outputId = "total_deaths", height = "500px")),
                tabPanel(title = "New Deaths", br(), br(),
                         plotlyOutput(outputId = "new_deaths", height = "500px"))
            )
        )
    )
))