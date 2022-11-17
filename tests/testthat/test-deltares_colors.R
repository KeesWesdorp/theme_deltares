#test expectations

# diverging
test_that("generating default deltares scheme", {
  expect_equal(deltares_colors(), c("#080c80", "#0d38e0", "#0ebbf0", "#00b389", "#00cc96", "#00e6a1"))
})

test_that("generating deltares full color scheme", {
  expect_equal(deltares_colors(colorscheme = "DeltaresFull"), c("#080c80", "#0d38e0", "#0ebbf0", "#00b389", "#00cc96", "#00e6a1", "#ff960d", "#ffd814", "#e6e6e6", "#000000"))
})

# sequential
test_that("checking number of colors in sequential color scheme generator", {
  expect_equal(deltares_colors(palette = "sequential", color = "blauw1", shade = "dark", ncolors = 8),c("#080C80", "#060A6D", "#05085B", "#040649", "#030536", "#020324", "#010112", "#000000"))
})

test_that("checking number of colors in sequential color scheme generator", {
  expect_equal(length(deltares_colors(palette = "sequential", color = "blauw3", shade = "dark", ncolors = 8)),8)
})

test_that("checking number of colors in sequential color scheme generator, with defaul shade", {
  expect_equal(length(deltares_colors(palette = "sequential", color = "blauw3", ncolors = 8)),8)
})

test_that("checking number of colors in sequential color scheme generator, with default shade & color", {
  expect_equal(length(deltares_colors(palette = "sequential", ncolors = 30)),30)
})

# test errors
test_that("checking multiple arguments in colorscheme", {
  expect_error(deltares_colors(colorscheme = c("la", "die")))
})

test_that("checking a different argument for palette", {
  expect_error(deltares_colors(palette = "la"))
})

test_that("checking a different argument for shade", {
  expect_error(deltares_colors(shade = "la"))
})

test_that("checking a different argument for color", {
  expect_error(deltares_colors(color = "la"))
})

test_that("checking a different argument for ncolors", {
  expect_error(deltares_colors(ncolor = "la"))
})

test_that("checking a different argument for ncolors", {
  expect_error(deltares_colors(ncolor = c(1, 3)))
})
