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
# along with Rclean; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# Contact: Matthew Lau <matthewklau@fas.harvard.edu>

#' keep --- Copy code to clipboard or write a specified file.
#' OUTPUT = Copies code to the clipboard or writes out code from an
#' object to a specified file.
#' 
#' Simplifies writing and copying code to clipboard by removing the
#' need to separately create and specify a file connection or to send
#' code to the clipboard.
#' 
#' @param x Line(s) of code.
#' @param file Path to write code. If not specified, code is copied to
#'     the clipboard.
#' @return The code is copied to the clipboard or written to disk.
#' @importFrom utils sessionInfo
#' @export keep
#' @importFrom clipr write_clip
#' @author Matthew K. Lau
#' @examples
#' \dontrun{
#' script <- system.file(
#'         "example", 
#'         "simple_script.R", 
#'         package = "Rclean")
#' clean.code <- clean(script, “tab.15”)
#' ## Copies code to your clipboard
#' keep(clean.code)
#' ## Saves code to your disk
#' keep(clean.code, file = "clean_code.R")
#' }


keep <- function(x, file = NULL) {
    if (is.null(file)) {
        write_clip(x)
    } else {
        file.create(file)
        fileConn <- file(file)
        writeLines(x, fileConn)
        close(fileConn)
    }
}
