#' Create a shiny actionButton that triggers an off canvas
#'
#' @param id_oc id of the off canvas to trigger
#' @param ... Same parameters as shiny::actionButton(...)
#' @importFrom shiny actionButton
#' @importFrom htmltools tagQuery
#' @return A shiny actionButton that triggers a particular off canvas
#' @export
#'
#' @examples
#' actionButton_oc(
#' inputId = "ok",
#' label = "Trigger", 
#' id_oc = "id_oc",
#' class="btn-danger"
#' )

actionButton_oc <- function(id_oc, ...){
    # add class to button
  button <- htmltools::tagQuery(shiny::actionButton(...))$
    addAttrs('data-bs-toggle'="offcanvas")$
    addAttrs('data-bs-target' = paste0("#",id_oc))$
    addAttrs('aria-controls' = paste0(id_oc,'label'))$
    allTags()
    # return
  return(button)
}