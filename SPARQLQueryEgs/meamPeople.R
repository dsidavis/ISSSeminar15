library(RSPARQL)
source("../repos/R/qmeamc.R")
#options(MEAMCentralPassword = "xxxx")


# Find the identifiers for all the people in MEAM central

people = qmeamc("select DISTINCT ?p WHERE { ?p rdf:type foaf:Person . } ")

dim(people$result)

head(people$result, 30)

# What are the first 24?
#  These are sub-types of foaf:Person
#  We could FILTER them out.
#
# And the remaining elements?
# These are the identifiers for the people
# Note the < >


# Let's see what information we have on the person
# <http://meamcentral.ucdavis.edu/ns/mc/person/04ktb89211>

info = qmeamc("SELECT ?p ?o WHERE {
            <http://meamcentral.ucdavis.edu/ns/mc/person/04ktb89211> ?p ?o .
          }")

info$result
