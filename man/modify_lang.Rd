\name{modify_lang}
\alias{modify_lang}
\title{Recursively modify a language object}
\usage{
  modify_lang(x, f, ...)
}
\arguments{
  \item{x}{object to modify: should be a call, expression,
  function or list of the above.}

  \item{f}{function to apply to leaves}
  
  \item{...}{additonal arguments to f}
}
\description{
  Recursively modify a language object
}
\examples{
a_to_b <- function(x) {
  if (is.name(x) && identical(x, quote(a))) return(quote(b))
  x
}
examples <- list(
  quote(a <- 5),
  alist(a = 1, c = a),
  function(a = 1) a * 10,
  expression(a <- 1, a, f(a), f(a = a))
)
modify_lang(examples, a_to_b)
# Modifies all objects called a, but doesn't modify arguments named a
}

