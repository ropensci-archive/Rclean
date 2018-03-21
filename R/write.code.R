#' write.code --- Write code to disk.
#' OUTPUT = Writes out code from an object to a specified file. 
#' 
#' This is a simple function for writing code to disk.
#' 
#' @param x Script object to write.
#' @param file Path to where you want to write. Default writes to clipboard.
#' @return The script is written to disk, line by line.
#' @importFrom utils sessionInfo
#' @export write.code
#' @author Matthew K. Lau
#' @examples
#' \dontrun{
#'  data(prov_json)
#'  options(prov.json = prov_json)
#'  clean.code <- clean(x)
#'  write.code(clean.code) # copies to clipboard by default
#' }


write.code <- function(x, file = NULL){
    if (is.null(file)){
        ## Copy to clipboard depending on the system
        sys <- c(Sys.info()[[1]], sessionInfo()[[4]])
        if (grepl("Darwin", sys[1]) | grepl("macOS", sys[2])){
            ## Mac
            fileConn <- pipe("pbcopy", "w")
        }else if (grepl("Linux", sys[1])){
            ## Linux 
            fileConn <- pipe("xclip -i", "w")
        }else{
            ## Windows 
            fileConn <- file("clipboard-128")
        }
    }else{
        file.create(file)
        fileConn <- file(file)
    }
        writeLines(x, fileConn)
        close(fileConn)
}
