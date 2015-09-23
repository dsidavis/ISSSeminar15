library(RSPARQL)
library(RCurl)

qmeamc =
    #
    #  This is  a convenience function for querying MEAM Central's SPARQL endpoint.
    #  It calls the SPARQL() function, but arranges to pass the username and password
    #   or 
    #
    # classes =qmeamc("SELECT DISTINCT ?class {  $s rdf:type $class . }", verbose = TRUE)
    #
function(q, url = "http://meamgraph.ucdavis.edu:10035/catalogs/meamgraph-catalog/repositories/meamgraph_prosem",
          username = "meamclass", passwd = getOption("MEAMCentralPassword", stop("no password provided")),
          ns = c('mco' = '<http://meamcentral.ucdavis.edu/ontology/mco#>'),
          curl = getCurlHandle(username = username, password = passwd),
         ...)
{

#    if(length(ns)) 
#       q = paste( c(sprintf("PREFIX %s: %s", names(ns), ns), "", q), collapse = "\n")

    ans = SPARQL(url, query = q, ns = ns, addPrefix = TRUE,
                  username = username, password = passwd, httpauth = AUTH_BASIC, ..., curl = curl)
}

# This  assumes a modified version of the SPARQL package code that returns a  data frame with one column
# 

