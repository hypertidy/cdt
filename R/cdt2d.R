#' @importFrom V8 v8
load_cdt2d <- function() {
  ct <- V8::v8()
  ## load up the bunde
  ct$source(system.file("js/bundle.js", package = "cdt"))
  ct
}

## numbers to json
toj <- function(x) {
  sprintf("[%s]", paste(x, collapse = ", "))
}
## x,y numbers to json
tojxy <- function(x, y) {
  sprintf("[%s]", paste(paste(x, y, sep = ","), collapse = ", "))
}
## x,y numbers array
tojaxy <- function(x, y) {
  sprintf("[%s]", paste(sprintf("[%f,%f]", x, y), collapse = ","))
}
## x,y integer array
tojaixy <- function(x, y) {
  sprintf("[%s]", paste(sprintf("[%i,%i]", x, y), collapse = ","))
}

## TODO handle edges grouping, I don't think cdt2d makes sense in any other use
get_tri <- function(x, y, edges = NULL) {

  stopifnot(length(x) == length(y))
  stopifnot(!(any(is.na(x)) | any(is.na(y))))
  ct <- load_cdt2d()
  if (is.null(edges)) {
    ct$eval(sprintf("var triangles = cdt2d(%s)", tojaxy(x, y)))
  } else {
    ## 0 index internall
    edges <- as.matrix(edges) - 1
    ct$eval(sprintf("var triangles = cdt2d(%s, %s)", tojaxy(x, y), tojaixy(edges[, 1], edges[, 2])))
  }
  ct$get("triangles") + 1
}
