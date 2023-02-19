#' Complete list of palettes
#'
#' Use \code{\link{dt_palette}} to construct palettes of desired length.
#'
#' @export
dt_palettes <- list(
  DramaticTurn1 = c(
    "#0743A4",
    "#1256B7",
    "#3F96E5",
    "#91D8F2",
    "#F9E36B",
    "#EAB949",
    "#A43644"
  ),
  Falling1 = c(
    "#242E40",
    "#3B4A6D",
    "#405286",
    "#4C64A0",
    "#5B70A6",
    "#7F8BBD",
    "#BCA2B3"
  ),
  Images1 = c(
    "#A81A17",
    "#E59071",
    "#FDF7A1",
    "#E9B659",
    "#909991",
    "#585C7D",
    "#09090D"
  ),
  SixDegrees1 = c(
    "#070508",
    "#646A50",
    "#98D1AF",
    "#FDF2B4",
    "#FACE84",
    "#EE775A",
    "#C62D2C"
  ),
  ViewFromTheTop1 = c(
    "#3E5C91",
    "#74ABDE",
    "#485F2A",
    "#5D4C43",
    "#797673",
    "#A3A6B9",
    "#C7E8F5"
  )
)


#' A Dream Theater palette generator
#'
#' These are a handful of color palettes inspired by Dream Theater album artwork
#'
#' @param n Number of colors desired. If omitted, uses all colors.
#' @param name Name of desired palette. Choices are:
#'   \code{DramaticTurn1}, \code{Falling1},  \code{Images1},
#'   \code{SixDegrees1}, \code{ViewFromTheTop1}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colors.
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' dt_palette("DramaticTurn1")
#' dt_palette("SixDegrees1")
#' dt_palette("ViewFromTheTop1")
#' dt_palette("ViewFromTheTop1", 3)
#'
#' # If you need more colors than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing colors
#' pal <- dt_palette(21, name = "DramaticTurn1", type = "continuous")
#' image(volcano, col = pal)
dt_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- dt_palettes[[name]]
  if (is.null(pal)) {
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}


#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- graphics::par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(graphics::par(old))

  graphics::image(
    1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

  graphics::rect(
    0, 0.9, n + 1, 1.1,
    col = grDevices::rgb(1, 1, 1, 0.8),
    border = NA
  )

  graphics::text(
    (n + 1) / 2, 1,
    labels = attr(x, "name"),
    cex = 1,
    family = "serif"
  )
}
