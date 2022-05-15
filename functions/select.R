select_data <- function(data, vars, grade){
  # select variables
  if (length(vars) == 0) {
    return(data)
  } else {
    # and transform character variables into factor to use tsne
    dataf <- data %>% 
      select(!!!vars, !!!grade) %>% 
      dplyr::mutate_if(is.character, as.factor) 
    return(dataf)
  }

}

