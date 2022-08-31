#' players_by_rank
#'
#' @param base_url base_url
#' @param path path
#' @param api_key optional API key
#'
#' @return A data.table
#' @export
#'
#' @import httr glue
#'
#' @examples players_by_rank()
players_by_rank = function(api_key = NULL,
                           base_url = 'https://api.opendota.com/api/',
                           path = 'playersByRank/') {

  url = paste0(base_url, path)

  query_list = list(api_key = api_key)
  query_list = query_list[lengths(query_list) > 0]

  response = httr::GET(url, query = query_list)

  if(httr::http_error(response)) stop(glue::glue("Error Code {httr::status_code(response)}"))

  raw_content = httr::content(response)

  DT = data.table::rbindlist(raw_content, use.names=TRUE, fill=TRUE)

  return(DT)

}
