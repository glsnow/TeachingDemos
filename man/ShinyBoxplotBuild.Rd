\name{ShinyBoxplotBuild}
\alias{ShinyBoxplotBuild}
\title{ Interactively Step Through the Construction of a Boxplot }
\description{
  Launches a Shiny app that steps through the process of building a
  boxplot (box-and-whiskers plot).  By default it uses the
  \code{precip} dataset of average annual precipitation for U.S.
  cities, but any numeric vector can be supplied.
}
\usage{
ShinyBoxplotBuild(data = datasets::precip, xlab, step = 1)
}
\arguments{
  \item{data}{ A numeric vector of data to build the boxplot from.
    Defaults to \code{datasets::precip}. }
  \item{xlab}{ Label for the x-axis.  Defaults to \code{"precip"} when
    \code{data} is left at its default, or to a deparsed version of the
    \code{data} argument otherwise. }
  \item{step}{ Initial step number to display (1 to 13). }
}
\details{
  This function requires the \pkg{shiny} package to be installed.  The
  app has a single numeric input, \dQuote{Step}, that controls how
  much of the construction is shown: setting up the axis, plotting the
  raw data, locating the median, the quartiles and the IQR (with the
  IQR and fence values shown in the step titles, computed from the
  supplied data), drawing the box, whiskers, and finally marking
  potential outliers.  

  Generally you will run the app with the default step of 1, then use the 
  increment button in the \code{Step} box to step through the process.  
  Possibly entering a number if you want to skip ahead or go back to a 
  specific step.
}
\value{
  Launches the app in non-blocking mode (via
  \code{\link[shiny]{startApp}}) and returns a \code{ShinyAppHandle}
  immediately, so the R console remains available while the app runs
  in the background.  Use \code{handle$stop()} to stop the app.
}
\author{ Greg Snow \email{538280@gmail.com} }
\seealso{ \code{\link{boxplot}}, \code{\link{ShinyHistogramBuild}}, \code{\link{ShinyStemBuild}} }
\examples{
if(interactive()) {
  h <- ShinyBoxplotBuild()
  # h$stop() # run this when finished with the app
  h <- ShinyBoxplotBuild(mtcars$wt, xlab='Car Weight')
  # h$stop() # run this when finished with the app
}
}
\keyword{ dynamic }
