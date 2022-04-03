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
                               badge_text,
                               badge_class = NULL,
                               badge_color = "primary",
                               badge_pill = FALSE,
                               corner = FALSE,
                               ...) {
  # test badge_pill
  if (is.logical(badge_pill) == FALSE) {
    stop("badge_pill must be logical")
  }
  # test corner
  if (is.logical(corner) == FALSE) {
    stop("corner must be logical")
  }
  # test badge_color
  test_bs_color(
    badge_color,
    transparent = FALSE,
    default = TRUE,
    label = "badge_color"
  )
  # default badge class
  badge_class <- paste0("badge bg-", badge_color)
  # pill badge
  if (isTRUE(badge_pill)) {
    badge_class <- paste(badge_class, "rounded-pill")
  }
  # corner badge
  if (isTRUE(corner)) {
    class <- paste(class, "position-relative")
    badge_class <- paste(badge_class,
                         "position-absolute top-0 start-100 translate-middle")
  }
  # final label button
  label <- shiny::tagList(label,
                          tags$span(class = badge_class, badge_text))
  # final button
  button <- shiny::actionButton(label = label,
                                class = class,
                                ...)
  # return
  return(button)
}
