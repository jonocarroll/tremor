library(shiny)
library(tremor)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  tremorOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderTremor(
    tremor(Text("a"), Metric("$12"))
  )
}

shinyApp(ui, server)
