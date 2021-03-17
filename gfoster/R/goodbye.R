#' My goodbye function
#'
#' @param x The name of the person to say goodbye to
#'
#' @return The output from \code{link{print}}
#' @export
#'
#' @examples
#' goodbye("Covid")
#' \dontrun{
#' goodbye("Fun")
#' }
goodbye <- function(x) {
  print(paste0("Goodbye ", x, " good seeing you!"))
}
