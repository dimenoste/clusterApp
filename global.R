# INSTALL DEPENDENCIES ----------------------------------------------------
source("./dependencies.R")
source("./functions/clustering.R")
source("./functions/select.R")

# DATA -----------------------------------

student <- read_delim("data/student-mat.csv", delim=";")

# SEED -----------------------------------
set.seed(1234) # for reproducibility


