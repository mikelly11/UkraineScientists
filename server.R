library(shiny)
library(leaflet)
library(DT)
library(spData)
library(dplyr)
library(maps)
library(googlesheets4)
library(sf)

gs4_deauth()
sheet_id <- "https://docs.google.com/spreadsheets/d/1XaBr9PN9ZJk9Oc2rWxAAskTFJWr_A6CkRKR7as5Mizc/edit?usp=sharing"
df1 <- read_sheet(sheet_id)

df <- data.frame(df1)

data(world.cities)

world_df <- world.cities %>%
  filter(capital == 1) %>%
  dplyr::select(Country = country.etc, lat, long = long) %>%
  left_join(df, ., by = "Country") %>%
  select(-Zeitstempel, -lat, -long) %>%
  rename(Funding.Possibility = 4) 

polygon <- right_join(world, world_df, by = c('name_long' = 'Country'))

server <- shinyServer(function(input, output) {
  
  output$leafletmap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("CartoDB.Positron") %>% 
      addPolygons(data = polygon, weight = 1, layerId= ~name_long, fillOpacity = 0.1, popup = polygon$name_long, popupOptions = popupOptions(closeButton = FALSE)) %>%
      addTiles() %>%
      setView(lng = 0, lat = 45, zoom = 2) 
  })
  
  countryinput <- reactiveVal()
  
  observeEvent(input$leafletmap_shape_click, {
    if(!is.null(countryinput()) && countryinput() == input$leafletmap_shape_click$id)
      countryinput(NULL)  
    else
      countryinput(input$leafletmap_shape_click$id)
  })
  
  output$tbl <- DT::renderDataTable({
    DT::datatable( 
      if(is.null(countryinput())) 
        world_df  
      else 
        world_df %>% filter(Country==countryinput()))
  })
  
})