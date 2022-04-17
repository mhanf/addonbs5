#' Create a BS5 badge
#'
#' @param color Badge color
#' @param text Badge text
#' @param class Badge additional class
#' @param pill pill badge ? (TRUE or FALSE)
#' @import htmltools
#' @return a BS5 badge
#' @export
#'
#' @examples
#' add_badge(
#' color ="transparent",
#' text = "25+",
#' class = "border border-danger text-danger",
#' pill = TRUE)

add_badge <- function(color = "default",
                      text = NULL,
                      class = NULL,
                      pill = FALSE)
{
  # test pill
  if (is.logical(pill) == FALSE) {
    stop("inline must be logical")
  }
  # # test color
  # test_bs_color(
  #   color,
  #   bw = TRUE,
  #   transparent = TRUE,
  #   default = TRUE,
  #   label = "color"
  # )
  # general class badge
  if (is.null(class)) {
    class <- paste0("badge bg-", color)
  }
  else {
    class <- paste0("badge bg-", color, " ", class)
  }
  # pill badge
  if (isTRUE(pill)) {
    class <- paste(class, "rounded-pill")
  }
  # final badge
  badge <- tags$span(class = class, text)
  
  return(badge)
}