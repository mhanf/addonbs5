

add_popover <- function(tag = NULL,
                        popover_position = "top",
                        popover_trigger = "hover focus",
                        popover_msg = NULL,
                        popover_title = NULL) {
  # tag
  if (is.null(tag) == TRUE) {
    stop("tag must not be NULL")
  }
  # popover position
  if (popover_position %ni% c("top", "bottom", "left", "right")) {
    stop("popover_position must be in top, bottom, left, or right")
  }
  # popover_trigger
  if (popover_trigger %ni% c("hover", "focus", "hover focus", "focus hover")) {
    stop("popover_trigger must be hover, focus or hover focus")
  }
  # popover_msg
  if (is.null(popover_msg) == TRUE) {
    stop("popover_msg must not be NULL")
  }
  
  
  template_popover <-div(class="popover",role="tooltip",
      div(class="popover-arrow"),
      h3(class="popover-header mt-0"),
      div(class="popover-body p-1")
      )
  
  #template <- HTML('<div class="popover bg-danger" role="tooltip"><div class="popover-arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>')
  
  template <- '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
  
  template_tooltip <- div(class="popover bg-danger border border-danger", role="tooltip",
                          div(class = "popover-arrow danger-v-popover"),
                          div(class = "tooltip-inner bg-danger","essai")
  )

  # popover definition
  popover <- htmltools::tagQuery(tag)$
    addAttrs("data-bs-toggle" = "popover")$
    addAttrs('data-bs-placement' = popover_position)$
    addAttrs('data-bs-trigger' = popover_trigger)$
    addAttrs('role' = "button")$
    addAttrs('tabindex' = "0")$
    addAttrs("data-bs-content" = popover_msg)$
    addAttrs("data-bs-template" = template_tooltip)$
    allTags()
  # pophover title
  if (is.na(popover_title) == FALSE) {
    popover <- htmltools::tagQuery(popover)$
      addAttrs('title' = popover_title)$
      allTags()
  }
  
  # javascript + css dependence of popover
#   popover <- tagList(shiny::singleton(tags$head(
# #     tags$style("
# # .primary-h-popover::before, .primary-h-popover::after {
# #     border-left-color: var(--bs-primary) !important;
# #     border-right-color: var(--bs-primary) !important;
# # }
# # 
# # .primary-v-popover::before, .primary-v-popover::after {
# #     border-top-color: var(--bs-primary) !important;
# #     border-bottom-color: var(--bs-primary) !important;
# # }
# # 
# # .secondary-h-popover::before, .secondary-h-popover::after {
# #     border-left-color: var(--bs-secondary) !important;
# #     border-right-color: var(--bs-secondary) !important;
# # }
# # 
# # .secondary-v-popover::before, .secondary-v-popover::after {
# #     border-top-color: var(--bs-secondary) !important;
# #     border-bottom-color: var(--bs-secondary) !important;
# # }
# # 
# # .info-h-popover::before, .info-h-popover::after {
# #     border-left-color: var(--bs-info) !important;
# #     border-right-color: var(--bs-info) !important;
# # }
# # 
# # .info-v-popover::before, .info-v-popover::after {
# #     border-top-color: var(--bs-info) !important;
# #     border-bottom-color: var(--bs-info) !important;
# # }
# # 
# # .danger-h-popover::before, .danger-h-popover::after {
# #     border-left-color: var(--bs-danger) !important;
# #     border-right-color: var(--bs-danger) !important;
# # }
# # 
# # .danger-v-popover::before, .danger-v-popover::after {
# #     border-top-color: var(--bs-danger) !important;
# #     border-bottom-color: var(--bs-danger) !important;
# # }
# # 
# # .warning-h-popover::before, .warning-h-popover::after {
# #     border-left-color: var(--bs-warning) !important;
# #     border-right-color: var(--bs-warning) !important;
# # }
# # 
# # .warning-v-popover::before, .warning-v-popover::after {
# #     border-top-color: var(--bs-warning) !important;
# #     border-bottom-color: var(--bs-warning) !important;
# # }
# # 
# # .success-h-popover::before, .success-h-popover::after {
# #     border-left-color: var(--bs-success) !important;
# #     border-right-color: var(--bs-success) !important;
# # }
# # 
# # .success-v-popover::before, .success-v-popover::after {
# #     border-top-color: var(--bs-success) !important;
# #     border-bottom-color: var(--bs-success) !important;
# # }
# # 
# # .light-h-popover::before, .light-h-popover::after {
# #     border-left-color: var(--bs-light) !important;
# #     border-right-color: var(--bs-light) !important;
# # }
# # 
# # .light-v-popover::before, .light-v-popover::after {
# #     border-top-color: var(--bs-light) !important;
# #     border-bottom-color: var(--bs-light) !important;
# # }
# # 
# # .dark-h-popover::before, .dark-h-popover::after {
# #     border-left-color: var(--bs-dark) !important;
# #     border-right-color: var(--bs-dark) !important;
# # }
# # 
# # .dark-v-popover::before, .dark-v-popover::after {
# #     border-top-color: var(--bs-dark) !important;
# #     border-bottom-color: var(--bs-dark) !important;
# # }
# # 
# # .black-h-popover::before, .black-h-popover::after {
# #     border-left-color: black !important;
# #     border-right-color: black !important;
# # }
# # 
# # .black-v-popover::before, .black-v-popover::after {
# #     border-top-color: black !important;
# #     border-bottom-color: black !important;
# # }
# # "),
#     tags$script(
#       "$(window).on('load', function(){$('[data-bs-toggle=\"popover\"]').popover({html: true})});"
#     )
#   )
#   ),
#   popover)
  # return
  return(popover)
}
