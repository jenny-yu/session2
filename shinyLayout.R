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
  
  # Application title
  titlePanel(tags$i("Old Faithful Geyser Data")),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(6,
           sliderInput("bins",
                       "Number of bins:",
                       min = 1,
                       max = 50,
                       value = 30, width = "80%")
    ),
    
    # Show a plot of the generated distribution
    column(6,
           tabsetPanel(
             tabPanel("plot1",
                      plotOutput("distPlot")
             ),
             
             tabPanel("plot2",
                      plotOutput("distPlot2")
             )
           ),
           #HTML()
           #plotOutput("distPlot"), 
           tags$ul(
             tags$li(tags$strong("Strong")),
             tags$li("second item"))
    ),
    tags$img(src="Epi_Logo_HZ_Outline_RGB.svg")
  )
)

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
