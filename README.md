
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mtputils

<!-- badges: start -->

<!-- badges: end -->

The goal of mtputils is to …

## Installation

You can install the released version of mtputils from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("mtputils") # not yet
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mtputils)
# ?row_labels
row_labels()
#> character(0)
row_labels(rows = 3)
#> [1] "C"
row_labels(n = 3) # same as row_labels(n = 1:3)
#> [1] "A" "B" "C"
row_labels(rows = 3, n = 12)
#> [1] "C"

# ?col_labels
col_labels()
#> character(0)
col_labels(cols = 3)
#> [1] "3"
col_labels(n = 3) # same as col_labels(n = 1:3)
#> [1] "1" "2" "3"
col_labels(cols = 3, n = 12)
#> [1] "3"
```

``` r
well_labels(nrow = 8, ncol = 12)
#>  [1] "A01" "A02" "A03" "A04" "A05" "A06" "A07" "A08" "A09" "A10" "A11"
#> [12] "A12" "B01" "B02" "B03" "B04" "B05" "B06" "B07" "B08" "B09" "B10"
#> [23] "B11" "B12" "C01" "C02" "C03" "C04" "C05" "C06" "C07" "C08" "C09"
#> [34] "C10" "C11" "C12" "D01" "D02" "D03" "D04" "D05" "D06" "D07" "D08"
#> [45] "D09" "D10" "D11" "D12" "E01" "E02" "E03" "E04" "E05" "E06" "E07"
#> [56] "E08" "E09" "E10" "E11" "E12" "F01" "F02" "F03" "F04" "F05" "F06"
#> [67] "F07" "F08" "F09" "F10" "F11" "F12" "G01" "G02" "G03" "G04" "G05"
#> [78] "G06" "G07" "G08" "G09" "G10" "G11" "G12" "H01" "H02" "H03" "H04"
#> [89] "H05" "H06" "H07" "H08" "H09" "H10" "H11" "H12"
```
