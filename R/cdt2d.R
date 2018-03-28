#' @importFrom V8 v8
load_cdt2d <- function() {
  ct <- V8::v8()
  ## load up the bunde
  ct$source(system.file("js/bundle.js", package = "cdt"))
  ct
}

