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


#'rmd2chunks --- Isolates the code chunks from an R markdown documents.
#'
#' To facilitate code cleaning, this function permits users to isolate
#' the code chunks from an R markdown formatted notebook.
#' 
#'@param x A character of code from an R markdown notebook.
#'@param comment The string to be used to comment markdown syntax.
#'@param rm.markdown LOGICAL: should markdown syntax be removed?
#'@return A character vector consisting of the code chunks isolated from the R markdown notebook code.
#'@seealso write.code
#'@export rmd2chunks
#'@author Matthew K. Lau

rmd2chunks <- function(x, comment = "## RMD ##", rm.markdown = FALSE){
    ## the truffle shuffle to isolate chunks
                                        # find the yml header
    yml <- grep("---", x)
                                        # comment yaml header
    x[yml[1]:yml[2]] <- paste(comment, x[yml[1]:yml[2]])
                                        # get chunk locations
    chunk <- grep("\\`\\`\\`", x)
    chunk.head <- grep("\\`\\`\\`\\{r", x)
    chunk.tail <- chunk[!(chunk %in% chunk.head)]
                                        # check chunks
    length(chunk.head) == length(chunk.tail)
                                        # comment chunk head-tail
    x[chunk] <- paste0(comment, x[chunk])
                                        # isolate chunks
    out <- x[chunk.head[1]:chunk.tail[1]]
    for (i in 2:length(chunk.head)){
        out <- append(out, x[chunk.head[i]:chunk.tail[i]])
    }
    if (rm.markdown){
        out <- out[!grepl(paste0("^", comment), x)]
    }
    return(out)
}
