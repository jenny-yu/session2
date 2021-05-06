#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fixedPage(
  
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
  
  br(),
  # Application title
  titlePanel(tags$i("Old Faithful Geyser Data")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot",
                 plotOutput("distPlot")      ),
        tabPanel("Plot2",
                 plotOutput("distPlot2")      )
      )
    ), 
  )
)
################
library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$distPlot2 <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'pink', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)