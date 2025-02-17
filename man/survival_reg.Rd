% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survival_reg.R
\name{survival_reg}
\alias{survival_reg}
\alias{update.survival_reg}
\title{General Interface for Parametric Survival Models}
\usage{
survival_reg(mode = "censored regression", dist = NULL)

\method{update}{survival_reg}(object, parameters = NULL, dist = NULL, fresh = FALSE, ...)
}
\arguments{
\item{mode}{A single character string for the type of model.
The only possible value for this model is "censored regression".}

\item{dist}{A character string for the outcome distribution. "weibull" is
the default.}

\item{object}{A survival regression model specification.}

\item{parameters}{A 1-row tibble or named list with \emph{main}
parameters to update. If the individual arguments are used,
these will supersede the values in \code{parameters}. Also, using
engine arguments in this object will result in an error.}

\item{fresh}{A logical for whether the arguments should be
modified in-place of or replaced wholesale.}

\item{...}{Not used for \code{update()}.}
}
\description{
\code{survival_reg()} is a way to generate a \emph{specification} of a model
before fitting and allows the model to be created using
R. The main argument for the
model is:
\itemize{
\item \code{dist}: The probability distribution of the outcome.
}
This argument is converted to its specific names at the
time that the model is fit. Other options and argument can be
set using \code{set_engine()}. If left to its default
here (\code{NULL}), the value is taken from the underlying model
functions. If parameters need to be modified, \code{update()} can be used
in lieu of recreating the object from scratch.

If parameters need to be modified, this function can be used
in lieu of recreating the object from scratch.
}
\details{
The data given to the function are not saved and are only used
to determine the \emph{mode} of the model. For \code{survival_reg()},the
mode will always be "censored regression".

Since survival models typically involve censoring (and require the use of
\code{\link[survival:Surv]{survival::Surv()}} objects), the \code{\link[=fit]{fit()}} function will require that the
survival model be specified via the formula interface.
}
\examples{
survival_reg()
# Parameters can be represented by a placeholder:
survival_reg(dist = varying())

model <- survival_reg(dist = "weibull")
model
update(model, dist = "lnorm")
}
\seealso{
\code{\link[=fit]{fit()}}, \code{\link[survival:Surv]{survival::Surv()}}
}
