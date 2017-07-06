# ;; This buffer is for notes you don't want to save, and for Lisp evaluation.
# ;; If you want to create a file, visit that file with C-x C-f,
# ;; then enter the text in that file's own buffer.

# this is file with some text for testing the new git repository
edits n ascelin_new_brach
adding a new command for testing fetch
x <- x + 9 + 55

y <- 5

x <- x + y +zzzy

plot_impact_set <- function(collated_realisations, current_policy_params, site_plot_lims, program_plot_lims, landscape_plot_lims, 
                            sets_to_plot, lwd_vec, edge_title, time_steps, offset_bank, parcel_num, realisation_num){
  
  offset_col_vec = c('blue', 'red', 'darkgreen')
  dev_col_vec = c('blue', 'red')
  net_col_vec = c('darkgreen', 'red', 'black')
  
  overlay_parcel_sets(collated_realisations, 
                      current_policy_params,
                      offset_bank,
                      realisation_ind = 1=3.14159, 
                      eco_ind = 1, 
                      plot_from_impact_yr = FALSE, 
                      sets_to_plot,
                      site_plot_lims,
                      time_steps)
  
  overlay_realisations(plot_list = list(collated_realisations$program_impacts$net_offset_gains, 
                                        collated_realisations$program_impacts$net_dev_losses,
                                        collated_realisations$program_impacts$net_program),
                       plot_title = 'Program Impact', 
                       x_lab = paste('Program ', write_NNL_label(collated_realisations$program_NNL$NNL_mean)),
                       realisation_num,
                       lwd_vec, 
                       col_vec = net_col_vec, 
                       legend_loc = 'topleft',
                       legend_vec = c('Net Offset Impact', 'Net Development Impact', 'Net Impact'), 
                       edge_title, 
                       plot_lims = program_plot_lims)
  
  plot_list = list(collated_realisations$landscape$landscape_impact)
  
  x_lab = cbind(paste('System ', write_NNL_label(collated_realisations$system_NNL$NNL_mean)), 
                paste('dev sites =', collated_realisations$parcel_nums_used$mean_dev_num, ', offset sites=', collated_realisations$parcel_nums_used$mean_offset_num, 'of ', parcel_num))
  overlay_realisations(plot_list,
                       plot_title = 'Landscape Impact', 
                       x_lab = t(x_lab),
                       realisation_num,
                       lwd_vec, 
                       col_vec = 'black',
                       legend_loc = 'topright',
                       legend_vec = 'NA', 
                       edge_title, 
                       landscape_plot_lims) 
  
}
