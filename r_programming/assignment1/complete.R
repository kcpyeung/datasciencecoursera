padded_file_name <- function(n) {
    c <- as.character(n)
    len_c <- nchar(c)
    padded <- paste(paste(rep("0", 3 - len_c), collapse=""), c, sep="")
    paste(padded, ".csv", sep="")
}

as_id_paths <- function(directory, ids) {
    lapply(ids, function(id) { matrix(c(id, paste(directory, padded_file_name(id), sep="/")), 1, 2) })
}

remove_all_na <- function(df) {
    subset(df, !is.na(df["sulfate"]) & !is.na(df["nitrate"]))
}

complete <- function(directory, id = 1:332) {
    id_to_paths <- as_id_paths(directory, id)
    count_to_file <- data.frame()
    for (id_path in id_to_paths) {
        df <- read.csv(id_path[2])
        no_na_df <- remove_all_na(df)
        rows <- nrow(no_na_df)
        count_to_file <- rbind(count_to_file, data.frame(id=id_path[1], nobs=rows))
    }
    print(count_to_file)
}