\name{ShinyCLTExamp}
\alias{ShinyCLTExamp}
\title{ Interactively Demonstrate the Central Limit Theorem }
\description{
  Launches a Shiny app wrapping \code{\link{clt.examp}}: it simulates
  several datasets from each of 4 different population shapes for a
  given sample size, and plots histograms of the samples (and of their
  means) with a normal reference curve.
}
\usage{
ShinyCLTExamp(n = 1, reps = 10000, nclass = 16,
              norm.param = list(mean = 0, sd = 1),
              gamma.param = list(shape = 1, rate = 1/3),
              unif.param = list(min = 0, max = 1),
              beta.param = list(shape1 = 0.35, shape2 = 0.25))
}
\arguments{
  \item{n}{ Initial sample size. }
  \item{reps}{ Number of samples to take from each distribution.
    Passed through to \code{\link{clt.examp}}. }
  \item{nclass}{ Number of bars in the histograms.  Passed through to
    \code{\link{clt.examp}}. }
  \item{norm.param}{ List with parameters passed to \code{rnorm}.
    Passed through to \code{\link{clt.examp}}. }
  \item{gamma.param}{ List with parameters passed to \code{rgamma}.
    Passed through to \code{\link{clt.examp}}. }
  \item{unif.param}{ List with parameters passed to \code{runif}.
    Passed through to \code{\link{clt.examp}}. }
  \item{beta.param}{ List with parameters passed to \code{rbeta}.
    Passed through to \code{\link{clt.examp}}. }
}
\details{
  This function requires the \pkg{shiny} package to be installed.  With
  the default sample size of 1 the plots show the shapes of the 4
  populations; increasing the sample size shows the sampling
  distribution of the mean becoming more normal, illustrating the
  Central Limit Theorem.  It is best to select and retype the sample
  size value rather than use small increments.

  Only \code{n} is interactive (via the \dQuote{Sample Size} input in
  the app); \code{reps}, \code{nclass}, \code{norm.param},
  \code{gamma.param}, \code{unif.param}, and \code{beta.param} are set
  once when \code{ShinyCLTExamp} is called and passed through to every
  call of \code{\link{clt.examp}} made by the app.
}
\value{
  Launches the app in non-blocking mode (via
  \code{\link[shiny]{startApp}}) and returns a \code{ShinyAppHandle}
  immediately, so the R console remains available while the app runs
  in the background.  Use \code{handle$stop()} to stop the app.
}
\author{ Greg Snow \email{538280@gmail.com} }
\seealso{ \code{\link{clt.examp}}, \code{\link{ShinySamplingDistMean}} }
\examples{
if(interactive()) {
  h <- ShinyCLTExamp()
  # h$stop() # run this when finished with the app
  h <- ShinyCLTExamp(reps = 2000, gamma.param = list(shape = 2, rate = 1))
  # h$stop() # run this when finished with the app
}
}
\keyword{ dynamic }
