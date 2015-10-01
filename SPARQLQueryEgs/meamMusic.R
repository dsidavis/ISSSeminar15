library(RSPARQL)
source("../repos/R/qmeamc.R")
#options(MEAMCentralPassword = "xxxx")

musicPO = qmeamc("select DISTINCT ?p ?o WHERE { ?music rdf:type mco:Music ; ?p ?o . } ")

table(grepl("mco#", musicPO$result[,1]))
musicPO$result[grep("mco#", musicPO$result[,1], invert = TRUE), ]


table(gsub(".*mco#", "", musicPO$result[,1]))


musicInfo = qmeamc("select DISTINCT ?music ?name ?artist ?year
                   WHERE {
                      ?music rdf:type mco:Music .
                      ?music mco:name ?name .
                      ?music mco:artist ?artist .
                      ?music mco:year ?year .
                   } ")



# Mistake - reusing ?p differently
#  peoplePO = qmeamc("select DISTINCT ?p ?o WHERE { ?p rdf:type foaf:Person ; ?p ?o . } ")

peoplePO = qmeamc("select DISTINCT ?p ?o WHERE { ?person rdf:type foaf:Person ; ?p ?o . } ")
# What about the non-mco entries
table(peoplePO$result[!(grepl("mco#", peoplePO$result[,1])), 1 ])

table(gsub( ".*mco#", "", peoplePO$result[(grepl("mco#", peoplePO$result[,1])), 1 ]))

# peoplePO = qmeamc("select DISTINCT ?p ?o WHERE { ?person owl:class foaf:Person ; ?p ?o . } ")





