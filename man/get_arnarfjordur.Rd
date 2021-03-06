% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_arnarfjordur.R
\name{get_arnarfjordur}
\alias{get_arnarfjordur}
\title{Get Sjókort}
\usage{
get_arnarfjordur(bbox = c(left = -24.03782, bottom = 65.61127, right =
  -23.17668, top = 65.83566), zoom = 11, maptype = c("sjm"), crop = TRUE,
  messaging = FALSE, urlonly = FALSE, color = c("color"), force = FALSE,
  where = tempdir(), ...)
}
\arguments{
\item{bbox}{a bounding box in the format c(lowerleftlon, lowerleftlat,
upperrightlon, upperrightlat).}

\item{zoom}{a zoom level}

\item{maptype}{only one type implemented here "sjm"}

\item{crop}{crop raw map tiles to specified bounding box}

\item{messaging}{turn messaging on/off}

\item{urlonly}{return url only}

\item{color}{only "color" implemented}

\item{force}{if the map is on file, should a new map be looked up?}

\item{where}{where should the file drawer be located (without terminating "/")}

\item{...}{...}
}
\value{
a ggmap object (a classed raster object with a bounding box attribute)
}
\description{
\code{get_arnarfjordur} accesses a tile server for a multibeam map of
Arnarfjörður and
downloads/stitches map tiles/formats a map image.
}
\seealso{
\code{\link{ggmap}}
}

