make_cluster <- function(dataf, dimension) {
  
  # transform character variables into factor to use tsne
  dataf <- dataf %>% dplyr::mutate_if(is.character, as.factor) 
  
  # compute similarity matrix that takes into account mixed type variables
  gower_dist <- daisy(dataf,
                      metric = "gower")
  
  summary(gower_dist)
  
  gower_mat <- as.matrix(gower_dist)

  # compute low dimensional representation of the data
  tsne_obj <- Rtsne(gower_dist, is_distance = TRUE, dims = dimension)
  
  # group around medoids = k-means with custom distance
  pam_fit <- pam(gower_dist, diss = TRUE, k = 3)
  
  ## according to the chosen dimension, plot the data
  if (dimension == 2){
    tsne_data <- tsne_obj$Y %>%
      data.frame() %>%
      setNames(c("X", "Y")) %>%
      mutate(cluster = factor(pam_fit$clustering)) %>%
      bind_cols(dataf)
    print(tsne_data$G3)
    
    tsne_data %>% 
      plot_ly(x = ~X, y = ~Y, color = ~cluster, 
             type='scatter', mode = "markers",
             text = ~G3,
             hovertemplate =  paste('<b>X</b>: %{x:.2f}<br>',
                                    '<b>Y</b>: %{y:.2f}<br>',
                                    '<b>Final Grade (over 20)</b>: %{text:.2f}')
             ) %>%
      layout(scene = list(xaxis = list(title = 'First Axis'),
                          yaxis = list(title = 'Second Axis')))
    
  }else{
    tsne_data <- tsne_obj$Y %>%
      data.frame() %>%
      setNames(c("X", "Y", "Z")) %>%
      mutate(cluster = factor(pam_fit$clustering)) %>%
      bind_cols(dataf)
    
    tsne_data %>% 
      plot_ly(x = ~X, y = ~Y, z = ~Z, color = ~cluster, 
              type = "scatter3d", mode = "markers", 
              text = ~G3,
              hovertemplate =  paste('<b>X</b>: %{x:.2f}<br>',
                                     '<b>Y</b>: %{y:.2f}<br>',
                                     '<b>Final Grade (over 20)</b>: %{text:.2f}')
              ) %>%
          layout(scene = list(xaxis = list(title = 'First Axis'),
                              yaxis = list(title = 'Second Axis'),
                              zaxis = list(title = '3rd Axis')))
  }
}



