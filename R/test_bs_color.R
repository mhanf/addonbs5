#' Test the bootstrap validity of a color
#'
#' @param color color to test
#' @param transparent Is transparent color authorized ?
#' @param default Is default color authorized ?
#' @param label label for the error message
#' @return A error message if the color is invalid
#' @export

test_bs_color <- function(color,
                          transparent = TRUE,
                          default = FALSE,
                          label ="Color"
){
  # test transparent
  if (is.logical(transparent) == FALSE) {
    stop("transparent must be logical")
  }
  # test default
  if (is.logical(default) == FALSE) {
    stop("default must be logical")
  }
  # bootstrap color
  bs_color <- c("primary",
                "secondary",
                "light",
                "dark",
                "info",
                "success",
                "warning",
                "danger",
                "white",
                "black"
  )
  # optional add of transparent and default color
  if (default == TRUE){ bs_color = c("default", bs_color) }
  if (transparent == TRUE){ bs_color = c(bs_color,"transparent") }
  # message compilation
  message <- paste0(label, " must be either ", paste(bs_color, collapse = ", "))
  # stop if color is incorrect
  if (color %ni% bs_color){ stop(message) }
}
