
'%ni%' <- Negate('%in%')


.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "addonbs5-assets",
    directoryPath = system.file("assets", package = "addonbs5"))
}