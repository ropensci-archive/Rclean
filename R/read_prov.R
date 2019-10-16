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

#' read_prov --- Read and parse provenance from a JSON file.
#' OUTPUT = Returns a dataframe containing the provenance.
#' 
#' This is an internal function for reading PROV-JSON formatted
#' provenance.
#' 
#' @param file JSON formatted object or path to PROV-JSON formatted file.
#' @return A list containing the provenance.
#' @author Matthew K. Lau
#' @importFrom jsonlite fromJSON
#' @export read_prov
#' @examples
#'  data(prov_json)
#'  prov <- read_prov(prov_json)
#'  prov$graph
#'  prov$info$activity
#'  prov$info$environment
#'  prov$info$entity

read_prov <- function(file){
    prov <- fromJSON(file)
    g <- parse.graph(prov)
    info <- parse.info(prov)
    list(graph = g, info = info)
}

