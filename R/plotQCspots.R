#' plotQCspots
#' 
#' Quality control (QC) plots for spatial transcriptomics datasets.
#' 
#' Functions to generate quality control (QC) plots for spatial transcriptomics
#' datasets.
#' 
#' This function generates a plot identifying spatial coordinates (spots) that
#' do not meet quality control (QC) metrics (i.e. discarded spots). Spots are
#' shown in the physical x-y coordinates of the tissue slide. If discarded spots
#' correspond to known anatomical/histological or other biological regions of
#' interest, this may be problematic for downstream analyses.
#' 
#' 
#' @param spe Input object (SpatialExperiment).
#' 
#' @param x_coord Name of column in spatialCoords slot containing x-coordinates.
#'   Default = "pxl_row_in_fullres".
#' 
#' @param y_coord Name of column in spatialCoords slot containing x-coordinates.
#'   Default = "pxl_col_in_fullres".
#' 
#' @param discard Name of column in colData identifying spots to be discarded
#'   (TRUE/FALSE values). Default = "discard".
#' 
#' @return Returns a ggplot object. Additional plot elements can be added as
#'   ggplot elements (e.g. title, formatting).
#' 
#' 
#' @importFrom rlang sym "!!"
#' @importFrom SpatialExperiment spatialCoords
#' @importFrom SingleCellExperiment colData
#' @importFrom ggplot2 ggplot aes geom_point coord_fixed scale_y_reverse
#'   scale_color_manual ggtitle theme_bw theme element_blank
#' 
#' @export
#' 
#' @examples
#' # to do
#' 
plotQCspots <- function(spe, 
                        x_coord = "pxl_row_in_fullres", y_coord = "pxl_col_in_fullres", 
                        discard = "discard") {
  
  # note: using quasiquotation to allow custom variable names in ggplot ("sym" and "!!")
  
  x_coord <- sym(x_coord)
  y_coord <- sym(y_coord)
  discard <- sym(discard)
  
  stopifnot("barcode_id" %in% colnames(colData(spe)))
  stopifnot("barcode_id" %in% colnames(spatialCoords(spe)))
  stopifnot(all(colData(spe)$barcode_id == spatialCoords(spe)$barcode_id))
  
  ix <- which(colnames(spatialCoords(spe)) == "barcode_id")
  df <- cbind(as.data.frame(colData(spe)), as.data.frame(spatialCoords(spe))[, -ix])
  
  p <- ggplot(df, aes(x = !!x_coord, y = !!y_coord, color = !!discard)) + 
    geom_point(size = 0.5) + 
    coord_fixed() + 
    scale_y_reverse() + 
    scale_color_manual(values = c("gray85", "red")) + 
    ggtitle("QC: discarded spots") + 
    theme_bw() + 
    theme(panel.grid = element_blank(), 
          axis.title = element_blank(), 
          axis.text = element_blank(), 
          axis.ticks = element_blank())
  
  p
  
}

