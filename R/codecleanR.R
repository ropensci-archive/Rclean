#' codecleanR --- Produce "clean" code.
#' OUTPUT = A workspace containing a cleanced script and associated
#' data files.
#' 
#' Produces simplifed, "cleaned" code that generates
#' a set of output from an initial, "draft" script. 
#' 
#' @param script A source script.
#' @param result.list A vector or list of result file names.
#' @param workspace.name Name of the output "workspace".
#' @param clean.name Name of the cleaned code produced.
#' @param save.comments LOGICAL: should comments be preserved in cleaned code?
#' @return Workspace with the minimal code needed to produce the
#' specified results.
#' @author Matthew K. Lau
#' @examples
#' 
#' ### NOT RUN ###
#' 
#' 
#' @importFrom RDataTracker ddg.run
#' @export codecleanR

codecleanR <- function(script, 
                       result.list, 
                       workspace.name = "clean",
                       clean.name = "cleancode.R",
                       save.comments = FALSE){

    dir.create(workspace.name,show = FALSE)
    dir.create(paste0(workspace.name,"/data"),show = FALSE)
    dir.create(paste0(workspace.name,"/src"),show = FALSE)
### Load the original script
    raw <- readLines(script)
### Check that the results are contained in the script
    .result.check(script,result.list)
### Load provenance
    prov.loc <- paste0(workspace.name,"/.prov")
    ddg.run(script,ddgdir = prov.loc)
    prov <- .read.prov(paste0(prov.loc,"/ddg.json"))
### Analyse the graph for the requested output
### Find the set of line numbers required to produce the code
    info <- do.call(rbind,prov[["info"]][names(prov[["info"]]) != "environment"])
    info.loc <- rownames(info)[info[,1] %in% result.list]
### Get the code lines corresponding to the nodes  
    spines <- unique(unlist(sapply(info.loc,.get.spine,g = prov[["graph"]])))
    node.lines <- sort(as.numeric(unlist(info[grep('p',spines,value = TRUE),"rdt:startLine"])))
    if (save.comments){
        comments <- sapply(raw,gsub,pattern = " ",replace = "",USE.NAMES=FALSE)
        comments <- sapply(comments,substr,start = 1, stop = 1,USE.NAMES = FALSE)
        comments <- (1:length(raw))[grepl("\\#",comments)]
        code.lines <- sort(c(node.lines,comments))
    }else{code.lines <- sort(node.lines)}
    code <- raw[code.lines]

### Put sourced code into src folder


### Change paths to work with workspace directory structure

### Consider creating a README file

### Consider adding a GPL file

### Put dependency data into a data directory
    d.from <- (info[grep("d",spines,value = TRUE),"rdt:type"])
    d.from <- d.from[names(d.from) %in% 
                     rownames(prov[["graph"]])[apply(prov[["graph"]],1,sum) == 0]]
    d.from <- paste0(workspace.name,"/.prov/",d.from)
    d.to <- (info[grep("d",spines,value = TRUE),"rdt:name"])
    d.to <- d.to[names(d.to) %in% 
                 rownames(prov[["graph"]])[apply(prov[["graph"]],1,sum) == 0]]
    dep.files <- d.to
    d.to <- paste0(workspace.name,"/data/",d.to)
    apply(cbind(d.from,d.to),1,function(x) 
        file.copy(x[1],x[2],
           overwrite = TRUE,copy.date = TRUE))
### Create dependency file
    libs <- raw[sort(
        c(grep("library\\(",raw),
          grep("require\\(",raw)))]
    srcs <- dir(paste0(workspace.name,"/.prov/scripts"))
    srcs <- srcs[srcs != script]
    srcs <- sapply(srcs,function(x) 
        paste0("source('src/",x,"')"),
                   USE.NAMES = FALSE)
    dep.code <- c(libs,srcs)
    if (length(dep.code) > 0){
        out.file <- paste0(workspace.name,"/src/","depends.R")
        file.create(out.file)
        fileConn <- file(out.file)
        writeLines(dep.code, fileConn)
        close(fileConn)
        file.show(out.file)
    }
### Copy sources
    cp.src <- dir(paste0(workspace.name,"/.prov/scripts"),full = TRUE)
    cp.src <- cp.src[!grepl(script,cp.src)]
    sapply(cp.src,file.copy,to = paste0(workspace.name,"/src"),
           overwrite = TRUE,copy.date = TRUE)
### Add header
    code.header <- gsub("\\\\","",
                        paste("\\# This code creates output:",
                              paste(result.list,collapse = " ")))
    code.header <- c(code.header,
                     gsub("\\\\","",
                          paste("\\# codecleanR",date())))
    code <- c(code.header,code)
### Add source dependencies and data

####### This needs to be generalized to renamce multiples

    dep.path <- sapply(d.to,gsub,
                     pattern = "clean/",
                     replacement = "",USE.NAMES = FALSE)
    dep.files
    grep(dep.files[1],code)
    gsub(paste0("\"*",dep.files[1]),dep.files[1],code[1])

    paste(strsplit(code[1],split = "\"*\"")[[1]][!grepl(dep.files[1],
                 strsplit(code[1],split = "\"*\"")[[1]])],
          collapse = paste0("\"/data/",dep.files[[1]][1],"\""))

### Write out code
    out.file <- paste0(workspace.name,"/src/",clean.name)
    file.create(out.file)
    fileConn <- file(out.file)
    writeLines(code, fileConn)
    close(fileConn)
    file.show(out.file)


}
