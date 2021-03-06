% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotSpots.R
\name{plotSpots}
\alias{plotSpots}
\title{plotSpots}
\usage{
plotSpots(
  spe,
  x_coord = "pxl_row_in_fullres",
  y_coord = "pxl_col_in_fullres",
  cluster_id = NULL,
  palette = "libd_layer_colors"
)
}
\arguments{
\item{spe}{Input object (SpatialExperiment).}

\item{x_coord}{Name of column in spatialCoords slot containing x-coordinates.
Default = "pxl_row_in_fullres".}

\item{y_coord}{Name of column in spatialCoords slot containing x-coordinates.
Default = "pxl_col_in_fullres".}

\item{cluster_id}{Name of column in colData containing cluster IDs. To plot
without cluster labels, set "cluster_id = NULL". Default = "cluster_id".}

\item{palette}{Color palette for cluster labels. Options are
"libd_layer_colors", "Okabe-Ito", or providing a vector of hex codes for a
custom palette.}
}
\value{
Returns a ggplot object. Additional plot elements can be added as
  ggplot elements (e.g. title, formatting).
}
\description{
Plots for spatial transcriptomics datasets.
}
\details{
Functions to generate plots of spatial coordinates for spatial
transcriptomics datasets, optionally including cluster labels.

This function generates a plot showing spatial coordinates (spots) in the
physical x-y coordinates of the tissue slide. Cluster labels or ground truth
labels can be shown with colors.
}
\examples{
# to do

}
