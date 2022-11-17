#' Deltares plot theme package
#'
#'
#' @param base_size base font size, given in pts.
#' @param base_family base font family
#' @param base_line_size base size for line elements
#' @param base_rect_size base size for rect elements
#'
#'
#'
#' @export
#'
#' @examples
#' mtcars2 <- within(mtcars, {
#'   vs <- factor(vs, labels = c("V-shaped", "Straight"))
#'   am <- factor(am, labels = c("Automatic", "Manual"))
#'   cyl  <- factor(cyl)
#'   gear <- factor(gear)
#' })
#'
#'
#'
#' p1 <- ggplot2::ggplot(mtcars2) +
#'  ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = gear)) +
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
#' p1 + theme_deltares() # the default
#'
#' p2 <- p1 + ggplot2::facet_grid(vs ~ am)
#' p2 + theme_deltares()
theme_deltares <- function(base_size = 11, base_family = "",
                           base_line_size = base_size / 22,
                           base_rect_size = base_size / 22) {

  # The half-line (base-fontsize / 2) sets up the basic vertical
  # rhythm of the theme. Most margins will be set to this value.
  # However, when we work with relative sizes, we may want to multiply
  # `half_line` with the appropriate relative size. This applies in
  # particular for axis tick sizes. And also, for axis ticks and
  # axis titles, `half_size` is too large a distance, and we use `half_size/2`
  # instead.
  half_line <- base_size / 2

  t <- ggplot2::theme_bw(
                    base_size = base_size,
                    base_family = base_family,
                    base_line_size = base_line_size,
                    base_rect_size = base_rect_size
                  ) +
                  ggplot2::theme(

      axis.ticks       = ggplot2::element_blank(),
      # NB: match the *visual* thickness of axis ticks to the panel border
      #     0.5 clipped looks like 0.25

      # pure black panel border and grid lines, but thinner
      panel.background = ggplot2::element_rect(fill = "white", colour = NA),
      panel.border     = ggplot2::element_blank(),
      panel.grid       = ggplot2::element_line(colour = "lightgrey"),
      panel.grid.major = ggplot2::element_line(colour = "lightgrey", linewidth = ggplot2::rel(0.1)),
      panel.grid.minor = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(ggplot2::rel(0.5), "line"),
      # strips with blank background and white text
      strip.background = ggplot2::element_blank(),
      strip.text       = ggplot2::element_text(
        colour = "black",
        size = ggplot2::rel(1),
        margin = ggplot2::margin(0.8 * half_line, 0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
      ),
      legend.key       = ggplot2::element_blank(),
      legend.background = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(size = ggplot2::rel(1.2)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(1)),
      axis.title = ggplot2::element_text(size = ggplot2::rel(1.2)),

      complete = TRUE
    )
}




