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
    theme = bslib::bs_theme(version = 5,bootswatch = "flatly"),
    # masonry js load
    # shiny::tagList(
    #   shiny::singleton(
    #     shiny::tags$head(
    #       shiny::tags$script(
    #         src="addonbs5-assets/masonry.pkgd.min.js"
    #       )
    #     )
    #   )),
    br(),
    add_badge(badge_color ="primary",
              badge_text = "text",
              badge_class = NULL,
              badge_pill = FALSE),
    add_badge(badge_color ="secondary",
              badge_text = "text",
              badge_class = NULL,
              badge_pill = TRUE),
    add_badge(badge_color ="transparent",
              badge_text = "25+",
              badge_class = "border border-danger text-danger",
              badge_pill = TRUE),
    # action button to trigger oc
    actionButton_oc(
    inputId = "ok",
    label = "Off canvas button", 
    id_oc = "id_oc",
    class="btn-primary"
    ),
    # action link to trigger oc
    actionLink_oc(
      inputId = "ok",
      label = "Off canvas link", 
      id_oc = "id_oc",
      class="text-primary"
    ),
    br(),
    # oc definition
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
    br(),
    # action button with badge
    actionButton_badge(label="Test",
                       inputId="tid_ocest",
                       badge_text = "5+",
                       badge_color = "success",
                       class="btn-primary",
                       corner = FALSE,
                       badge_pill = TRUE),
    actionButton_badge(label="Test",
                       inputId="tid_ocest",
                       badge_text = "5+",
                       badge_color = "danger",
                       class="btn-primary",
                       corner = TRUE,
                       badge_pill = TRUE)
)

# Define server logic required to draw a histogram
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
