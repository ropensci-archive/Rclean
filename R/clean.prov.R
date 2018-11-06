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

#' @param prov The name of a file containing provenance, or a string containing provenance
#' @param isFile Logical:  If true prov is expected to be a filename.
#'@export 
#'@examples
#' \donttest{
#' test.dat.loc <- system.file("exec", "micro_R.json", package="Rclean")
#' clean.prov(test.dat.loc) # Pick from the list of possible results
#' clean.prov (test.data.loc, "test.pdf")  # Create a minimal script to compute test.pdf
#' }
#' @rdname clean
clean.prov <- function (prov, result = NULL,
    tidy = TRUE, isFile = TRUE) {
  
  calling.func <- sys.call(-1)[[1]]
  if (is.null(calling.func) || (calling.func != "clean" && calling.func != "clean.prov")) {
    # If a symbol was passed in, convert it to a string
    arg <- substitute(result)
    if (is.symbol(arg)) {
      result <- as.character(deparse(arg))
    }
  }
  
  ## Make sure result is of length 1
  else {
    result <- eval(result) 
    if (length(result) > 1){
      result <- result[1]
      warning("Please enter one result at a time.  Using ", result)
    }
  }
  
  # Load the provenance graph
  provParsed <- provParseR::prov.parse(prov, isFile)
  prov.graph <- provGraphR::create.graph (prov, isFile)
  if (is.null (prov.graph)) {
    stop ("The provenance could not be parsed.")
  }
  
  ## Get the saved copy of the script
  saved.script.file <- provParseR::get.saved.scripts(provParsed)$script[1]
  if (file.exists (saved.script.file)) {
    script.file <- saved.script.file
  }
  
  # If the saved copy does not exist, use the original script if it exists.
  else {
    script.file <- provParseR::get.scripts(provParsed)$script[1]
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
  result.files <- provParseR::get.output.files(provParsed)$name
  
  ## Get objects for suggested results    
  result.obj <- provParseR::get.variables.set(provParsed)$name
  
  ## Combine vectors
  result.opts <- list(Files = unique(result.files), Objects = unique(result.obj))
  
  ## If result is NULL then prompt
  if (is.null (result) || result == "Name of desired result" || !(result %in% unlist(result.opts))){
    print("Possible results:", quote = FALSE)
    return (result.opts)
  }
  else {
    ## Get the node that matches the result name
    data.nodes <- provParseR::get.data.nodes(provParsed)
    matching.data.nodes <- data.nodes[data.nodes$name == result, ]
    node.id <- utils::tail(n = 1, matching.data.nodes$id)
    
    ## Graph search for the path from the result to inputs
    spine <- provGraphR::get.lineage(prov.graph, node.id)
    
    ## min.script == the minimum code to produce the output
    
    ## Get the line numbers from the original source code
    spine.proc.node.ids <- grep ("p", spine, value = TRUE)
    proc.nodes <- provParseR::get.proc.nodes(provParsed)
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

