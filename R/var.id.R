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

#'var.id --- Generate unique identifiers for variables.
#'
#' Uses the order in which variables are created to assign unique identifiers.
#' 
#'@param x A data frmae containing "step", "used" by, "defined" by and "var" (i.e. variable) information.
#'@param sep Text separator for the identification tags.
#'@return A vector of unique identifiers based on the order of creation in the script. 
#'@author Matthew K. Lau

var.id <- function(x, sep = "_"){
  uid <- paste(x[, "var"], cumsum(x[, "defined"]), sep = sep)
  uid.l <- list()
                                        # create uids
  for (i in 1:sum(x[, "defined"])){
    uid.l[[i]] <- x
  }
  for (i in 1:length(uid.l)){
    y <- uid.l[[i]]
    y[cumsum(y[, "defined"]) != i, "used"] = FALSE
    y[cumsum(y[, "defined"]) != i, "defined"] = FALSE
    y[, "var"] <- paste(y[, "var"], i, sep = sep)
    uid.l[[i]] <- y
  }
  return(do.call(rbind, uid.l))
}

