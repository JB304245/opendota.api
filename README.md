
# opendota.api

<!-- badges: start -->
<!-- badges: end -->

The goal of opendota.api is to provide an interface to the opendota.com API.  
Complete API documentation: https://docs.opendota.com/

## Installation

You can install the development version of opendota.api from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JB304245/opendota.api")
```

## Example

Getting data for pro matches

``` r
library(opendota.api)

# Get match id and other information for recent pro matches:
DT = pro_matches()

# From there one we can keep going backwards by supplying the minimum match id:
DT2 = pro_matches(less_than_match_id = min(DT$match_id))

# Then use those match ids to get more granular data, for example:

match_data = matches(match_id = max(DT$match_id))

```

