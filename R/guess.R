#' get the labels for a microtitre plate based on the length of the vector.
#'
#' @param wells vector of wells
#' @param n number of wells
#'
#' @export
well_labels_from_length <- function(wells = NULL, n = NULL) {
    if (!is.null(wells) & is.null(n)) {
        n <- length(wells)
    }
    dims <- guess_dims_from_n(n)
    well_labels <- well_labels(nrow = dims$nrow, ncol = dims$ncol)
    well_labels
}

#' guess the dimensions of microtitre plate from the number of wells.
#'
#' @param n `<num>` number of wells
#'
#' @return
#' [list()] of length 2: number of rows (`nrow`) and columns (`ncol`).
#'
#' @keywords internal
guess_dims_from_n <- function(n) {
    dims <- switch(as.character(n),
                   '6'    = c(2L, 3L),
                   '12'   = c(3L, 4L),
                   '24'   = c(4L, 6L),
                   '48'   = c(6L, 8L),
                   '96'   = c(8L, 12L),
                   '100'  = c(10L, 10L),
                   '384'  = c(16L, 24L),
                   '1536' = c(32L, 48L))
    list(nrow = dims[1], ncol = dims[2])
}

