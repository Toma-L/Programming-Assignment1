complete <- function(directory, id = 1:332) {
  name.wd <- as.character(paste("d:/Program Files/", directory, sep = "")) 
  setwd(name.wd)
  files <- list.files(getwd())
  id.vec = vector(mode = "numeric", length = length(id))
  nobs.vec = vector(mode = "numeric", length = length(id))  
  df <- data.frame("id", "nobs")
  for(i in id) {
    id.vec = id
    file.i <- read.csv(files[i])
    good.file.i <- complete.cases(file.i[, 2], file.i[, 3])
    file.i.new <- file.i[good.file.i, ]
    nobs.vec[which(id.vec == i)] = nrow(file.i.new)
  }
  df <- data.frame("id" = id.vec, "nobs" = nobs.vec)
  print(df)
}