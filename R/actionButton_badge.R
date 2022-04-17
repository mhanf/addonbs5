#' #' Create a shiny actionButton with a badge
#' #'
#' #' @param label label parameter of the actionButton
#' #' @param class class parameter of the actionButton
#' #' @param text Text of the badge
#' #' @param class Additional HTML class for the button
#' #' @param color Color of the badge
#' #' @param pill pill badge ? (TRUE or FALSE)
#' #' @param corner Badge in the corner ? (TRUE or FALSE)
#' #' @param ... Others parameters of shiny actionButton
#' #' @importFrom shiny actionButton tagList
#' #' @return an actionButton with a badge
#' #' @export
#' #'
#' #' @examples
#' #' actionButton_badge(label="Button",
#' #' inputId="btn_id",
#' #' text = "5+",
#' #' color = "success",
#' #' class="btn-primary",
#' #' corner = TRUE,
#' #' pill = TRUE
#' #' )
#' 
#' actionButton_badge <- function(label,
#'                                class = NULL,
#'                                color = "primary",
#'                                text = NULL,
#'                                class = NULL,
#'                                pill = FALSE,
#'                                corner = FALSE,
#'                                ...) {
#'   # test corner
#'   if (is.logical(corner) == FALSE) {
#'     stop("corner must be logical")
#'   }
#'   # corner badge
#'   if (isTRUE(corner)) {
#'     class <- paste(class, "position-relative")
#'     class <- paste(class,
#'                          "position-absolute top-0 start-100 translate-middle")
#'   }
#'   # badge creation
#'   badge <- add_badge(text = text,
#'                      color = color,
#'                      class = class,
#'                      pill = pill
#'                      )
#'   
#'   # final label button
#'   label <- shiny::tagList(label, badge)
#'   # final button
#'   button <- shiny::actionButton(label = label,
#'                                 class = class,
#'                                 ...)
#'   # return
#'   return(button)
#' }
