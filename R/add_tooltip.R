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
  if (tooltip_color == "default"){ class_tooltip <-paste0("popover bg-black") }
  else {class_tooltip <-paste0("popover bg-", tooltip_color, " border border-", tooltip_color)}
  
  if (tooltip_position == "top" | tooltip_position == "bottom"){
    class_arrow <- paste0("popover-arrow ", tooltip_color, "-v-popover")
  } 
  else{
    class_arrow <- paste0("popover-arrow ", tooltip_color, "-h-popover")  
  }
  if (tooltip_color == "default"){class_inner <- "tooltip-inner bg-black"}
  else {class_inner <- paste0("tooltip-inner bg-", tooltip_color)}
  # template definition
  template_tooltip <- shiny::div(
    class = class_tooltip,
    role = "tooltip",
    shiny::div(class = class_arrow),
    shiny::div(class = class_inner, tooltip_msg)
  )
  # popover definition
  tooltip <- htmltools::tagQuery(tag)$
    addAttrs("data-bs-toggle" = "popover")$
    addAttrs('data-bs-placement' = tooltip_position)$
    addAttrs('data-bs-trigger' = tooltip_trigger)$
    addAttrs('role' = "button")$
    addAttrs('tabindex' = "0")$
    addAttrs("data-bs-content" = " ")$
    addAttrs("data-bs-template" = template_tooltip)$allTags()
  # return
  return(tooltip)
}
