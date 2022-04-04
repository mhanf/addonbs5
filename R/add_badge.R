#' Create a BS5 badge
#'
#' @param badge_color Badge color
#' @param badge_text Badge text
#' @param badge_class Badge additional class
#' @param badge_pill pill badge ? (TRUE or FALSE)
#' @import htmltools
#' @return a BS5 badge
#' @export
#'
#' @examples
#' add_badge(
#' badge_color ="transparent",
#' badge_text = "25+",
#' badge_class = "border border-danger text-danger",
#' badge_pill = TRUE)

add_badge <- function(badge_color = "default",
                      badge_text = NULL,
                      badge_class = NULL,
                      badge_pill = FALSE)
{
  # test pill
  if (is.logical(badge_pill) == FALSE) {
    stop("inline must be logical")
  }
  # test badge_color
  test_bs_color(
    badge_color,
    bw = TRUE,
    transparent = TRUE,
    default = TRUE,
    label = "badge_color"
  )
  # general class badge
  if (is.null(badge_class)) {
    badge_class <- paste0("badge bg-", badge_color)
  }
  else {
    badge_class <- paste0("badge bg-", badge_color, " ", badge_class)
  }
  # pill badge
  if (isTRUE(badge_pill)) {
    badge_class <- paste(badge_class, "rounded-pill")
  }
  # final badge
  badge <- tags$span(class = badge_class, badge_text)
  
  return(badge)
}