#' Create a shiny actionButton with a badge
#'
#' @param label label parameter of the actionButton
#' @param class class parameter of the actionButton
#' @param badge_text Text of the badge
#' @param badge_class Additional HTML class for the button
#' @param badge_color Color of the badge
#' @param badge_pill pill badge ? (TRUE or FALSE)
#' @param corner Badge in the corner ? (TRUE or FALSE)
#' @param ... Others parameters of shiny actionButton
#' @importFrom shiny actionButton tagList
#' @return an actionButton with a badge
#' @export
#'
#' @examples
#' actionButton_badge(label="Button",
#' inputId="btn_id",
#' badge_text = "5+",
#' badge_color = "success",
#' class="btn-primary",
#' corner = TRUE,
#' badge_pill = TRUE
#' )

actionButton_badge <- function(label,
                               class = NULL,
                               badge_color = "primary",
                               badge_text = NULL,
                               badge_class = NULL,
                               badge_pill = FALSE,
                               corner = FALSE,
                               ...) {
  # test corner
  if (is.logical(corner) == FALSE) {
    stop("corner must be logical")
  }
  # corner badge
  if (isTRUE(corner)) {
    class <- paste(class, "position-relative me-2")
    badge_class <- paste(badge_class,
                         "position-absolute top-0 start-100 translate-middle")
  }
  # badge creation
  badge <- add_badge(badge_text = badge_text,
                     badge_color = badge_color,
                     badge_class = badge_class,
                     badge_pill = badge_pill
                     )
  
  # final label button
  label <- shiny::tagList(label, badge)
  # final button
  button <- shiny::actionButton(label = label,
                                class = class,
                                ...)
  # return
  return(button)
}
