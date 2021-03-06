% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aipw_wrapper.R
\name{aipw_wrapper}
\alias{aipw_wrapper}
\title{AIPW wrapper function}
\usage{
aipw_wrapper(
  Y,
  A,
  verbose = TRUE,
  W = NULL,
  W.Q = NULL,
  W.g = NULL,
  Q.SL.library,
  g.SL.library,
  k_split = 10,
  g.bound = 0.025
)
}
\arguments{
\item{Y}{Outcome (binary integer: 0 or 1)}

\item{A}{Exposure (binary integer: 0 or 1)}

\item{verbose}{Whether to print the result (logical; Default = FALSE)}

\item{W}{covariates for both exposure and outcome models  (vector, matrix or data.frame). If null, this function will seek for
inputs from \code{W.Q} and \code{W.g}.}

\item{W.Q}{Only valid when \code{W} is null, otherwise it would be replaced by \code{W}.
Covariates for outcome model (vector, matrix or data.frame).}

\item{W.g}{Only valid when \code{W} is null, otherwise it would be replaced by \code{W}.
Covariates for exposure model (vector, matrix or data.frame)}

\item{Q.SL.library}{SuperLearner libraries or sl3 learner object (Lrnr_base) for outcome model}

\item{g.SL.library}{SuperLearner libraries or sl3 learner object (Lrnr_base) for exposure model}

\item{k_split}{Number of splitting (integer; range: from 1 to number of observation-1):
if k_split=1, no cross-fitting;
if k_split>=2, cross-fitting is used
(e.g., \code{k_split=10}, use 9/10 of the data to estimate and the remaining 1/10 leftover to predict).
NOTE: it's recommended to use cross-fitting.}

\item{g.bound}{Value between [0,1] at which the propensity score should be truncated. Defaults to 0.025.}
}
\value{
A fitted \code{AIPW} object with summarised results
}
\description{
A wrapper function for \code{AIPW$new()$fit()$summary()}
}
\examples{
library(SuperLearner)
aipw_sl <- aipw_wrapper(Y=rbinom(100,1,0.5), A=rbinom(100,1,0.5),
                    W.Q=rbinom(100,1,0.5), W.g=rbinom(100,1,0.5),
                    Q.SL.library="SL.mean",g.SL.library="SL.mean",
                    k_split=1,verbose=FALSE)
}
\seealso{
\link{AIPW}
}
