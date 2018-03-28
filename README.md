
<!-- README.md is generated from README.Rmd. Please edit that file -->
cdt
===

The goal of cdt is to provide constrained Delaunay triangulation in R.

Example
-------

WIP, more soon

``` r
ct <- cdt:::load_cdt2d()
src1 <- "
//Then we define a list of points, represented as pairs of x,y coordinates
var points = [
  [-2,-2],
  [-2, 2],
  [ 2, 2],
  [ 2,-2],
  [ 1, 0],
  [ 0, 1],
  [-1, 0],
  [ 0,-1]
  ]
"
src2 <- "
//Next we can optionally define some edge constraints
// This set of edges determines a pair of loops
var edges = [
  //Outer loop
  [0, 1],
  [1, 2],
  [2, 3],
  [3, 0],
  
  //Inner loop
  [4, 5],
  [5, 6],
  [6, 7],
  [7, 4]
  ]
"

ct$eval(src1)
ct$eval(src2)
ct$eval("cdt2d(points, edges)")
#> [1] "0,6,1,0,7,6,0,3,7,1,6,5,1,5,2,2,4,3,2,5,4,3,4,7,4,5,7,5,6,7"
```

Setup
-----

<https://github.com/mikolalysenko/cdt2d>

<https://cran.r-project.org/web/packages/V8/vignettes/npm.html>

Cadge details from here <https://github.com/hypertidy/rearcut>
