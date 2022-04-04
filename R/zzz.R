#' load package dependencies
#'
#' @param libname libname
#' @param pkgname pkgname
#'
#' @return
#' @export
#'

.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "addonbs5-assets",
    system.file("assets", package = "addonbs5")
  )
}