
# stopOnInterfaceCall -----------------------------------------------------

#' @title
#' Stop on interface call
#'
#' @description
#' Used inside methods of interface classes to signal that the interface
#' instead of an interface \emph{implementation} has been called.
#'
#' @details
#' TODO
#'
#' @param inst A class instance. Designed for instances of interface classes.
#' @template threedots
#' @return An error. See respective methods.
#' @example inst/examples/example-stopOnInterfaceCall.R
stopOnInterfaceCall <- function(inst, ...) {
  UseMethod("stopOnInterfaceCall", inst)
}

# stopOnInterfaceCall.R6 --------------------------------------------------

#' @title
#' Stop on interface call
#'
#' @description
#' See generic: \code{\link[devops]{stopOnInterfaceCall}}.
#'
#' Method for instances of class \code{\link[R6]{R6}}
#'
#' @details
#' TODO
#'
#' @param inst An instance of class \code{\link[R6]{R6}}.
#' @param cl An instance of class \code{\link[base]{expression}}.
#' @template threedots
#' @return An error informing the user that he called an interface method.
#' @example inst/examples/example-stopOnInterfaceCall.R
stopOnInterfaceCall.R6 <- function(inst, cl = sys.call(-2), ...) {
  # cl <- gsub(".*\\$", "", as.character(sys.call()), perl = TRUE)
  cl <- gsub(".*\\$", "", as.character(cl), perl = TRUE)
  stop(sprintf("%s: %s: you called the interface", class(inst)[1], cl))
}

#' @title
#' Method not implemented yet
#'
#' @description
#' Used inside methods that have not been (fully) implemented yet.
#'
#' @details
#' TODO
#'
#' @param inst A class instance. Designed for use in class methods.
#' @template threedots
#' @return See respective methods.
#' @example inst/examples/example-methodNotImplemented.R
methodNotImplemented <- function(inst, ...) {
  UseMethod("methodNotImplemented", inst)
}

# methodNotImplemented.R6 --------------------------------------------------

#' @title
#' Stop on interface call
#'
#' @description
#' See generic: \code{\link[devops]{methodNotImplemented}}.
#'
#' Method for instances of class \code{\link[R6]{R6}}
#'
#' @details
#' TODO
#'
#' @param inst An instance of class \code{\link[R6]{R6}}.
#' @template threedots
#' @param cl An instance of class \code{\link[base]{expression}}.
#' @return An error informing the user that the method he called
#'  has not yet been implemented.
#' @example inst/examples/example-methodNotImplemented.R
methodNotImplemented.R6 <- function(inst, cl = sys.call(-2), ...) {
  # cl <- gsub(".*\\$", "", as.character(sys.call()), perl = TRUE)
  cl <- gsub(".*\\$", "", as.character(cl), perl = TRUE)
  stop(sprintf("%s: %s: not implemented yet", class(inst)[1], cl))
}
