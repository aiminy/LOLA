% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/postEnrichment.R
\name{extractEnrichmentOverlaps}
\alias{extractEnrichmentOverlaps}
\title{Given a single row from an enrichment table calculation,
finds the set of overlaps between the user set and the test set.
You can then use these, for example, to get sequences for those regions.}
\usage{
extractEnrichmentOverlaps(locResult, userSets, regionDB)
}
\arguments{
\item{locResult}{Results from runLOLA function}

\item{userSets}{User sets passed to the runLOLA function}

\item{regionDB}{Region database used}
}
\value{
userSets overlapping the supplied database entry.
}
\description{
Given a single row from an enrichment table calculation,
finds the set of overlaps between the user set and the test set.
You can then use these, for example, to get sequences for those regions.
}
\examples{
dbPath = system.file("extdata", "hg19", package="LOLA")
regionDB = loadRegionDB(dbLocation=dbPath)
data("sample_universe", package="LOLA")
data("sample_input", package="LOLA")

getRegionSet(regionDB, collections="ucsc_example", filenames="vistaEnhancers.bed")
getRegionSet(dbPath, collections="ucsc_example", filenames="vistaEnhancers.bed")

res = runLOLA(userSets, userUniverse, regionDB, cores=1)
locResult = res[2,]
extractEnrichmentOverlaps(locResult, userSets, regionDB)
writeCombinedEnrichment(locResult, "temp_outfolder")

userSetsRedefined =	redefineUserSets(userSets, userUniverse)
resRedefined = runLOLA(userSetsRedefined, userUniverse, regionDB, cores=1)
}

