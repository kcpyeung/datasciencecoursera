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

corr <- function(directory, threshold = 0) {
    id_to_paths <- as_id_paths(directory, 1:332)
    correlations <- c()
    for (id_path in id_to_paths) {
        df <- read.csv(id_path[2])
        no_na_df <- remove_all_na(df)
        rows <- nrow(no_na_df)
        if (rows >= threshold) {
            cr <- cor(no_na_df["sulfate"], no_na_df["nitrate"])
            correlations <- append(correlations, cr)
        }
    }
    correlations
}