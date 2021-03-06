% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AIPW.R
\name{fit}
\alias{fit}
\alias{fit.AIPW}
\title{Fit the data to the \link{AIPW} object}
\value{
A fitted \link{AIPW} object with \code{obs_est} and \code{libs} (public variables)
}
\description{
Fitting the data into the \link{AIPW} object with/without cross-fitting to estimate the efficient influence functions
}
\section{R6 Usage}{

\code{$fit()}
}

\examples{
library(SuperLearner)
aipw_sl <- AIPW$new(Y=rbinom(100,1,0.5), A=rbinom(100,1,0.5),
                    W.Q=rbinom(100,1,0.5), W.g=rbinom(100,1,0.5),
                    Q.SL.library="SL.mean",g.SL.library="SL.mean",
                    k_split=1,verbose=FALSE)
aipw_sl$fit()
}
\seealso{
\link{AIPW}
}
