\name{ShinySamplingDistProp}
\alias{ShinySamplingDistProp}
\title{ Interactively Demonstrate the Sampling Distribution of a Proportion }
\description{
  Launches a Shiny app that shows a Bernoulli \dQuote{population} with
  a given true proportion.  Clicking \dQuote{Sample Once} draws a
  sample and shows the sample and its sample proportion; sampling in
  batches accumulates many sample proportions into a histogram
  approximating the sampling distribution of \eqn{\hat p}.
}
\usage{
ShinySamplingDistProp()
}
\details{
  This function requires the \pkg{shiny} package to be installed.  Set
  the true proportion and the sample size, then use the
  \dQuote{Sample Once}, \dQuote{Sample 5}, \dQuote{Sample 100}, or
  \dQuote{Sample 1,000} buttons to draw samples.  A single sample is
  shown as a bar plot; multiple individual samples are shown as a
  scatter plot of their sample proportions.  All sampled proportions
  accumulate into the sampling distribution histogram at the bottom.
  Changing the sample size resets the accumulated samples.
}
\value{
  Launches the app in non-blocking mode (via
  \code{\link[shiny]{startApp}}) and returns a \code{ShinyAppHandle}
  immediately, so the R console remains available while the app runs
  in the background.  Use \code{handle$stop()} to stop the app.
}
\author{ Greg Snow \email{538280@gmail.com} }
\seealso{ \code{\link{rbinom}}, \code{\link{ShinySamplingDistMean}}, \code{\link{clt.examp}} }
\examples{
if(interactive()) {
  h <- ShinySamplingDistProp()
  # h$stop() # run this when finished with the app
}
}
\keyword{ dynamic }
