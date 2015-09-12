padded_file_name <- function(n) {
    c <- as.character(n)
    len_c <- nchar(c)
    padded <- paste(paste(rep("0", 3 - len_c), collapse=""), c, sep="")
    paste(padded, ".csv", sep="")
}

full_paths <- function(directory, ids) {
    sapply(ids, function(id) { paste(directory, padded_file_name(id), sep="/") })
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

pollutantmean <- function(directory, pollutant, id = 1:332) {
    file_names <- full_paths(directory, id)
    data_frame <- as_data_frame(file_names)
    if (pollutant == "nitrate") {
        nitrate(data_frame)
    } else if (pollutant == "sulfate") {
        sulfate(data_frame)
    } else {
        NA
    }
}
