# In which column are the relevant data? 
columns <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

data <- read.csv("outcome-of-care-measures.csv", colClasses = c("character"))

# Convert relevant columns to numeric
for (c in columns){
  data[,c] <- as.numeric(data[,c])
}

# Split data by state
sdata <- split(data, data$State)

rankall <- function(outcome, num = "best"){
  # Check argument
  if (!outcome %in% names(columns)) stop("invalid outcome")
  
  r <- function(x){
    ordered <- x[order(x[,columns[outcome]],x$Hospital.Name, na.last = NA),]
    
    if (num == "best"){
      head(ordered,1)[,c("Hospital.Name", "State")]
    }
    else if (num == "worst"){
      tail(ordered,1)[,c("Hospital.Name", "State")]
    }
    else {
      ordered[num, c("Hospital.Name", "State")]
    }
  }
  
  result <- do.call(rbind, lapply(sdata, r))
  colnames(result) <- c("hospital", "state")
  result
}
