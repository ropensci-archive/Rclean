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


#' write.code --- Write code to disk.
#' OUTPUT = Writes out code from an object to a specified file. 
#' 
#' This is a simple function for writing code to disk.
#' 
#' @param x Line(s) of code.
#' @param file Path to write code. If not specified, code is copied to
#'     the clipboard.
#' @return The code is copied to the clipboard or written to disk.
#' @importFrom utils sessionInfo
#' @export write.code
#' @importFrom clipr write_clip
#' @author Matthew K. Lau
#' @examples
#'  data(prov_json)
#'  options(prov.json = prov_json)
#'  some.code <- c("x <- 1", "y <- x + 1")
#'  write.code(some.code) # copies to clipboard by default

write.code <- function(x, file = NULL){
    if (is.null(file)){
        write_clip(x)
    }else{
        file.create(file)
        fileConn <- file(file)
        writeLines(x, fileConn)
        close(fileConn)
    }
}
