corr <- function(directory, threshold = 0) {
  all.cases <- complete(directory, id = 1:332)
  cor.vec <- vector(mode = "numeric")
  no.file.list <- vector(mode = "numeric")
  files <- list.files(getwd())
  no.file.j <- all.cases[which(all.cases$nobs > threshold), 1]
  for(k in no.file.j) {
        file.j <- read.csv(files[k])
        good.file.j <- complete.cases(file.j[, 2], file.j[, 3])
        file.j.new <- file.j[good.file.j, ]
        get.cr.k <- cor(file.j.new[, 2], file.j.new[, 3])
        round.cr.k <- round(get.cr.k, 4)
        cor.vec[length(cor.vec)+1] <- round.cr.k 
      }
  cor.vec
}