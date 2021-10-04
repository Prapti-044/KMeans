#' @import data.table
library(data.table)

#' KMeans: A package for applying K-Means clustering algorithm
#'
#' The KMeans package provides the following function:
#' apply.kmeans
#'
#' @docType package
#' @name KMeans
NULL
#> NULL

#' Applies K-Means algorithm to the given data data.mat
#'
#' \code{apply.kmeans} returns the within sum of squared distances (errors) from the cluster to the observations. It also provides the K centers of the clusters.
#'
#' @param data.mat Dataset of type matrix (List of double) and shape (n x d), where n is the number of observations and d is the dimension of the dataset.
#' @param centers The number of clusters.
#' @param iter.max Maximum number of iterations of Kmeans clustering algorithm.
#' @return A class where "tot.withinss" is the within sum of squared errors, and "cluster" is the center of the clusters of shape (k x n).
#'
#'   For description of how KMeans clustering algorithm works, please see the following url.
#'   \url{https://en.wikipedia.org/wiki/K-means_clustering}
#' @examples
#' apply.kmeans(iris[,-5], 3, 300)
#'
#' \dontrun{
#' apply.kmeans(iris[,-5], 3, 300)
#' }
#'
#' @export
apply.kmeans <- function(data.mat, centers, iter.max = 10) {
  centers.mat <- data.mat[sample(1:nrow(data.mat), centers), ]
  centers.dt <- data.table(
    centers.mat,
    cluster=factor(1:nrow(centers.mat)))

  dist.dt <- data.table(expand.grid(
    centers.i=1:nrow(centers.dt),
    data.i=1:nrow(data.mat)))

  last.centers.mat <- centers.mat
  for(iter in 0:iter.max) {
    dist.dt[, error := {
      rowSums((data.mat[data.i,]-unlist(centers.mat[centers.i,]))^2)
    }]
    assignment.dt <- dist.dt[, {
      .SD[which.min(error)]
    }, by=data.i ]
    new.mean.dt <- assignment.dt[, {
      data.table(t(colMeans(data.mat[data.i,])))
    }, by=centers.i]
    centers.mat <- new.mean.dt[, colnames(centers.mat), with=FALSE]
  }

  result <- list(tot.withinss=sum(assignment.dt$error), cluster=centers.mat)
  class(result) <- append(class(result),"result")
  return(result);
}
