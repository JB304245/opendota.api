#' players_by_rank
#'
#' @return A data.table
#' @export
#'
#' @import httr glue
#'
#' @examples players_by_rank()
players_by_rank = function(base_url = 'https://api.opendota.com/api/',
                           path = 'playersByRank/') {

  url = paste0(base_url, path)

  response = httr::GET(url)

  if(httr::http_error(response)) stop(glue::glue("Error Code {httr::status_code(response)}"))

  raw_content = httr::content(response)

  DT = data.table::rbindlist(raw_content, use.names=TRUE, fill=TRUE)

  return(DT)

}
