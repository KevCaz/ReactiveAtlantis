#' Internals 
#' @noRd

get_asset  <- function(filename) {
    do.call(paste, list(readLines(system.file(
        file.path("assets", filename),
        package = "ReactiveAtlantis"
    )), collapse = "\n"))
}

