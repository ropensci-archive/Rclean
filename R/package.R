#' Rclean: A Tool for Writing Cleaner, More Transparent Code
#' 
#' The Rclean package provides a set of functions to isolate the
#' essential parts of a script that produces a chosen result, such as
#' an object, table and/or figure.
#'
#' @docType package
#' 
#' @name Rclean-package
#' @aliases Rclean
#' @author Matthew K. Lau \email{matthewklau@fas.harvard.edu}
#' @examples
#' \dontrun{
#' ## Define the path for your script
#' script <- "example/simple_script.R"
#' ## Get a list of the variables in your script
#' get_vars(script)
#' ## Take a look at the relationships in your script
#' code_graph(script)
#' ## Pick a result and isolate the code
#' clean(script, "tab.15")
#' ## You can also select multiple results at the same time!
#' my.vars <- c("tab.12", "tab.15")
#' clean(script, my.vars)
#' }
NULL
