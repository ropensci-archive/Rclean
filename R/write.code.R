#' write.code --- Write code to disk.
#' OUTPUT = Writes out code from an object to a specified file. 
#' 
#' This is a simple function for writing code to disk.
#' 
#' @param x Script object to write.
#' @param file Path to where you want to write.
#' @return The script is written to disk, line by line.
#' @export write.code
#' @author Matthew K. Lau

write.code <- function(x,file = NULL){
    if (is.null(file)){
        file <- getwd()
    }else{
        file.create(file)
        fileConn <- file(file)
        writeLines(x, fileConn)
        close(fileConn)
        file.show(file)
    }
}
