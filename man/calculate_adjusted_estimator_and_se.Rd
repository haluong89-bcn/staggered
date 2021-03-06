% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_efficient_estimator_and_se.R
\name{calculate_adjusted_estimator_and_se}
\alias{calculate_adjusted_estimator_and_se}
\title{Calculate the efficient adjusted estimator in staggered rollout designs}
\usage{
calculate_adjusted_estimator_and_se(
  df,
  estimand = NULL,
  A_theta_list = NULL,
  A_0_list = NULL,
  eventTime = 0,
  beta = NULL,
  betaType = ifelse(is.null(beta), "betaStar", "Custom"),
  refine_S_g = F,
  use_DiD_A0 = ifelse(is.null(A_0_list), T, F)
)
}
\arguments{
\item{df}{A data frame containing panel data with the variables y (an outcome), i (an individual identifier), t (the period in which the outcome is observe), g (the period in which i is first treated, with Inf denoting never treated)}

\item{estimand}{The estimand to be calculated: "simple" averages all treated (t,g) combinations with weights proportional to N_g; "cohort" averages the ATEs for each cohort g, and then takes an N_g-weighted average across g; "calendar" averages ATEs for each time period, weighted by N_g for treated units, and then averages across time. "EventStudy" returns the average effect at the ''event-time'' given in the parameter EventTime.  The parameter can be left blank if a custom parameter is provided in A_theta_list}

\item{A_theta_list}{This parameter allows for specifying a custom estimand, and should be left as NULL if estimand is specified. It is a list of matrices A_theta_g so that the parameter of interest is sum_g A_theta_g Ybar_g, where Ybar_g = 1/N sum_i Y_i(g)}

\item{A_0_list}{This parameter allow for specifying the matrices used to construct the Xhat vector of pre-treatment differences. If left NULL, the default is to use the scalar set of controls used in Callaway and Sant'Anna. If use_DiD_A0 = F, then it uses the full vector possible comparisons of (g,g') in periods t<g,g'.}

\item{eventTime}{If using estimand = "eventstudy", specify what eventTime you want the event-study parameter for. The default is 0, the period in which treatment occurs}

\item{beta}{Optional. A coefficient to use for covariate adjustment. If not specified, the plug-in optimal coefficient is used. beta =0 corresponds with the simple difference-in-means. beta = 1 corresponds with the Callaway and Sant'Anna estimator when using the default value of use_DiD_A0=T.}

\item{use_DiD_A0}{If this parameter is true, then Xhat corresponds with the scalar used by Callaway and Sant'Anna, so the Callaway and Sant'Anna estimator corresponds with beta=1. If it is false, the Xhat is a vector with all possible comparisons of pairs of cohorts before either is treated. The latter option should only be used when the number of possible comparisons is small relative to sample size.}

\item{betaType.}{An optional parameter describing the type of covariate adjustment used. Defaults to "betaStar" if the efficient estimator is used.}
}
\value{
df A data.frame containing: thetahat (the point estimate), se (the standard error), se_conservative (the Neyman standard error), and betaType
}
\description{
This functions calculates the efficient estimator for staggered rollout designs proposed by Roth and Sant'Anna.
}
