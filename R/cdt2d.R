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
get_tri <- function(x, y, edges = NULL) {
  stopifnot(length(x) == length(y))
  stopifnot(!(any(is.na(x)) | any(is.na(y))))
  ct <- load_cdt2d()
  if (is.null(edges)) {
    ct$eval(sprintf("var triangles = cdt2d(%s)", tojaxy(x, y)))
  } else {

  }
  ct$get("triangles") + 1L
}
