#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(addonbs5)

# Define UI for application that draws a histogram
ui <- fluidPage(
    theme = bslib::bs_theme(version = 5,bootswatch = "darkly"),
    
    add_oc(
        id = "id_oc",
        header = TRUE,
        title = "Title !",
        body ="Body !",
        position = "end",
        class_header = "bg-primary",
        class_body = "bg-light",
        class_btn = "btn-success",
        class_oc ="border border-primary",
        scroll = TRUE,
        backdrop = TRUE,
        close_btn = TRUE
    ),
    
    HTML('<a class="btn btn-primary" data-bs-toggle="offcanvas" href="#id_oc" role="button" aria-controls="offcanvasExample">
  Link with href
</a>
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#id_oc" aria-controls="offcanvasExample">
  Button with data-bs-target
</button>')
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
