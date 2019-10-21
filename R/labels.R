#' well labels from dimensions of microtitre plate.
#'
#' @param nrow `<int>` number of rows
#' @param ncol `<int>` number of cols
#' @param rownames `<chr>` row names to use, defaults to `row_labels(n = nrow)`
#' @param colnames `<chr>` col names to use, defaults to `col_labels(n = ncol)`
#' @param col_nchar `<int>` the number of characters for the column section. This
#'     controls the left-padding of well labels with zeros. e.g. A1 vs. A01. The
#'     default is the number of characters in `ncol` for nice lexicographic
#'     sorting behaviour.
#' @param byrow `<lgl>` defaults to `"rowmajor"` [TRUE], `"colmajor"` use [FALSE]
#'
#' @return
#' `<chr>` vector of well labels where the row is represented by a letter,
#'  and the col is represented by an intenger, possibly left-padded with one
#'  or more zeros.
#'
#' @export
well_labels <- function(nrow, ncol, byrow = TRUE,
                        rownames = row_labels(n = nrow),
                        colnames = col_labels(n = ncol),
                        nchar_row = max(nchar(rownames)),
                        nchar_col = max(nchar(colnames))) {

    fmt <- paste0("%", nchar_row,"s", "%0", nchar_col, "s")

    stopifnot(length(rownames) == nrow)
    stopifnot(length(colnames) == ncol)

    if (byrow) {
        out <- sprintf(fmt, rep(rownames, each = ncol), rep.int(colnames, nrow))
    } else {
        out <- sprintf(fmt, rep.int(rownames, ncol), rep(colnames, each = nrow))
    }
    # hack fix for platform specific padding with zeros 'bug' with sprintf()
    gsub(' ', '0', out)

}



#' generate row labels for a micro titre plate
#'
#' Specify the row indices for which to get labels or the number of rows.
#'
#' @param rows <num> vector of row indices
#' @param n <int> number of rows in micro titre plate
#'
#' @examples
#'     row_labels(rows = 3)
#'     row_labels(n = 3L) # same as row_labels(rows = 1:3)
#'
#' @export
row_labels <- function(rows = NULL, n = NULL) {
    if (is.null(rows) & !is.null(n)) {
        rows <- seq_len(n)
    }
    # lbls <- c(LETTERS, paste0(LETTERS[1], LETTERS), paste0(LETTERS[2], LETTERS))
    lbls <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
              "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
              "Z", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ",
              "AK", "AL", "AM", "AN", "AO", "AP", "AQ", "AR", "AS", "AT", "AU",
              "AV", "AW", "AX", "AY", "AZ", "BA", "BB", "BC", "BD", "BE", "BF",
              "BG", "BH", "BI", "BJ", "BK", "BL", "BM", "BN", "BO", "BP", "BQ",
              "BR", "BS", "BT", "BU", "BV", "BW", "BX", "BY", "BZ")
    lbls[rows]
}

#' generate column labels for a micro titre plate
#'
#' Specify the col indices for which to get labels or the number of cols
#'
#' @param cols <num> vector of column indices
#' @param n <int> number of columns in micro titre plate
#'
#' @examples
#'     col_labels(cols = 3)
#'     col_labels(n = 3L) # same as col_labels(cols = 1:3)
#'
#' @export
col_labels <- function(cols = NULL, n = NULL) {
    if (is.null(cols) & !is.null(n)) {
        cols <- seq_len(n)
    }
    as.character(cols)
}

