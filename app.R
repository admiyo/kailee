#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(shiny.router)


# This creates UI for each page.
page <- function(title, content) {
   div(
       titlePanel(title),
       p(
           a(href="#!/home", "home"),
           a(href="#!/side", "side"),
           p(content),
           uiOutput("power_of_input")
       )
   )
}

home_page <- page("Home page", "This is the home page!")
side_page <- page("Side page", "This is the side page!")




# Callbacks on the server side for the sample pages
home_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>square</strong> of input and pass result to <code>output$power_of_input</code>: ", 
      as.numeric(input$int) ^ 2))
  })
}

side_server <- function(input, output, session) {
  output$power_of_input <- renderUI({
    HTML(paste(
      "I display <strong>cube</strong> of input and <strong>also</strong> pass result to <code>output$power_of_input</code>: ", 
      as.numeric(input$int) ^ 3))
  })
}

# Create routing. We provide routing path, a UI as well as a server-side callback for each page.
router <- make_router(
  route("/", home_page, home_server),
  route("home", home_page, home_server),
  route("side", side_page, side_server)
)

# Create output for our router in main UI of Shiny app.
ui <- shinyUI(fluidPage(
  shiny::sliderInput("int", "Choose integer:", -10, 10, 1, 1),
  router_ui()
))


# Define server logic for random distribution app ----
server <- function(input, output, session) {
    router(input, output, session)
}


shinyApp(ui, server)
