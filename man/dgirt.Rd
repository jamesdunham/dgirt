% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dgirt.r
\name{dgirt}
\alias{dgirt}
\alias{dgmrp}
\alias{dgmrp}
\title{Fit a dynamic group IRT or single-issue MRP model}
\usage{
dgirt(shaped_data, ..., separate_t = FALSE, delta_tbar_prior_mean = 0.65,
  delta_tbar_prior_sd = 0.25, innov_sd_delta_scale = 2.5,
  innov_sd_theta_scale = 2.5, version = "2017_01_04",
  hierarchical_model = TRUE, model = NULL)

dgmrp(shaped_data, ..., separate_t = FALSE, delta_tbar_prior_mean = 0.65,
  delta_tbar_prior_sd = 0.25, innov_sd_delta_scale = 2.5,
  innov_sd_theta_scale = 2.5, version = "2017_01_04_singleissue",
  model = NULL)
}
\arguments{
\item{shaped_data}{Output from \code{\link{shape}}.}

\item{...}{Further arguments, passed to \code{\link[rstan]{stan}}.}

\item{separate_t}{Whether smoothing of estimates over time should be
disabled. Default \code{FALSE}.}

\item{delta_tbar_prior_mean}{Prior mean for \code{delta_tbar}, the normal
weight on \code{theta_bar} in the previous period.  Default \code{0.65}.}

\item{delta_tbar_prior_sd}{Prior standard deviation for \code{delta_bar}.
Default \code{0.25}.}

\item{innov_sd_delta_scale}{Prior scale for \code{sd_innov_delta}, the Cauchy
innovation standard deviation of \code{nu_geo} and \code{delta_gamma}.
Default \code{2.5}.}

\item{innov_sd_theta_scale}{Prior scale for \code{sd_innov_theta}, the Cauchy
innovation standard deviation of \code{gamma}, \code{xi}, and if
\code{constant_item} is \code{FALSE} the item difficulty \code{diff}. Default
\code{2.5}.}

\item{version}{The name of the dgo model to estimate, or the path to a
\code{.stan} file.  Valid names for dgo models are "2017_01_04",
"2017_01_04_singleissue". Ignored if argument \code{model} is used.}

\item{hierarchical_model}{Whether a hierarchical model should be used to
smooth the group IRT estimates. If set to FALSE, the model will return raw
group-IRT model estimates for each group. Default \code{TRUE}.}

\item{model}{A Stan model object of class \code{stanmodel} to be used in
estimation. Specifying this argument avoids repeated model compilation. Note
that the Stan model object for a model fitted with \code{dgirt()} or
\code{dgmrp()} can be found in the the \code{stanmodel} slot of the resulting
\code{dgirt_fit} or \code{dgmrp_fit} object.}
}
\value{
A \code{\link{dgo_fit-class}} object that extends
\code{\link[rstan]{stanfit-class}}.
}
\description{
\code{dgirt} and \code{dgmrp} make calls to \code{\link[rstan]{stan}} with
the Stan code and data for their respective models.
}
\details{
The user will typically pass further arguments to \code{\link[rstan]{stan}}
via the \code{...} argument, at a minimum \code{iter} and \code{cores}.

By default \code{dgirt} and \code{dgmrp} override the
\code{\link[rstan]{stan}} default for its \code{pars} argument to specify
typical parameters of interest. They also set \code{iter_r} to \code{1L}.

Important: the \code{dgirt} model assumes consistent coding of the polarity
of item responses for identification.
}
