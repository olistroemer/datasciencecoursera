pollutantmean <- function(directory, pollutant, id = 1:332){
  combined <- NULL
  for (file in list.files(directory)[id]){
    combined <- rbind(combined, read.csv(paste(directory, "/", file, sep="")))
  }
  
  mean(combined[[pollutant]], na.rm = T)
}

complete <- function(directory, id = 1:332){
  files <- list.files(directory)
  result <- NULL
  for (i in id){
    result <- rbind(result,
                    data.frame(id=i,
                               nobs=sum(complete.cases(read.csv(paste(directory,
                                                                      "/",
                                                                      files[i],
                                                                      sep="")))
                                        )
                               )
                    )
  }
  
  result
}

corr <- function(directory, threshold = 0){
  files <- list.files(directory)
  result <- NULL
  for (i in 1:332){
    curfile <- read.csv(paste(directory, "/", files[i], sep=""))
    
    if (sum(complete.cases(curfile)) < threshold)
      next;
    
    result <- c(result, cor(curfile$sulfate, curfile$nitrate, use="na.or.complete"))
  }
  
  na.omit(result)
}