#' @title
#' Superclass for README Information
#'
#' @description
#' TODO
#'
#' @details
#' TODO
#'
#' @field format \code{\link{list}}
#'  Data format information
#'
#' @section Getters/setters:
#'
#' \itemize{
#'  \item{See interface} {
#'    \code{\link[devops]{IReadme}}
#'  }
#' }
#'
#' @section Public methods:
#'
#' \itemize{
#'  \item{See interface} {
#'    \code{\link[devops]{IReadme}}
#'  }
#' }
#'
#' @template authors
#' @template references
#' @example inst/examples/example-Readme.R
#' @include interface_classes.R
#' @import R6
#' @export
Readme <- R6Class(
  classname = "Readme",
  inherit = IReadme,
  portable = TRUE,
  public = list(
    ## Fields //
    path = "README.md",
    cache = character(),
    content = list(),

    ## Methods //
    initialize = function(
      path = "README.md",
      content = list()
    ) {
      self$content <- content
      self$path <- path
    },
    getPath = function() {
      self$path
    },
    setPath = function(value) {
      self$path <- value
    },
    getContent = function() {
      self$content
    },
    setContent = function(value) {
      self$content <- value
    },
    read = function() {

    },
    write = function() {

    },
    createTemplate = function(
      github_user,
      save = FALSE,
      path = self$path
    ) {
      value <- private$loadTemplate()
      desc <- if (basename(getwd()) == "devops") {
        as.package(".")
      } else {
        tmp <- packageDescription("devops")
        names(tmp) <- tolower(names(tmp))
        tmp
      }

      value <- gsub("\\$\\{github_user\\}", github_user, value)
      value <- gsub("\\$\\{package\\}", desc$package, value)
      value <- gsub("\\$\\{description\\}", desc$description, value)
      value <- gsub("\\$\\{git_branch\\}",
        getOption(desc$package)$git_branch, value)
      if (save) {
        writeLines(value, con = path)
      }
      value
    }
  ),
  private = list(
    loadTemplate = function() {
      path <- system.file("templates/readme.md", package = "devops")
      readLines(path)
    }
  )
)
