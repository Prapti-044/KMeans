
<!-- README.md is generated from README.Rmd. Please edit that file -->

# KMeans

<!-- badges: start -->

[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub repo
size](https://img.shields.io/github/repo-size/Prapti-044/Kmeans)
![GitHub code size in
bytes](https://img.shields.io/github/languages/code-size/Prapti-044/Kmeans)
![GitHub language
count](https://img.shields.io/github/languages/count/Prapti-044/Kmeans)
![GitHub top
language](https://img.shields.io/github/languages/top/Prapti-044/Kmeans)
<!-- badges: end -->

The goal of KMeans is to learn how to create an R-package by
implementing [KMeans clustering
agorithm](https://en.wikipedia.org/wiki/K-means_clustering) for
clustering a dataset.

*Note*: This RMarkdown is created following the guidelines of [this
R-package example](https://github.com/mvuorre/exampleRPackage).

## Installation

You can only install the development version from [this
repository](https://github.com/Prapti-044/KMeans) with:

``` r
# install.packages("devtools")
devtools::install_github("Prapti-044/KMeans")
```

## Example

This is a basic example which shows you how to cluster the iris dataset:

``` r
library(KMeans)
result <- apply.kmeans(iris[,-5], 3, 300)
str(result)
#> List of 2
#>  $ tot.withinss: num 78.9
#>  $ cluster     :Classes 'data.table' and 'data.frame':   3 obs. of  4 variables:
#>   ..$ Sepal.Length: num [1:3] 5.01 5.9 6.85
#>   ..$ Sepal.Width : num [1:3] 3.43 2.75 3.07
#>   ..$ Petal.Length: num [1:3] 1.46 4.39 5.74
#>   ..$ Petal.Width : num [1:3] 0.246 1.434 2.071
#>   ..- attr(*, ".internal.selfref")=<externalptr> 
#>  - attr(*, "class")= chr [1:2] "list" "result"
```
