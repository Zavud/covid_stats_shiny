## Introduction to the R Shiny App "Covid Stats"

Covid Stats is a statistical app (developed with R Shiny) for visualization of Covid 19 statistics for any chosen country. The main purpose of this app is to produce interactive graphs that are easy to use and understand. Specifically, the app gives the user detailed information (with interactive plots) on the following:

- Total Reported Covid 19 Cases
- Reported Covid 19 Daily Cases
- Total Reported Covid 19 Deaths
- Reported Covid 19 Daily Deaths

The app uses the COVID-19 dataset that is maintained by [Our World in Data](https://ourworldindata.org/). The [dataset](https://ourworldindata.org/coronavirus-source-data) is updated daily and includes data on confirmed cases, deaths, testing and many other variables.

The ui.R and server.R files can be found at [my github repository page](https://github.com/Zavud/Covid_Stats_Shiny_App).


## How to use the "Covid Stats" App?

Using the app is fairly easy. Follow the steps below:

1. Click [here](https://zavud.shinyapps.io/Covid_Stats/?_ga=2.198513967.1892869228.1612549660-2072997826.1610824900) to acess the App
2. Wait until the default Total Cases exponential Covid-19 graph for the World appears
3. Enter any country name you are interested in (Note: the first letter must be Uppercase! E.g. Italy, United States)
4. Click on different tabs to discover other graphs like New Cases, Total Deaths and New Deaths
5. Hover around the plot to see the reported cases/deaths for every day

Optional:

1. You can zoom in to a specific part of the graph using the options on the upper right side of the plots
2. You can download the plots as PNG files using the "Download Plot as a png" function on the upper right of the plot


## How does the App work?

The App makes use of the Package "Plotly" in order to produce the interactive graphs.

1. When the app starts to run, it always goes to the [Our World in Data website](https://ourworldindata.org/) and reads the most recently updated data from their website.
2. After reading the data in, it initially produces plots for the World (default is World). 
3. And the user's job is to choose any country that they want to discover.
4. Every time you enter a new country name, the app takes a subset of the original data based on only the chosen country
5. Finally it produces the 4 plots for Total Cases, New Cases, Total Deaths and New Deaths for the chosen country

## What happens when the user keeps entering different country names?

For example, if you choose the country Germany, the process that happens in the backround is as follows:

```{r, echo=FALSE}
suppressPackageStartupMessages(require(dplyr))
original_data = read.csv("owid-covid-data.csv")
```

```{r}
covid_germany = original_data %>%
        filter(location == "Germany")
unique(covid_germany$location)
```

So we have only information about Germany in the subset data.

