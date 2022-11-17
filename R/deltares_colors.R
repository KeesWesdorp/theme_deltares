
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

deltares_colors <- function(colorscheme, ncolors, pallete = "diverging") {
  stopifnot("Colorscheme must be a character"= is.character(colorscheme), "Colorscheme can only be a character of length 1"= length(colorscheme) <= 1)
  if (colorscheme %in% colorlist) {
    cp <- dplyr::left_join(eval(parse(text = colorscheme)), lookup_table, by = "color") %>%
      dplyr::pull(hexcode)

  } else {stop('Colorscheme not defined in Deltares colorpalette, choices are:
  "DeltaresDefault", "DeltaresFull", "DeltaresBlues", "DeltaresBlues_r",
  "DeltaresGreens", "DeltaresGreens_r", "DeltaresOranges", "DeltaresOranges_r"')}

}

