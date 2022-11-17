
# color hexcode lookup table
lookup_table <- dplyr::tribble(
  ~color, ~hexcode,
  'zwart', '#000000',
  'blauw1', '#080c80',
  'blauw2', '#0d38e0',
  'blauw3', '#0ebbf0',
  'groen1', '#00b389',
  'groen2', '#00cc96',
  'groen3', '#00e6a1',
  'grijs1', '#f2f2f2',
  'grijs2', '#e6e6e6',
  'geel', '#ffd814',
  'academy', '#ff960d',
)

# overview of color combinations
DeltaresDefault   <- dplyr::tribble(~color, 'blauw1', 'blauw2', 'blauw3', 'groen1', 'groen2', 'groen3')
DeltaresFull      <- dplyr::tribble(~color, 'blauw1', 'blauw2', 'blauw3', 'groen1', 'groen2', 'groen3', 'academy', 'geel', 'grijs2', 'zwart')
DeltaresBlues     <- dplyr::tribble(~color, 'blauw1', 'blauw2', 'blauw3')
DeltaresBlues_r   <- dplyr::tribble(~color, 'blauw3', 'blauw2', 'blauw1')
DeltaresGreens    <- dplyr::tribble(~color, 'groen1', 'groen2', 'groen3')
DeltaresGreens_r  <- dplyr::tribble(~color, 'groen3', 'groen2', 'groen1')
DeltaresOranges   <- dplyr::tribble(~color, 'academy', 'geel', 'grijs2')
DeltaresOranges_r <- dplyr::tribble(~color, 'grijs2', 'geel', 'academy')

colorlist <- c("DeltaresDefault", "DeltaresFull", "DeltaresBlues", "DeltaresBlues_r",
                "DeltaresGreens", "DeltaresGreens_r", "DeltaresOranges", "DeltaresOranges_r")

#' Deltares colorscheme generator
#'
#'
#' @param palette Indicates the type of palette. Can be either "diverging" or "sequential". Default is "diverging", which will use distinct Deltares colors based on the colorscheme you've provided.
#' Set this parameter to "sequential" to generate a a sequential scheme based on one of the Deltares colors.
#' You can define the starting color with the parameter color and you can choose to go to either white or black by setting the parameter shade to "light" or "black" respectively.
#' @param colorscheme Deltares divering color schemes. Default is "DeltaresDefault" (n = 6).
#' Available schemes are: "DeltaresDefault" (n=6), "DeltaresFull" (n=10), "DeltaresBlues" (n=3), "DeltaresBlues_r" (n=3),
#'  "DeltaresGreens" (n=3), "DeltaresGreens_r" (n=3), "DeltaresOranges" (n=3), "DeltaresOranges_r" (n=3).
#' @param color The color that is used when palette is set to "sequential. Default is "blauw1". A full list of color choices and their hexcodes is available on https://github.com/KeesWesdorp/theme_deltares
#' Will create a color scheme with this color to either white or black, depending on your choice with the parameter shade.
#' @param shade Parameter that is used when palette is set to "sequential. Can be either "light" or "dark". Default is "light".
#' Will create a color scheme to either "white"(#FFFFFF) if you set this to "light" or "black" (#000000) if you set it to "dark"
#' @param ncolors Number of colors that are generated when palette is "sequential". Default is 3.
#'
#' @return A character vector.
#'
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
#'
#'
#'
#' deltares_colors() # default color scheme with 6 Deltares colours
#' deltares_colors(colorscheme = "DeltaresFull") # all Deltares colours (n = 10)
#' deltares_colors(palette = "sequential", ncolors = 10) # creates sequential color scheme with 10 colors starting with default color "blauw1" (#080c80) all the way to white (#FFFFFF)
#' deltares_colors(palette = "sequential", color = "blauw3", shade = "dark", ncolors = 8)  # creates sequential scheme from blauw3(#0ebbf0) to black (#000000)
#'
#' # Use with ggplot:
#'
#' # create dataset
#' mtcars2 <- within(mtcars, {
#'   vs <- factor(vs, labels = c("V-shaped", "Straight"))
#'   am <- factor(am, labels = c("Automatic", "Manual"))
#'   cyl  <- factor(cyl)
#'   carb <- factor(carb)
#' })
#'
#' # create ggplot
#'  p1 <- ggplot2::ggplot(mtcars2) +
#'  ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = carb)) +
#'   ggplot2::labs(
#'     title = "Fuel economy declines as weight increases",
#'     subtitle = "(1973-74)",
#'     caption = "Data from the 1974 Motor Trend US magazine.",
#'     tag = "Figure 1",
#'     x = "Weight (1000 lbs)",
#'     y = "Fuel economy (mpg)",
#'     colour = "Gears"
#'   )
#'
#' p1 + ggplot2::scale_colour_manual(values=c(deltares_colors())) # the default Deltares colourscheme
#'
deltares_colors <- function(palette = "diverging", colorscheme = "DeltaresDefault", color = "blauw1",
                            shade = "light", ncolors = 3) {

  #error check
  stopifnot("Colorscheme must be a character"= is.character(colorscheme),
            "Colorscheme can only be a character of length 1" = length(colorscheme) <= 1,
            'palette must be either "diverging" or "sequential"' = palette %in% c("diverging", "sequential"),
            'shade must be either "light" or "dark"' = shade %in% c("light", "dark"),
            "color not defined in Deltares colorschemes, choices are: blauw1, blauw2, blauw3, groen1, groen2, groen3, academy, geel, grijs2, zwart" = color %in% c(lookup_table$color),
            "ncolors must be a numeric" = is.numeric(ncolors), "ncolors can only be a number of length 1"= length(ncolors) <= 1
            )
  # create colorpalette
  cp <- NULL

  if (palette == "diverging") {
    if (colorscheme %in% colorlist) {
      cp <- dplyr::left_join(eval(parse(text = colorscheme)), lookup_table, by = "color") %>%
        dplyr::pull("hexcode")

    } else {stop('Colorscheme not defined in Deltares colorpalette, choices are:
  "DeltaresDefault", "DeltaresFull", "DeltaresBlues", "DeltaresBlues_r",
  "DeltaresGreens", "DeltaresGreens_r", "DeltaresOranges", "DeltaresOranges_r"')}
  }
  else {
    color <- as.character(lookup_table[lookup_table$color == color, "hexcode"])

    if (shade == "light") {

      cp <- grDevices::colorRampPalette(c(color, "#FFFFFF"))(ncolors)
    }
    else {
      cp <- grDevices::colorRampPalette(c(color, "#000000"))(ncolors)
    }
  }
  cp
}
