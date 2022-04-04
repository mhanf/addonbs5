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

color <-
  c("primary",
    "secondary",
    "light",
    "dark",
    "info",
    "success",
    "warning",
    "danger")
color1 <-
  c(
    "default",
    "primary",
    "secondary",
    "light",
    "dark",
    "info",
    "success",
    "warning",
    "danger"
  )
color2 <-
  c(
    "default",
    "primary",
    "secondary",
    "light",
    "dark",
    "info",
    "success",
    "warning",
    "danger",
    "black",
    "white"
  )


# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bslib::bs_theme(version = 5, bootswatch = "flatly"),
  use_addonbs5(),
  br(),
  h3("Badge"),
  h4('Color'),
  lapply(color2,
         function(j) {
           add_badge(
             badge_color = j,
             badge_text = j,
             badge_class = NULL,
             badge_pill = FALSE
           )
         }),
  h4('Pill badges'),
  lapply(color2,
         function(j) {
           add_badge(
             badge_color = j,
             badge_text = j,
             badge_class = NULL,
             badge_pill = TRUE
           )
         }),
  h4('Personnalized badges'),
  lapply(color2,
         function(j) {
           add_badge(
             badge_color = "transparent",
             badge_text = j,
             badge_class = paste0("border border-", j, " text-", j),
             badge_pill = TRUE
           )
         }),
  h4('Badged button 1'),
  lapply(color2,
         function(j) {
           actionButton_badge(
             label = j,
             inputId = "j",
             badge_text = "4+",
             badge_color = j,
             class = "btn-primary",
             corner = FALSE,
             badge_pill = TRUE
           )
         }),
  h4('Badged button 2'),
  lapply(color2,
         function(j) {
           actionButton_badge(
             label = j,
             inputId = "j",
             badge_text = "4+",
             badge_color = j,
             class = "btn-primary",
             corner = TRUE,
             badge_pill = TRUE
           )
         }),
  h3('Off canvas'),
  # action button to trigger oc
  actionButton_oc(
    inputId = "ok",
    label = "Off canvas button",
    id_oc = "id_oc",
    class = "btn-primary"
  ),
  # action link to trigger oc
  actionLink_oc(
    inputId = "ok",
    label = "Off canvas link",
    id_oc = "id_oc",
    class = "text-primary text-decoration-none"
  ),
  br(),
  # oc definition
  add_oc(
    id = "id_oc",
    header = TRUE,
    title = "Title !",
    body = "Body !",
    position = "end",
    class_header = "bg-primary",
    class_body = "bg-light",
    class_btn = "btn-success",
    class_oc = "border border-primary",
    scroll = TRUE,
    backdrop = TRUE,
    close_btn = TRUE
  ),
  h3("Tooltip"),
  h4("Position"),
  add_tooltip(
    tag = actionButton("tooltip", "top"),
    tooltip_msg = "Message",
    tooltip_position = "top"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "bottom"),
    tooltip_msg = "Message",
    tooltip_position = "bottom"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "left"),
    tooltip_msg = "Message",
    tooltip_position = "left"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "right"),
    tooltip_msg = "Message",
    tooltip_position = "right"
  ),
  h4("Color"),
  lapply(color1,
         function(j) {
           add_tooltip(
             tag = actionButton("tooltip", j),
             tooltip_msg = "message",
             tooltip_color = j,
             tooltip_position = "top"
           )
         }),
  h4("Trigger"),
  add_tooltip(
    tag = actionButton("tooltip", "hover"),
    tooltip_msg = "message",
    tooltip_trigger = "hover"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "focus"),
    tooltip_msg = "message",
    tooltip_trigger = "focus"
  ),
  add_tooltip(tag = actionButton("tooltip", "both"),
              tooltip_msg = "message"),
  h4("HTML message"),
  add_tooltip(
    tag = actionButton("tooltip", "HTML"),
    tooltip_color = "primary",
    tooltip_msg = tagList(tags$b("HTML", class = "text-danger"), div("message"))
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application
shinyApp(ui = ui, server = server)
