test_that("all palettes can be built and printed", {
  # Set pdf(NULL) to prevent creation of Rplots.pdf when generating plots in
  # non-interactive session
  pdf(NULL)

  all_palettes <- names(dt_palettes)

  expect_able_to_print_palette <- function(pal) {
    expect_no_error(
      print(dt_palette(pal))
    )
  }

  lapply(all_palettes, expect_able_to_print_palette)
})

test_that("dt_palette fails with error when passed non-existent palette name", {
  expect_error(
    dt_palette("Majesty1"),
    "Palette not found."
  )
})

test_that("dt_palette fails with error when requesting more discrete colors than
          are available", {
  expect_error(
    dt_palette("DramaticTurn1", n = 8, type = "discrete"),
    "Number of requested colors greater than what palette can offer"
  )
})
