#' cleanR --- Produce "clean" code.
#' OUTPUT = The essential code needed to produce a result.
#' 
#' Produces simplifed, "cleaned" code that is needed to create a result.
#' @param x Script object to write.
#' @param file Path to where you want to write.
#' @return 
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
