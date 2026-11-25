\name{ShinyHistogramBuild}
\alias{ShinyHistogramBuild}
\title{ Interactively Step Through the Construction of a Histogram }
\description{
  Launches a Shiny app that steps through the process of building a
  histogram, one point (or batch of points) at a time, using the
  \code{precip} dataset of average annual precipitation for U.S.
  cities.
}
\usage{
ShinyHistogramBuild(step = 1)
}
\arguments{
  \item{step}{ Initial step number to display (1 to 22). }
}
\details{
  This function requires the \pkg{shiny} package to be installed.  The
  app has a single numeric input, \dQuote{Step}, that controls how
  much of the construction is shown.  Early steps lay out the data and
  the histogram axes/bins; later steps add the data points to the
  histogram one at a time (then in small batches), illustrating how a
  histogram is built up from raw data.

  The idea is to run the function (without specifying the argument), then
  use the increment button in the "Step" input box to step through the process.
}
\value{
  Launches the app in non-blocking mode (via
  \code{\link[shiny]{startApp}}) and returns a \code{ShinyAppHandle}
  immediately, so the R console remains available while the app runs
  in the background.  Use \code{handle$stop()} to stop the app.
}
\author{ Greg Snow \email{538280@gmail.com} }
\seealso{ \code{\link{hist}}, \code{\link{ShinyStemBuild}}, \code{\link{ShinyBoxplotBuild}} }
\examples{
if(interactive()) {
  h <- ShinyHistogramBuild()
  # h$stop() # run this when finished with the app
}
}
\keyword{ dynamic }
