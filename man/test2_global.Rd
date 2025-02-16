% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tests.R
\name{test2_global}
\alias{test2_global}
\title{Global Two-Sample Test for Network-Valued Data}
\usage{
test2_global(
  x,
  y,
  representation = "adjacency",
  distance = "frobenius",
  stats = c("flipr:t_ip", "flipr:f_ip"),
  B = 1000L,
  test = "exact",
  k = 5L,
  seed = NULL
)
}
\arguments{
\item{x}{An \code{\link{nvd}} object listing networks in sample 1.}

\item{y}{An \code{\link{nvd}} object listing networks in sample 2.}

\item{representation}{A string specifying the desired type of representation,
among: \code{"adjacency"}, \code{"laplacian"} and \code{"modularity"}.
Defaults to \code{"adjacency"}.}

\item{distance}{A string specifying the chosen distance for calculating the
test statistic, among: \code{"hamming"}, \code{"frobenius"},
\code{"spectral"} and \code{"root-euclidean"}. Defaults to
\code{"frobenius"}.}

\item{stats}{A character vector specifying the chosen test statistic(s),
among: \code{"original_edge_count"}, \code{"generalized_edge_count"},
\code{"weighted_edge_count"}, \code{"student_euclidean"}, \code{"welch_euclidean"} or any
statistics based on inter-point distances available in the \strong{flipr}
package: \code{"flipr:student_ip"}, \code{"flipr:fisher_ip"}, \code{"flipr:bg_ip"},
\code{"flipr:energy_ip"}, \code{"flipr:cq_ip"}. Defaults to \code{c("flipr:student_ip", "flipr:fisher_ip")}.}

\item{B}{The number of permutation or the tolerance. If this number is lower
than \code{1}, it is intended as a tolerance. Otherwise, it is intended as
the number of required permutations. Defaults to \code{1000L}.}

\item{test}{A character string specifying the formula to be used to compute
the permutation p-value. Choices are \code{"estimate"}, \code{"upper_bound"} and
\code{"exact"}. Defaults to \code{"exact"} which provides exact tests.}

\item{k}{An integer specifying the density of the minimum spanning tree used
for the edge count statistics. Defaults to \code{5L}.}

\item{seed}{An integer for specifying the seed of the random generator for
result reproducibility. Defaults to \code{NULL}.}
}
\value{
A \code{\link[base]{list}} with three components: the value of the
statistic for the original two samples, the p-value of the resulting
permutation test and a numeric vector storing the values of the permuted
statistics.
}
\description{
This function carries out an hypothesis test where the null hypothesis is
that the two populations of networks share the same underlying probabilistic
distribution against the alternative hypothesis that the two populations come
from different distributions. The test is performed in a non-parametric
fashion using a permutational framework in which several statistics can be
used, together with several choices of network matrix representations and
distances between networks.
}
\examples{
n <- 10L
gnp_params <- list(p = 1/3)
k_regular_params <- list(k = 8L)

# Two different models for the two populations
x <- nvd(model = "gnp", n = n, model_params = gnp_params)
y <- nvd(model = "k_regular", n = n, model_params = k_regular_params)
t1 <- test2_global(x, y, representation = "modularity")
t1$pvalue

# Same model for the two populations
x <- nvd(model = "gnp", n = 10L, model_params = gnp_params)
y <- nvd(model = "gnp", n = 10L, model_params = gnp_params)
t2 <- test2_global(x, y, representation = "modularity")
t2$pvalue
}
