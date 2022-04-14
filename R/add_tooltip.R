#' Add a tooltip for a specific element
#'
#' @param tag Element on which a tooltip will be added
#' @param tooltip_position Tooltip position (top, bottom, left or right)
#' @param tooltip_trigger Trigger of the tooltip (hover, focus or both)
#' @param tooltip_msg Tooltip message
#' @param tooltip_color Tooltip color (black and white exclude)
#' @import htmltools
#' @import shiny
#' @return A tooltip for a specific element
#' @export
#'
#' @examples

add_tooltip <- function(tag = NULL,
                        tooltip_position = "top",
                        tooltip_trigger = "hover focus",
                        tooltip_msg = NULL,
                        tooltip_color = "default") {
  
  
  popover_dep <- htmltools::htmlDependency(
    name = "tooltip",
    version = "1.0.0",
    src = "assets",
    script = "tooltip.js",
    stylesheet =  c(file = "tooltip.css"),
    package = "addonbs5" # user package
  )
  # tag
  if (is.null(tag) == TRUE) {
    stop("tag must not be NULL")
  }
  # tooltip_position
  if (tooltip_position %ni% c("top", "bottom", "left", "right")) {
    stop("popover_position must be in top, bottom, left, or right")
  }
  # tooltip_trigger
  if (tooltip_trigger %ni% c("hover", "focus", "hover focus", "focus hover")) {
    stop("popover_trigger must be hover, focus or hover focus")
  }
  # tooltip_msg
  if (is.null(tooltip_msg) == TRUE) {
    stop("popover_msg must not be NULL")
  }
  # tooltip_color
  test_bs_color(tooltip_color, transparent = FALSE, default = TRUE, bw = FALSE,label = "tooltip_color")

  # class definition
  class_tooltip <- paste0("popover")
  class_arrow <- paste0("popover-arrow popover-arrow-",tooltip_color)
  class_inner <- paste0("tooltip-inner ","tooltip-inner-",tooltip_color)
  
  # template definition
  template_tooltip <- shiny::div(
    class = class_tooltip,
    role = "tooltip",
    shiny::div(class = class_arrow),
    shiny::div(class = class_inner, tooltip_msg)
  )
  
  #template_tooltip <- '<div class="popover"><div class="popover-arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div><div class="popover-footer"><a class="btn btn-secondary btn-sm close">Close</a></div></div>'
  
  # popover definition
  tooltip <- htmltools::tagQuery(tag)$
    addAttrs("data-bs-toggle" = "popover")$
    addAttrs('data-bs-placement' = tooltip_position)$
    addAttrs('data-bs-trigger' = tooltip_trigger)$
    addAttrs('role' = "button")$
    addAttrs('tabindex' = "0")$
    addAttrs("data-bs-content" = " ")$
    addAttrs("data-bs-template" = template_tooltip)$allTags()
  
  tooltip <- tagList(popover_dep, tooltip)
  
  # return
  return(tooltip)
}
