% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AIPW_nuis.R
\name{AIPW_nuis}
\alias{AIPW_nuis}
\title{Augmented Inverse Probability Weighting (AIPW) uses tmle or tmle3 as inputs}
\value{
\code{AIPW_nuis} object
}
\description{
\code{AIPW_nuis} class for users to manually input nuisance functions (estimates from the exposure and the outcome models)
}
\details{
Create an AIPW_nuis object that uses users' input nuisance functions from the exposure model \eqn{P(A| W)},
and the outcome models \eqn{P(Y| do(A=0), W)} and \eqn{P(Y| do(A=1), W.Q)}:
\deqn{
     \psi(a) = E{[ I(A=a) / P(A=a|W_g) ] * [Y-P(Y=1|A,W_Q)] + P(Y=1| do(A=a),W_Q) }
     }
Note: If outcome is missing, replace (A=a) with (A=a, observed=1) when estimating the propensity scores.
}
\section{Constructor}{

\code{AIPW$new(Y = NULL, A = NULL, tmle_fit = NULL, verbose = TRUE)}
\subsection{Constructor Arguments}{

\tabular{lll}{
\strong{Argument}      \tab   \strong{Type}     \tab     \strong{Details} \cr
\code{Y}               \tab   Integer           \tab     A vector of outcome (binary (0, 1) or continuous) \cr
\code{A}               \tab   Integer           \tab     A vector of binary exposure (0 or 1) \cr
\code{mu0}             \tab   Numeric             \tab    User input of \eqn{P(Y=1| do(A = 0),W_Q)} \cr
\code{mu1}             \tab   Numeric             \tab    User input of \eqn{P(Y=1| do(A = 1),W_Q)} \cr
\code{raw_p_score}     \tab   Numeric             \tab    User input of \eqn{P(A=a|W_g)} \cr
\code{verbose}         \tab   Logical           \tab    Whether to print the result (Default = TRUE)
}
}
}

\section{Public Methods}{

\tabular{lll}{
\strong{Methods}      \tab   \strong{Details}                                      \tab \strong{Link}     \cr
\code{summary()}      \tab   Summary of the average treatment effects from AIPW    \tab   \link{summary.AIPW_base}\cr
\code{plot.p_score()} \tab   Plot the propensity scores by exposure status         \tab   \link{plot.p_score}\cr
\code{plot.ip_weights()} \tab   Plot the inverse probability weights using truncated propensity scores  \tab   \link{plot.ip_weights}\cr
}
}

\section{Public Variables}{

\tabular{lll}{
\strong{Variable}     \tab   \strong{Generated by}      \tab     \strong{Return} \cr
\code{n}              \tab   Constructor                \tab     Number of observations \cr
\code{obs_est}        \tab   Constructor                \tab     Components calculating average causal effects \cr
\code{estimates}      \tab   \code{summary()}                \tab     A list of Risk difference, risk ratio, odds ratio \cr
\code{result}         \tab   \code{summary()}                \tab     A matrix contains RD, ATT, ATC, RR and OR with their SE and 95\%CI \cr
\code{g.plot}         \tab   \code{plot.p_score()}           \tab     A density plot of propensity scores by exposure status \cr
\code{ip_weights.plot}         \tab   \code{plot.ip_weights()}           \tab     A box plot of inverse probability weights \cr
}
\subsection{Public Variable Details}{

\describe{
\item{\code{obs_est}}{This list includes propensity scores (\code{p_score}), counterfactual predictions (\code{mu}, \code{mu1} & \code{mu0}) and efficient influence functions (\code{aipw_eif1} & \code{aipw_eif0})}
\item{\code{g.plot}}{This plot is generated by \code{ggplot2::geom_density}}
\item{\code{ip_weights.plot}}{This plot uses truncated propensity scores stratified by exposure status (\code{ggplot2::geom_boxplot})}
}
}
}

