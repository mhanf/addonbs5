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
library(fontawesome)
color <-
  c("primary",
    "secondary",
    "light",
    "dark",
    "info",
    "success",
    "warning",
    "danger")
color1 <- c("default", color)
color2 <- c(color, "black", "white")

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bslib::bs_theme(version = 5, bootswatch = "flatly"),
  br(),
  HTML(' <div class="container mt-5">

      <!-- button to initialize toast -->
      <button type="button" class="btn btn-primary" id="toastbtn">Initialize toast</button>

      <!-- Toast -->
      <div class="toast align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="d-flex">
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
</div>


    <!-- Popper.js first, then Bootstrap JS -->
    <script>
      document.getElementById("toastbtn").onclick = function() {
        var toastElList = [].slice.call(document.querySelectorAll(".toast"))
        var toastList = toastElList.map(function(toastEl) {
        // Creates an array of toasts (it only initializes them)
          return new bootstrap.Toast(toastEl) // No need for options; use the default options
        });
       toastList.forEach(toast => toast.show()); // This show them
   
        console.log(toastList); // Testing to see if it works
      };

    </script>'),
  
  
  h3("Badge"),
  h4('Color'),
  lapply(color2,
         function(j) {
           add_badge(
             color = j,
             text = j,
             class = NULL,
             pill = FALSE
           )
         }),
  h4('Pill badges'),
  lapply(color2,
         function(j) {
           add_badge(
             color = j,
             text = j,
             class = NULL,
             pill = TRUE
           )
         }),
  h4('Personnalized badges'),
  lapply(color1,
         function(j) {
           add_badge(
             color = "transparent",
             text = j,
             class = paste0("border border-", j, " text-", j),
             pill = TRUE
           )
         }),
  # h3('Buttons'),
  # h4('Circular buttons'),
  # lapply(color1,
  #        function(j) {
  #          actionButton_circle(
  #            inputId = "ok",
  #            icon = shiny::icon("tree"),
  #            class=paste0("btn-",j)
  #          )
  #        }),
  # h4('Personalized circular buttons'),
  # lapply(color1,
  #        function(j) {
  #          actionButton_circle(
  #            inputId = "ok",
  #            icon = shiny::icon("cog"),
  #            class=paste0("btn-outline-",j)
  #          )
  #        }),
  # h4('Badged button 1'),
  # lapply(color2,
  #        function(j) {
  #          actionButton_badge(
  #            label = j,
  #            inputId = "j",
  #            text = "4+",
  #            color = j,
  #            corner = FALSE,
  #            pill = TRUE
  #          )
  #        }),
  # h4('Badged button 2'),
  # lapply(color2,
  #        function(j) {
  #          actionButton_badge(
  #            label = j,
  #            inputId = "j",
  #            text = "4+",
  #            color = j,
  #            class = "me-3",
  #            corner = TRUE,
  #            pill = TRUE
  #          )
  #        }),
  # h3('Off canvas'),
  # # action button to trigger oc
  # actionButton_oc(
  #   inputId = "ok",
  #   label = "Off canvas button",
  #   id_oc = "id_oc",
  #   class = "btn-primary"
  # ),
  # # action link to trigger oc
  # actionLink_oc(
  #   inputId = "ok",
  #   label = "Off canvas link",
  #   id_oc = "id_oc",
  #   class = "text-primary"
  # ),
  # br(),
  # # oc definition
  # add_oc(
  #   id = "id_oc",
  #   header = TRUE,
  #   title = "Title !",
  #   body = "Body !",
  #   position = "end",
  #   class_header = "bg-primary",
  #   class_body = "bg-light",
  #   class_btn = "btn-success",
  #   class_oc = "border border-primary",
  #   scroll = TRUE,
  #   backdrop = TRUE,
  #   close_btn = TRUE
  # ),
  h3("Tooltip"),
  h4("Position"),
  add_tooltip(
    tag = actionButton("tooltip", "top"),
    text = "Message",
    position = "top"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "bottom"),
    text = "Message des plus interessant à lire attentivement!",
    position = "bottom"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "left"),
    text = "Message",
    position = "left"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "right"),
    text = "Message",
    position = "right"
  ),
  h4("Color"),
  lapply(color2,
         function(j) {
           add_tooltip(
             tag = actionButton("tooltip", j),
             text = "message",
             color = j,
             position = "top"
           )
         }),
  h4("Trigger"),
  add_tooltip(
    tag = actionButton("tooltip", "hover"),
    text = "message"
  ),
  add_tooltip(
    tag = actionButton("tooltip", "focus"),
    text = shiny::icon("user"),
    color = "primary",
    trigger = "focus"
  ),
  add_tooltip(tag = actionButton("tooltip", "both"),color="primary",
              text = "message"),
  h4("HTML message"),
  add_tooltip(
    tag = actionButton("test", "HTML"),
    color = "primary",
    text = tagList(tags$b("HTML", 
                          class = "text-success"), 
                   div("message")
                   )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application
shinyApp(ui = ui, server = server)
