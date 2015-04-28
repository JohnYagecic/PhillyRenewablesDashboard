# Retrieve and process photosynthetically active radiation data
# developed by John Yagecic, P.E.
#  JYagecic@gmail.com

# PAR data available at
# http://waterdata.usgs.gov/pa/nwis/uv/?site_no=01474500&PARAmeter_cd=00065,00060,00010

setwd("~/RenewablesDashboard")

require(dataRetrieval) # USGS library for accessing NWIS data


EndDate=format(Sys.Date(), "%Y-%m-%d") # Ending today 
BeginDate=format(Sys.Date()-1, "%Y-%m-%d") # Beginning yesterday

# Site 01474500 is the Schuylkill River at Philadelphia
# parameter code 99988 is PAR, but this may be a local (undefined) parameter code
myPAR<-readNWISdata(sites="01474500", parameterCd="99988", service="iv", startDate=BeginDate, endDate=EndDate)


myPAR

write.table(myPAR, file="SchuylkillPAR.csv", sep=",", row.names=FALSE)




