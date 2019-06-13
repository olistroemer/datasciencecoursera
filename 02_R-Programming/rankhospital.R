# In which column are the relevant data? 
columns <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

data <- read.csv("outcome-of-care-measures.csv", colClasses = c("character"))

# Convert relevant columns to numeric
for (c in columns){
  data[,c] <- as.numeric(data[,c])
}

rankhospital <- function(state, outcome, num = "best"){
  # Check arguments
  if (!state %in% data$State) stop("invalid state")
  if (!outcome %in% names(columns)) stop("invalid outcome")
  
  # Filter data by state
  statedata <- data[data$State == state,]
  ordered <- statedata[order(statedata[,columns[outcome]],statedata$Hospital.Name, na.last = NA),]
  
  if (num == "best"){
    head(ordered,1)$Hospital.Name
  }
  else if (num == "worst"){
    tail(ordered,1)$Hospital.Name
  }
  else {
    ordered[num, "Hospital.Name"]
  }
}
