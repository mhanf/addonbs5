#' Load tooltip and popover dependencies
#' @import shiny
#' @return Include css dependencies of bootstrap 5 tooltip and popover
#' @export
#'
#' @examples
#' use_addonbs5()

use_addonbs5 <- function() {
  shiny::singleton(shiny::tags$head(
    shiny::tags$link(href = "addonbs5-assets/popover.css",
                     rel = "stylesheet",
                     type = "text/css"),
    shiny::tags$script(
      "$(window).on('load', function(){$('[data-bs-toggle=\"popover\"]').popover({html: true})});"
    )
  ))
}

