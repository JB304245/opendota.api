#' pro_matches
#'
#' returns table with 100 available pro matches with match id smaller than less_than_match_id
#'
#' @param base_url base_url
#' @param path path
#' @param less_than_match_id less_than_match_id
#' @param api_key optional API key
#'
#' @return a data.table
#' @export
pro_matches = function(less_than_match_id = NULL,
                       api_key = NULL,
                       base_url = 'https://api.opendota.com/api/',
                       path = 'proMatches/') {

  url = paste0(base_url, path)

  query_list = list(less_than_match_id = less_than_match_id,
                    api_key = api_key)

  query_list = query_list[lengths(query_list) > 0]

  response = httr::GET(url, query = query_list)

  if(httr::http_error(response)) stop(glue::glue("Error Code {httr::status_code(response)}"))

  raw_content = httr::content(response)

  DT = data.table::rbindlist(raw_content, use.names=TRUE, fill=TRUE)

  return(DT)

}
