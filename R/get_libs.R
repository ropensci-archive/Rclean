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


#'get_libs --- Determine the libraries needed for a given script. 
#'
#' Uses code dependency information to produce a set of necessary
#' libraries.
#' 
#'@param src Character vector containing the source script.
#'@return The libraries used for each step of the script.
#'@importFrom CodeDepends getInputs
#'@importFrom methods slot
#'@export get_libs
#'@author Matthew K. Lau

get_libs <- function(src){
  cd <- getInputs(src)
  libs <- unlist(lapply(cd, slot, name = "libraries"))
  out <- unique(libs)
  return(out)
}
