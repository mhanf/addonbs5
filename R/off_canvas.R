#' create a BS5 off canvas menu
#'
#' @param id id of the off canvas menu
#' @param title HTML title of the off canvas menu
#' @param position position of the off-canvas (top, bottom, start or end)
#' @param close_btn close button (TRUE or FALSE)
#' @param html HTML body of the off canvas menu
#'
#' @import shiny
#' @return a BS5 off canvas menu
#' @export
#'
#' @examples
#' off_canvas("id", "My off canvas menu", "My content", position = "start", close_btn = TRUE)

off_canvas <- function(id, title, html, position = "start", close_btn = TRUE){
  
  #test position
  if (position %ni% c("top","bottom","start","end")){ 
    stop("Position must ne in top, bottom, start or end")
  }
  # test close button
  if (is.logical(close_btn) == FALSE){stop("close_btn must be logical")}
  
  # compute html tag
  tag <- div(class = paste0("offcanvas offcanvas-",position),
      tabindex ="-1",
      id = id,
      'aria-labelledby' = paste0(id,"label"),
      'data-bs-scroll' = "true",
      'data-bs-backdrop' = "true",
      div(class="offcanvas-header",
          title,
          tags$button(type = "button", 
                      class = "btn-close bg-secondary btn-small", 
                      'data-bs-dismiss'= "offcanvas", 
                      'aria-label'= "Close")),
      div(class="offcanvas-body", html)
  )
  
  return(tag)
}
