pollutantmean <- function(directory, pollutant, id = 1:332) {
  name.wd <- as.character(paste("d:/Program Files/", directory, sep = "")) 
  setwd(name.wd)
  files <- list.files(getwd())
  if(pollutant == "sulfate") {
    col.no <- 2} else if (pollutant == "nitrate") {
      col.no <- 3
    }
  dat <- data.frame()
  for(i in id) {
    id.csv <- files[i]
    dat <- rbind(dat, read.csv(id.csv))
  }
  dat_subset <- dat[, col.no]
  mean(dat_subset, na.rm = TRUE)
}