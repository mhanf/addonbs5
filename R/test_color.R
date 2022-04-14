#' Test Hexcode colors
#'
#' Check if string(s) are valid hex colour representation
#'
#' @param x the colour value(s) to check.
#'
#' @return Logical vector indicating if strings(s) are valid hex representations
#' @export

test_hex_color <- function(x) {
  result <- TRUE
  isHex <- grepl("^#[[:xdigit:]]{6}$", x)
  isHexWithAlpha <- grepl("^#[[:xdigit:]]{8}$", x)
  if (TRUE %ni% (isHex | isHexWithAlpha)) {
    result <- FALSE
  }
  return(result)
}

#' Test r colors
#'
#' Check if string(s) are valid r colour representation
#'
#' @param x the colour value(s) to check.
#'
#' @return Logical vector indicating if strings(s) are valid r representations
#' @export

# test_r_color <- function(x) {
#   result <- TRUE
#   if (x %ni% colours()) {
#     result <- FALSE
#   }
#   return(result)
# }

#' Test bs5 or hex of r colors
#'
#' Check if string(s) are valid r colour representation
#'
#' @param x the colour value(s) to check.
#'
#' @return Logical vector indicating if strings(s) are valid bs5 or hex of r representations
#' @export

# test_global_color <- function(x) {
#   result <- TRUE
#   if (test_bs_color(x) == FALSE &
#       test_hex_color(x) == FALSE &
#       test_r_color(x) == FALSE) {
#     result <- FALSE
#   }
#   return(result)
# }
