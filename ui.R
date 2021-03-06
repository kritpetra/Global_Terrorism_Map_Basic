if(!require(shinydashboard)) install.packages('shinydashboard')
  
library(shinydashboard)
library(leaflet)

shinyUI(dashboardPage(
     skin="blue",

     dashboardHeader(title="Exploring Terrorism"),

     dashboardSidebar(
          selectInput('region', "Region", choices = c(
               'Middle East & North Africa' = "MidEast",
               "North America" = "NorthAm",
               "South Asia" = "SouthAs",
               "Sub-Saharan Africa" = "SubSahr",
               "Europe & Central Asia" = "Eurasia",
               "Latin America & Caribbean" = "LatinAm",
               "East Asia & Pacific" = "AsiaPac"
          )),
          sliderInput("year",
                      "Year",
                      min = 1970,
                      max = 2013,
                      value = 1970,
                      step = 1,
                      sep = "",
                      animate = animationOptions(interval = 1000)),

          htmlOutput('sidebarText')
     ),

     dashboardBody(
          tags$head(tags$style(HTML( # Additional style parameters
                              '
                              html, body {
                                   font-size: 1em;
                                   width: 100%;
                                   height: 100%;
                              }
                              td {
                                   padding-left: 0.5vw;
                                   padding-right: 0.5vw;
                                   vertical-align: middle;
                              }
                              small {
                                   font-size: 0.85em;
                                   color: #444;
                                   font-weight: normal;
                                   font-style: italic;
                              }
                              p.cell {
                                   line-height: 70%;
                              }
                              p.numbercell{
                                   left: 0px;

                              }
                              .leaflet-popup{
                              }
                              section.sidebar .shiny-input-container {
                                padding: 0px 15px 0px 12px;
                              }
                              #info {
                                   font-size: 1.2em;
                                   max-width: 40vw;
                              }
                              .legend {
                                   white-space: nowrap;
                              }

                             '))),
          leafletOutput("Map", width='100%', height='60em')


     )

))
