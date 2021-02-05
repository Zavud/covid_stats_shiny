library(shiny); library(plotly); library(dplyr); library(tidyr)

shinyServer(func = function(input, output){
        url_data = "https://covid.ourworldindata.org/data/owid-covid-data.csv"
        covid_data = read.csv(url_data)
        covid_data$date = as.Date(covid_data$date)
        
        
        
        output$total_cases = renderPlotly({
                
                covid_data = covid_data %>%
                        filter(location == input$country_name)
                
                plot_ly(data = covid_data,
                        x = ~ date, y = ~ total_cases,
                        mode = "lines+markers",
                        type = "scatter") %>%
                        layout(title = paste("Total Reported Covid 19 Cases in", input$country_name, sep = " "),
                               xaxis = list(title = "Date"),
                               yaxis = list(title = "Total Reported Covid 19 Cases"),
                               hovermode = "x unified")
                        
        })
        
        output$new_cases = renderPlotly({
                
                covid_data = covid_data %>%
                        filter(location == input$country_name)
                
                plot_ly(data = covid_data,
                        x = ~ date, y = ~ new_cases,
                        type = "bar") %>%
                        layout(title = paste("Reported Daily New Covid 19 Cases in", input$country_name, sep = " "),
                               xaxis = list(title = "Date"),
                               yaxis = list(title = "Reported Daily Covid 19 Cases"),
                               hovermode = "x unified")
                
        })
        
        output$total_deaths = renderPlotly({
                
                covid_data = covid_data %>%
                        filter(location == input$country_name)
                
                plot_ly(data = covid_data,
                        x = ~ date, y = ~ total_deaths,
                        mode = "lines+markers",
                        type = "scatter") %>%
                        layout(title = paste("Total Reported Covid 19 Deaths in", input$country_name, sep = " "),
                               xaxis = list(title = "Date"),
                               yaxis = list(title = "Total Reported Covid 19 Deaths"),
                               hovermode = "x unified")
                
        })
        
        output$new_deaths = renderPlotly({
                
                covid_data = covid_data %>%
                        filter(location == input$country_name)
                
                plot_ly(data = covid_data,
                        x = ~ date, y = ~ new_deaths,
                        type = "bar") %>%
                        layout(title = paste("Reported Daily New Covid 19 Deaths in", input$country_name, sep = " "),
                               xaxis = list(title = "Date"),
                               yaxis = list(title = "Reported Daily Covid 19 New Deaths"),
                               hovermode = "x unified")
                
        })
        
})











