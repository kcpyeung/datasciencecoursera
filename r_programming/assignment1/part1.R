full_paths <- function(directory, ids) {
    sapply(ids, function(id) { paste(directory, id, sep="/") })
}

as_data_frame <- function(files) {
    all_data_frames <- lapply(files, function(file) { read.csv(file) })
    Reduce(rbind, all_data_frames, data.frame())
}

remove_na <- function(df) {
    df[!is.na(df)]
}

sulfate <- function(df) {
    mean(remove_na(df["sulfate"]))
}

nitrate <- function(df) {
    mean(remove_na(df["nitrate"]))
}

