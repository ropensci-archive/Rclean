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
# along with Rclean; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>


#'get_libs --- Determine the libraries referenced in a given script. 
#'
#' 
#' 
#'@param file Path to the script. 
#'@return Returns the libraries referenced in the script.
#'@importFrom CodeDepends getInputs
#'@importFrom CodeDepends readScript
#'@importFrom methods slot
#'@export get_libs
#'@author Matthew K. Lau
#'@examples
#' script <- system.file(
#'         "example", 
#'         "long_script.R", 
#'         package = "Rclean")
#' get_libs(script)

get_libs <- function(file) {
    if (class(file) == "Script") {
        src <- file
    } else {
        src <- readScript(file)
    }
    cd <- getInputs(src)
    libs <- unlist(lapply(cd, slot, name = "libraries"))
    libs <- unique(libs)
    return(libs)
}
