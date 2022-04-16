#' Add a tooltip for a specific element
#'
#' @param tag Element on which a tooltip will be added
#' @param position Tooltip position (top, bottom, left or right)
#' @param trigger Trigger of the tooltip (hover, focus or both)
#' @param text Tooltip message
#' @param color Tooltip color (black and white exclude)
#' @import htmltools
#' @import shiny
#' @return A tooltip for a specific element
#' @export
#'
#' @examples
#' # Simple example
#' add_tooltip(
#' tag = shiny::actionButton("btn_id","tooltip"),
#' position = "top",
#' trigger = "hover focus",
#' text = "Tooltip message",
#' color = "primary"
#' )
#' # Advanced example
#' add_tooltip(
#' tag = shiny::actionButton("btn_id","tooltip"),
#' position = "top",
#' trigger = "hover focus",
#' text = icon("github"),
#' color = "light"
#' )

add_tooltip <- function(tag = NULL,
                        position = "top",
                        trigger = "hover focus",
                        text = NULL,
                        color = "black") {
  # dependencies
  tooltip_dep <- htmltools::htmlDependency(
    name = "tooltip",
    version = "0.0.1",
    src = "assets",
    script = "tooltip.js",
    stylesheet =  c(file = "tooltip.css"),
    package = "addonbs5" # user package
  )
  # test tag
  if (is.null(tag) == TRUE) {
    stop("tag must not be NULL")
  }
  # test position
  if (position %ni% c("top", "bottom", "left", "right")) {
    stop("tooltip position must be in top, bottom, left, or right")
  }
  # test trigger
  if (trigger %ni% c("hover", "focus", "hover focus", "focus hover")) {
    stop("tooltip trigger must be hover, focus or hover focus")
  }
  # test text
  if (is.null(text) == TRUE) {
    stop("tooltip text must not be NULL")
  }
  # test color
  test_bs_color(
    color,
    transparent = FALSE,
    default = FALSE,
    bw = TRUE,
    label = "tooltip color"
  )
  # class definition
  text_color <- "white"
  if (color == "light" | color == "white"){text_color = "black"}
  class_arrow <- paste0("popover-arrow popover-arrow-", color)
  class_inner <- paste0("tooltip-inner ", "tooltip-inner-", color," text-",text_color)
  # template definition
  template_tooltip <- shiny::div(
    class = "popover",
    role = "tooltip",
    shiny::div(class = class_arrow),
    shiny::div(class = class_inner, text)
  )
  # tooltip definition
  tooltip <- htmltools::tagQuery(tag)$addAttrs("data-bs-toggle" = "popover")$
    addAttrs('data-bs-placement' = position)$
    addAttrs('data-bs-trigger' = trigger)$
    addAttrs('role' = "button")$
    addAttrs('tabindex' = "0")$
    addAttrs("data-bs-content" = " ")$
    addAttrs("data-bs-template" = template_tooltip)$allTags()
  # attach dependency
  tooltip <- tagList(tooltip_dep, tooltip)
  # return
  return(tooltip)
}
