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


#' @param r.script The name of a file containing an R script
#' @param ... Extra parameters are passed to the provenance collector
#'@export 
#'@examples
#' \donttest{
#' test.dat.loc <- system.file("exec", "micro.R", package="Rclean")
#' clean.script(test.dat.loc) # Pick from the list of possible results
#' clean.script (test.data.loc, "test.pdf")  # Create a minimal script to compute test.pdf
#' }
#' @rdname clean
clean.script <- function (r.script, result = NULL, tidy = TRUE, ...) {
  # Determine which provenance collector to use
  loaded <- loadedNamespaces()
  if ("provR" %in% loaded) {
    tool <- "provr"
  }
  else if ("RDataTracker" %in% loaded) {
    tool <- "rdt"
  }
  else {
    installed <- utils::installed.packages ()
    if ("provR" %in% installed) {
      tool <- "provr"
    }
    else if ("RDataTracker" %in% installed) {
      tool <- "rdt"
    }
    else {
      stop ("One of provR or RDataTracker must be installed.")
    }
  }
  if (tool == "rdt") {
    prov.run <- RDataTracker::prov.run
    prov.dir <- RDataTracker::prov.dir
  }
  else {
    prov.run <- provR::prov.run
    prov.dir <- provR::prov.dir
  }
  
  # Run the script, collecting provenance, if a script was provided.
  prov.run(r.script, ...)
  
  # Find out where the provenance is stored.
  json.file <- paste(prov.dir(), "prov.json", sep = "/")
  
  # Clean the script
  clean.prov (json.file, result, tidy, isFile = TRUE)
  
}
