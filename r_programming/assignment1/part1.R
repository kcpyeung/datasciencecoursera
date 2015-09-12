full_paths <- function(directory, ids) {
    sapply(ids, function(id) { paste(directory, id, sep="/") })
}


