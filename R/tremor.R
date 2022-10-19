#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
tremor <- function(..., width = NULL, height = NULL) {

  # describe a React component to send to the browser for rendering.
  content <- reactR::component("Card", list(...))

  # create widget
  htmlwidgets::createWidget(
    name = 'tremor',
    x = reactR::reactMarkup(content),
    width = width,
    height = height,
    package = 'tremor'
  )
}

#' @export
Text <- function(...) {
  reactR::React$Text(...)
}

#' @export
Metric <- function(...) {
  reactR::React$Metric(...)
}

#' @export
ProgressBar <- function(...) {
  reactR::React$ProgressBar(...)
}


#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.tremor <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    shiny.tailwind::use_tailwind(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' @keywords internal
wrap_components <- function(components) {
  if(!is.null(components) && length(components) > 0 && !is.list(components[[1]])) {
    components <- list(components)
  }

  components
}

#' Shiny bindings for rtremor
#'
#' Output and render functions for using rtremor within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rtremor
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rtremor-shiny
#'
#' @export
tremorOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'tremor', width, height, package = 'tremor')
}

#' @rdname rtremor-shiny
#' @export
renderTremor <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, tremorOutput, env, quoted = TRUE)
}
