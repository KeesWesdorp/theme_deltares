test_that("check single plot", {
  mtcars2 <- within(mtcars, {
       vs <- factor(vs, labels = c("V-shaped", "Straight"))
       am <- factor(am, labels = c("Automatic", "Manual"))
       cyl  <- factor(cyl)
       gear <- factor(gear)
     })



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

    expect_error(p1 + theme_deltares(), NA) # expect no errors when changing theme

     p2 <- p1 + ggplot2::facet_grid(vs ~ am)
     expect_error(p2 + theme_deltares(), NA) # expect no errors when changin theme
})

