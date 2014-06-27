best = function(state, outcome){
  ## Read outcome data
  ocmeasures = read.csv("~/Documents/R Programming/Progamming/Assignment 3/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
#  validStates = c(AL,AK,AZ,AR,CA,CO,CT,DE,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY)
  validStates = c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")
  validOutcomes = c("heart attack","heart failure","pneumonia")
  colnames(ocmeasures)[11]="heart attack"
  colnames(ocmeasures)[17]="heart failure"
  colnames(ocmeasures)[23]="pneumonia"

  ## Check that state and outcome are validlin
  if (!(any(validStates==state))) stop("invalid state")
  if (!(any(validOutcomes==outcome))) stop("invalid outcome")

  ## Return hospital name in that state with lowest 30-day death
  outcomeST = ocmeasures[ocmeasures$State == state,]
  state_min = which.min(outcomeST[, outcome])
  return (outcomeST[state_min, "Hospital.Name"])

  ## rate

}