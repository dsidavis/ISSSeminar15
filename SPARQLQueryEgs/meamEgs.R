source('../repos/R/qmeamc.R')
mc.types = getTypes(fun = qmeamc)
mc.classes = getClasses(fun = qmeamc)
mc.preds = getPredicates(fun = qmeamc)


# 
ans = qmeamc("SELECT ?s WHERE { ?s rdf:type mco:Memory .}")


ans = qmeamc("SELECT ?s WHERE { ?s rdf:type mco:PersonType .}")


ans = qmeamc("SELECT ?p ?val WHERE { ?s rdf:type mco:Place .
                                     ?s ?p ?val .       
                              }")


ans = qmeamc("SELECT ?val WHERE { ?s rdf:type mco:Place .
                                  ?s rdfs:label ?val .       
                              }")



# Who heard what song
ans = qmeamc("SELECT ?who  ?what WHERE { ?who mco:heard $what .}")

ans = qmeamc("SELECT ?name  ?what WHERE { ?who mco:heard $what .
                                          ?who mco:name ?name .
                                       }")




memory = qmeamc("select DISTINCT ?em WHERE { ?em mco:evokedBy [] . } ")
memory$result[1,1]
z = qmeamc(sprintf("select ?p ?val WHERE { %s ?p ?val . }", memory$results[1,1]))

zz = qmeamc(sprintf("select ?val WHERE { %s mco:hasDescription ?val . }", memory$results[1,1]))
# zz contains a bnode
zz$results[1,1]
# If we ask the  bnode for its predicates and values, we get the entire database!!!
#XXX zzz = qmeamc(sprintf("select ?p ?val WHERE { %s ?p ?val . }", z$results[1,1]))

# Deal with the bnode by knowing the predicate/property we want.
zz = qmeamc(sprintf("select ?val WHERE { %s mco:hasDescription ?bval .
                                         ?bval  mco:hasText ?val}", memory$results[1,1]))
zz$results[1, 1]






z = qmeamc(sprintf("select ?val WHERE { %s mco:hasDescription ?val . }", memory$results[1,1]))
