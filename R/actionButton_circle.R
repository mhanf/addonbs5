#' Create a shiny circular actionButton
#'
#' @param ... Same parameters as shiny::actionButton(...)
#' @param style style parameter similar to actionButton
#' @param icon icon parameter similar to actionButton
#'
#' @importFrom shiny actionButton
#' @return A circular shiny actionButton
#' @export
#'
#' @examples
#' actionButton_circle(
#' inputId = "ok",
#' icon = shiny::icon("user"),
#' class="btn-success"
#' )

actionButton_circle <- function(style = NULL, icon =NULL, ...){
  # general class badge
  if (is.null(icon)) {
    stop("icon parameter can not be null")
  }
  # circular style
  style <- paste("height: 40px; width: 40px; border-radius: 50%;", style)
  # add 
  button <- shiny::actionButton(style = style,icon = icon, label = NULL,...)
  # return
  return(button)
}