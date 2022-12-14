% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pro_matches.R
\name{pro_matches}
\alias{pro_matches}
\title{pro_matches}
\usage{
pro_matches(
  less_than_match_id = NULL,
  api_key = NULL,
  base_url = "https://api.opendota.com/api/",
  path = "proMatches/"
)
}
\arguments{
\item{less_than_match_id}{less_than_match_id}

\item{api_key}{optional API key}

\item{base_url}{base_url}

\item{path}{path}
}
\value{
a data.table
}
\description{
returns table with 100 available pro matches with match id smaller than less_than_match_id
}
