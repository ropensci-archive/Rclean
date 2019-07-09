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


#' .parse.info --- Parse node information from PROV-JSON.
#' OUTPUT = A matrix of node information.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param prov PROV-JSON formatted provenance.
#' @return A symmetric matrix of provenance entity relationships.
#' @author Matthew K. Lau
#' @export
#' @examples
#'  data(prov_json)
#'  prov <- jsonlite::fromJSON(prov_json)
#'  parse.info(prov)

parse.info <- function(prov){
    if (grepl("rdatatracker", prov[[1]][[2]]) | grepl("provR", prov[[1]][[2]])){
        activity <- prov['activity'][[1]][names(prov['activity'][[1]]) != "environment"]
        environment <- prov['activity'][[1]][names(prov['activity'][[1]]) == "environment"]
        entity <- prov['entity'][[1]]
        list(activity = do.call(rbind,activity),
             environment = environment,
             entity = do.call(rbind,entity))
    }else{
        warning("Unknown provenance: ",prov[[1]][[2]])
    }
}
