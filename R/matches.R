#' matches
#'
#' returns a list with various data for the given match_id
#'
#' @param base_url base_url
#' @param path path
#' @param match_id match_id
#'
#' @return a list
#' @export
matches = function(match_id,
                   base_url = 'https://api.opendota.com/api/',
                   path = 'matches/') {

  stopifnot(is.numeric(match_id))

  url = paste0(base_url, path, match_id)

  response = httr::GET(url)

  if(httr::http_error(response)) stop(glue::glue("Status Code {httr::status_code(response)}.
                                                 More information: {as.character(response)}"))

  raw_content = httr::content(response)

  return(raw_content)

}
