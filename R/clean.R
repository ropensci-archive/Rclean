# Copyright (C) 2017 Harvard University, Mount Holyoke College
#
# This file is part of Rclean
#
# Rclean is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# Rclean is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Rclean; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>


#'clean --- Produces more transparent code.
#'OUTPUT = The essential code needed to produce a result.
#'
#'Produces simplifed, "cleaned" code that is needed to create a result. 
#'Make sure that your working directory is set to the location of your script
#'and that you have loaded data provenance for that script into R's option system, and
#'Rclean takes care of the rest.
#'
#'@param result A desired output present in the script.
#'@param tidy LOGICAL: should the cleaned script be formatted using syntax best practices?
#'@return Cleaned code as a vector of strings ordered by line number. 
#'@seealso write.code
#'@importFrom formatR tidy_source
#'@importFrom utils capture.output
#'@importFrom utils tail
#'@export clean
#'@author Matthew K. Lau
#'@examples
#' \donttest{
#' test.dat.loc <- system.file("exec", "micro_R.json", package="Rclean")
#' options(prov.json = readLines(test.dat.loc))
#' clean() # Pick from the list of possible results
#' clean ("test.pdf")  # Create a minimal script to compute test.pdf
#' }

clean <- function(result = "Name of desired result",
    tidy = TRUE){
  ## Get provenance for script
  ## Check if the provenance is in memory
  if (!("prov.json" %in% names(options()))){
    stop("No provenance loaded. Please assign W3C PROV-JSON to options (i.e. options(prov.json = PROV.JSON))")
  }
  prov <- options()$prov.json

  ## Make sure result is of length 1
  if (length(result) > 1){
    warning(paste ("Please enter one result at a time.  Using", result[1]), quote = FALSE)
    result <- result[1]
  }
  
  # Load the provenance graph
  prov.graph <- provGraphR::create.graph (prov, isFile = FALSE)
  if (is.null (prov.graph)) {
    stop ("The provenance could not be parsed.")
  }
  
  ## Get the saved copy of the script
  parsed.prov <- provParseR::prov.parse (prov, isFile = FALSE)
  saved.script.file <- provParseR::get.saved.scripts(parsed.prov)$script[1]
  if (file.exists (saved.script.file)) {
    script.file <- saved.script.file
  }
  
  # If the saved copy does not exist, use the original script if it exists.
  else {
    script.file <- provParseR::get.scripts(parsed.prov)$script[1]
    if (!file.exists (script.file)) {
      # Look in the current directory 
      script.file <- basename(script.file)
      if (!file.exists (script.file)) {
        stop("No scripts matching current provenance.")
      }
    }
    warning (paste ("Saved script does not exist.  Using", script.file))
  }
  script <- readLines(script.file)
  
  ## Get result options
  ## Output files
  result.files <- provParseR::get.output.files(parsed.prov)$name
  
  ## Get objects for suggested results    
  result.obj <- provParseR::get.variables.set(parsed.prov)$name
  
  ## Combine vectors
  result.opts <- list(Files = unique(result.files), Objects = unique(result.obj))
  
  ## If result is NULL then prompt
  if (is.null (result) || result == "Name of desired result" || !(result %in% unlist(result.opts))){
    print("Possible results:", quote = FALSE)
    return (result.opts)
  }
  else {
    ## Get the node that matches the result name
    data.nodes <- provParseR::get.data.nodes(parsed.prov)
    matching.data.nodes <- data.nodes[data.nodes$name == result, ]
    node.id <- utils::tail(n = 1, matching.data.nodes$id)
    
    ## Graph search for the path from the result to inputs
    spine <- provGraphR::get.lineage(prov.graph, node.id)
    
    ## min.script == the minimum code to produce the output
    
    ## Get the line numbers from the original source code
    spine.proc.node.ids <- grep ("p", spine, value = TRUE)
    proc.nodes <- provParseR::get.proc.nodes(parsed.prov)
    spine.proc.nodes <- proc.nodes [proc.nodes$id %in% spine.proc.node.ids, ]
    lines <- spine.proc.nodes[ , grep("Line", colnames(spine.proc.nodes))]
    
    ### If the result is created on a single line, coerce to a matrix
    if (length(grep("p", spine)) == 1){
      lines <- as.numeric(lines)
      lines <- t(as.matrix(lines))
      rownames(lines) <- grep("p", spine, value = TRUE)
    }
    else{
      lines <- apply(lines, 2, as.numeric)
      rownames(lines) <- grep("p", spine, value = TRUE)
    }
    
    ### Extract the minimal code
    min.script <- apply(lines, 1, function(line) script[seq(line[1], line[2])])
    min.script <- unlist(min.script)
    min.script <- as.character(min.script)
    
    ### Tidying the code using formatR
    if (tidy){
      utils::capture.output(
          min.script <- 
              formatR::tidy_source(text = min.script)$text.tidy
      )
    }
    
    ### Return to user
    return(min.script)
  }
}
