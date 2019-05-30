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


#'get.libs --- Determine the libraries needed for a given script. 
#'
#' Uses code dependency inforrmation to produce a set of necessary libraries.
#' 
#'@param src Character vector containing the source script.
#'@return The libraries used for each step of the script.
#'@importFrom CodeDepends getInputs
#'@importFrom methods slot
#'@export get.libs
#'@author Matthew K. Lau

get.libs <- function(src){
    cd <- getInputs(src)
    lib <- unlist(lapply(cd, slot, name = "libraries"))
    lib <- unique(lib)
    lib.fun <- lapply(lib, function(x) 
        ls(pos = paste0("package:", x)))
    names(lib.fun) <- lib
    step.fun <- lapply(cd, slot, name = "functions")
    step.fun <- lapply(step.fun, names)
    step.lib <- step.fun
    for (i in 1:length(step.fun)){
        if (length(step.fun[[i]]) > 0){
            for (j in 1:length(step.fun[[i]])){
                if (step.fun[[i]][[j]] %in% unlist(lib.fun)){
                    for (k in 1:length(lib.fun)){
                        if (step.fun[[i]][[j]] %in% lib.fun[[k]]){
                            step.lib[[i]][[j]] <- names(lib.fun)[k]
                        }else{}
                    }
                }else{
                    step.lib[[i]][[j]] <- NA
                }
            }
        }else{step.lib[[i]] <- NA}
    }
    out <- unique(unlist(step.lib))
    out <- out[!(is.na(out))]
    return(out)
}
