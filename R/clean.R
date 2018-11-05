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
#'
#' These functions generate a simplifed, "cleaned" version of your code that 
#' contains just the code needed to produce a specific result.  They work
#' by using data provenance created when your script executes to identify 
#' the exact code needed to calculate the result.  The output is a vector
#' containing just those lines of code. 
#' 
#' The clean function assumes that you have already run a tool 
#' to collect the provenance and it has loaded that provenance into R's option system, using
#' prov.json as the option name.  The value should be the provenance string, in the 
#' format defined by <need link here...>
#'
#' clean.prov takes as input the name of a file containing provenance,
#' or a string containing the provenance directly.  The provenance 
#' should have been previously collected by rdt or rdtLite.
#'
#' clean.script uses one of rdt or rdtLite to collect the provenance.  If only one of 
#' these is currently loaded, it will use that tool.  If they are both loaded, it will 
#' use rdtLite.  If neither is loaded, it then looks to see if either is installed,
#' again preferring rdtLite to rdt if they are both installed.
#' 
#'@param result A desired output present in the script.  This should be either a
#'  variable set in your script, or a file output by the script.  If omitted,
#'  the list of varaibles set and files written will be displayed to the user.
#'@param tidy LOGICAL: should the cleaned script be formatted using syntax best practices?
#'@return Cleaned code as a vector of strings ordered by line number. 
#'@seealso \code{\link{write.code}}
#'@export clean
#'@author Matthew K. Lau
#'@examples
#' \donttest{
#' test.dat.loc <- system.file("exec", "micro_R.json", package="Rclean")
#' options(prov.json = readLines(test.dat.loc))
#' clean() # Pick from the list of possible results
#' clean ("test.pdf")  # Create a minimal script to compute test.pdf
#' }
#' @rdname clean
clean <- function(result = "Name of desired result",
                   tidy = TRUE){
    ## Get provenance for script
    ## Check if the provenance is in memory
    if ("prov.json" %in% names(options())){
        return (clean.prov (options()$prov.json, substitute(result), tidy, isFile = FALSE))
    }
    else {
        stop("No provenance loaded. Please assign W3C PROV-JSON to options (i.e. options(prov.json = PROV.JSON))")
    }
}

