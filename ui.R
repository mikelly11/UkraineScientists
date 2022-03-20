library(shiny)
library(leaflet)
library(DT)
library(spData)
library(dplyr)
library(maps)
library(sf)

ui <- shinyUI(
  navbarPage("",  theme = "custom.css",
  tabPanel(title = "Ukranian Scientist Host Labs",
  sidebarLayout(
    sidebarPanel(width = 3,
                 h3("Using the Map"),
                 p("To use the map, click any country to filter lab availabilities located in the country."),
                 h3("Adding Labs"),
                 tags$a(href="https://bit.ly/ua-table", "Spreadsheet of Opportunities"),
                 p(),
                 p("The global community has created a continuously updated list of laboratories that can host Ukrainian scientists at all career levels. "),
                 p("Наукове суспільство створило постійно відновлюємий список лабораторій, які можуть прийняти українських вчених (включаючи аспірантів)."),
                 p("Научное сообщество создало постоянно обновляемый список лабораторий, которые могут принять украинских ученых (включая аспирантов)."),
                 tags$a(href="https://bit.ly/ua-form", "Add your lab to list"),
                 h3("Creators of Data"),
                 p(),
                 p("This effort has been pioneered by Andrew Kern (@pastramimachine) at the University of Oregon. The forms are maintained by Björn Grüning (University of Freiburg, usegalaxy.eu) and Anton Nekrutenko (Penn State University, usegalaxy.org).")
                 ),

    mainPanel(tabsetPanel(
      type = "tabs",
      tabPanel(
        "Map",
        leafletOutput("leafletmap"),
        dataTableOutput("tbl")
      )
    ))
  )
)
)
)

