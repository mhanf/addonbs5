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
      class="text-primary text-decoration-none"
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
                       badge_pill = TRUE),
    use_addonbs5(),
    h3("Tooltip"),
    h4("Position"),
    add_tooltip(
      tag = actionButton("tooltip","top"),
      tooltip_msg = "Message",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","bottom"),
      tooltip_msg = "Message",
      tooltip_position = "bottom"
    ),
    add_tooltip(
      tag = actionButton("tooltip","left"),
      tooltip_msg = "Message",
      tooltip_position = "left"
    ),
    add_tooltip(
      tag = actionButton("tooltip","right"),
      tooltip_msg = "Message",
      tooltip_position = "right"
    ),
    h4("Color"),
    add_tooltip(
      tag = actionButton("tooltip","default"),
      tooltip_msg = "message",
      tooltip_color = "default",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","primary"),
      tooltip_msg = "message",
      tooltip_color = "primary",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","secondary"),
      tooltip_msg = "message",
      tooltip_color = "secondary",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","light"),
      tooltip_msg = "message",
      tooltip_color = "light",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","dark"),
      tooltip_msg = "message",
      tooltip_color = "dark",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","info"),
      tooltip_msg = "message",
      tooltip_color = "info",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","danger"),
      tooltip_msg = "message",
      tooltip_color = "danger",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","warning"),
      tooltip_msg = "message",
      tooltip_color = "warning",
      tooltip_position = "top"
    ),
    add_tooltip(
      tag = actionButton("tooltip","success"),
      tooltip_msg = "message",
      tooltip_color = "success",
      tooltip_position = "top"
    ),
    h4("Trigger"),
    add_tooltip(
      tag = actionButton("tooltip","hover"),
      tooltip_msg = "message",
      tooltip_trigger = "hover"
    ),
    add_tooltip(
      tag = actionButton("tooltip","focus"),
      tooltip_msg = "message",
      tooltip_trigger = "focus"
    ),
    add_tooltip(
      tag = actionButton("tooltip","both"),
      tooltip_msg = "message"
    ),
    h4("HTML message"),
    add_tooltip(
      tag = actionButton("tooltip","HTML"),
      tooltip_color = "primary",
      tooltip_msg = tagList(tags$b("HTML",class="text-danger"),div("message"))
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
