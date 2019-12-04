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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>

#' get_vars --- Get the variables that are created in a script.
#'
#' Determining the variables that are created in a script is useful
#' for orienting code cleaning (i.e. refactoring) efforts.
#'
#' @param script File path to a script or a Script object from
#'     CodeDepends.
#' @return A list of variables from a given script.
#' @importFrom CodeDepends readScript
#' @importFrom CodeDepends getVariables
#' @export get_vars
#' @author Matthew K. Lau
#' @examples
#' script <- system.file(
#'         "example", 
#'         "simple_script.R", 
#'         package = "Rclean")
#' get_vars(script)

get_vars <- function(script){
    if (class(script) == "character"){
        src <- readScript(script[1])
    }else if (class(script) == "Script"){
        src <- script
    }else{
        stop("Error: Please provide a Script object or script file path.")
    }
    out <- unique(getVariables(src))
    return(out)
}

