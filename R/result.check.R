#' .result.check --- Check that the results exist.
#' OUTPUT = Warning with a list of result names if
#' any results do not exist.
#' 
#' Check that the results exist.
#' 
#' @param script Script file path
#' @param result.list A vector or list of result file names.
#' @return Warning with list of results that do not exist in the script
#' @author Matthew K. Lau

.result.check <- function(script, result.list){
    s <- paste(readLines(script),collapse = " ")
    mr <- result.list[!sapply(result.list,grepl, x = s)]
    if (length(mr) != 0){
        mr.out <- paste(mr[-length(mr)], collapse = ", ")
        mr.out <- paste(mr.out,mr[length(mr)], sep = " and ")
        warning(paste("",mr.out,"were not found in",script))
    }else{print('Results checked.')}
}
