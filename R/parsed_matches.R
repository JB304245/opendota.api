#' parsed_matches
#'
#' returns available matches with match id smaller than less_than_match_id
#'
#' @param base_url base_url
#' @param path path
#' @param less_than_match_id less_than_match_id
#'
#' @return an integer vector
#' @export
parsed_matches = function(base_url = 'https://api.opendota.com/api/',
                          path = 'parsedMatches/',
                          less_than_match_id = NULL) {

  url = paste0(base_url, path)

  query_list = list(less_than_match_id = less_than_match_id)
  query_list = query_list[lengths(query_list) > 0]

  response = httr::GET(url, query = query_list)

  if(httr::http_error(response)) stop(glue::glue("Error Code {httr::status_code(response)}"))

  raw_content = httr::content(response)

  out = unname(unlist(raw_content))

  return(out)

}
