
<!-- README.md is generated from README.Rmd. Please edit that file -->

# themedeltares

<!-- badges: start -->
<!-- badges: end -->

The goal of themedeltares is to add a new custom theme for ggplots in R.
The theme is based on the Deltares corporate identity, including style
and colours.

## Installation

You can install the development version of themedeltares from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KeesWesdorp/theme_deltares")
```

## Example

This is a basic example which shows you how to add the theme to your
plots. First we will obtain some sample data and create a standard
ggplot.

``` r
library(themedeltares)

# obtaining some sample data
mtcars2 <- within(mtcars, {
   vs <- factor(vs, labels = c("V-shaped", "Straight"))
   am <- factor(am, labels = c("Automatic", "Manual"))
   cyl  <- factor(cyl)
   gear <- factor(gear)
 })


# creating a ggplot
 p1 <- ggplot2::ggplot(mtcars2) +
  ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = gear)) +
   ggplot2::labs(
     title = "Fuel economy declines as weight increases",
     subtitle = "(1973-74)",
     caption = "Data from the 1974 Motor Trend US magazine.",
     tag = "Figure 1",
     x = "Weight (1000 lbs)",
     y = "Fuel economy (mpg)",
     colour = "Gears"
   )

# Adding the deltares theme
 p1 + theme_deltares() # the default
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

# adding the deltares theme when faceting
 p2 <- p1 + ggplot2::facet_grid(vs ~ am)
 p2 + theme_deltares()
```

<img src="man/figures/README-example-2.png" width="100%" />
