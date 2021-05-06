
library(shiny)

# Define UI for application that draws a histogram
ui <- fixedPage(
  
  # challenge 2 title
  title = "Challenge 2",
  titlePanel(h1("Exercise - challenge 2", align = "center")),

  #add an image in a new row, but the first 2 failed to center it
  # div(img(height = 100, width = 200, src="http://projects.upei.ca/cver/files/2016/04/CF251-12S-AVC-608-M.jpg"), style="text-align: center;"),
  # HTML('<center><img(height = 100, width = 200, src="http://projects.upei.ca/cver/files/2016/04/CF251-12S-AVC-608-M.jpg", ></center>'),
  br(),  
  fluidRow(
    column(4, offset=5,
           img(height = 100, width = 200, 
               src="http://projects.upei.ca/cver/files/2016/04/CF251-12S-AVC-608-M.jpg"))
  ),
  br(),  
  fluidRow(
    column(4,style="background-color: Coral;",
           p("the first 4 columns, my name:", 
             span("Jenny Yu",style="font-weight: bold"), align ="center")),
    column(4,style="background-color: Aqua;",
           p("the second 4 columns, my email:",
             span("jennyyu@upei.ca",style="font-weight: bold"), align ="center")),
    column(4,style="background-color: LawnGreen;", 
           p("my web:",span("http://cver.upei.ca/epi-on-the-island-2021/",
                            style="font-weight: bold"), align ="center"))
    #column(4, a(href="http://cver.upei.ca/epi-on-the-island-2021/"))
  ),  

  
  )

# Define server logic required to draw a histogram
server <- function(input, output) {
  
}

# Run the application 

shinyApp(ui = ui, server = server)

