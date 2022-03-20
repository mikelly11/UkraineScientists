library(shiny)
library(leaflet)
library(DT)

ui <- shinyUI(
  navbarPage("",  theme = "custom.css",
  tabPanel(title = "Ukranian Scientist Host Laboratories",
  sidebarLayout(
    sidebarPanel(width = 3,
                 h3("Laboratories/лабораторій/лабораторий"),
                 p("The global community has created a continuously updated list of", tags$a(href="https://bit.ly/ua-table", "laboratories"), "that can host Ukrainian scientists at all career levels. "),
                 p("Наукове суспільство створило постійно відновлюємий список", tags$a(href="https://bit.ly/ua-table", "лабораторій"), ", які можуть прийняти українських вчених (включаючи аспірантів)."),
                 p("Научное сообщество создало постоянно обновляемый список", tags$a(href="https://bit.ly/ua-table", "лабораторий"), ", которые могут принять украинских ученых (включая аспирантов)."),
                 tags$a(href="https://bit.ly/ua-form", "Add your lab to list"),
                 h3("Creators of Data"),
                 p("This effort has been pioneered by Andrew Kern", tags$a(href="https://twitter.com/pastramimachine", "(@pastramimachine)"), "at the University of Oregon. The forms are maintained by Björn Grüning (University of Freiburg, usegalaxy.eu) and Anton Nekrutenko (Penn State University, usegalaxy.org)."),
                 h3("Visualization of Data"),
                 p("Shiny App and visualization performed by Maia Kelly", tags$a(href="https://twitter.com/maiaikelly", "(@maiaikelly)"), "using Shiny and R.")
                 ),

    mainPanel(tabsetPanel(
      type = "tabs",
      tabPanel("Map",
               h3("Using the Map"),
               p("Click any country to filter the host laboratories located there. / Виберіть країну на карті, щоб переглянути лабораторії. / Выберите страну на карте для просмотра лабораторий."),
        leafletOutput("leafletmap"),
        dataTableOutput("tbl")
      )
    ))
  )
)
)
)

