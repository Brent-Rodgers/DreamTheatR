
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DreamTheatR

<!-- badges: start -->
<!-- badges: end -->

R color palettes inspired by Dream Theater album artwork.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Brent-Rodgers/DreamTheatR")
```

## Usage

``` r
library(DreamTheatR)

# See all palettes
names(dt_palettes)
#> [1] "DramaticTurn1"   "Falling1"        "Images1"         "SixDegrees1"    
#> [5] "ViewFromTheTop1"
```

## Palettes

### Images and Words (1992)

``` r
dt_palette("Images1")
```

<img src="man/figures/README-images-1.png" width="100%" />

### Falling Into Infinity (1997)

``` r
dt_palette("Falling1")
```

<img src="man/figures/README-falling-1.png" width="100%" />

### Six Degrees of Inner Turbulence (2002)

``` r
dt_palette("SixDegrees1")
```

<img src="man/figures/README-sixdegrees-1.png" width="100%" />

### A Dramatic Turn of Events (2011)

``` r
dt_palette("DramaticTurn1")
```

<img src="man/figures/README-dramaticturn-1.png" width="100%" />

``` r
pal <- dt_palette("DramaticTurn1", 21, type = "continuous")
image(volcano, col = pal)
```

<img src="man/figures/README-volcano-1.png" width="100%" />

### A View from the Top of the World (2021)

``` r
dt_palette("ViewFromTheTop1")
```

<img src="man/figures/README-viewfromthetop-1.png" width="100%" />

## Other Stuff

-   Heavily inspired by [Karthik Ram’s `wesanderson`
    package](https://github.com/karthik/wesanderson) and [@ewenme’s
    `ghibli` packge](https://github.com/ewenme/ghibli)