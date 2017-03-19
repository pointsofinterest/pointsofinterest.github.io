Garibaldi[Garibaldi == -9999] = NA
Garibaldi = subset(Garibaldi, Garibaldi$STATION_NAME!="HUNTINGDON CA")
Garibaldi$PRCP = Garibaldi$PRCP * 25.4
Garibaldi$SNOW = Garibaldi$SNOW * 25.4
Garibaldi$TAVG = (Garibaldi$TAVG - 32) / 1.8
Garibaldi$TMAX = (Garibaldi$TMAX - 32) / 1.8
Garibaldi$TMIN = (Garibaldi$TMIN - 32) / 1.8

# Create the stations dataframe
ST_ID = ALLDATA$STATION_ID
ST_NAME = ALLDATA$STATION_NAME
ELEVATION = ALLDATA$ELEVATION
LAT = ALLDATA$LATITUDE
LONG = ALLDATA$LONGITUDE
STATIONS = data.frame(ST_ID, ST_NAME, ELEVATION, LAT, LONG)
STATIONS = distinct(select(STATIONS, ST_ID, ST_NAME, ELEVATION, LAT, LONG))

#Create the climate dataframe
ST_ID = ALLDATA$STATION_ID
DATE = ALLDATA$DATE
PRCP = ALLDATA$PRCP
SNOW = ALLDATA$SNOW
TAVG = ALLDATA$TAVG
TMAX = ALLDATA$TMAX
TMIN = ALLDATA$TMIN
CLIMATE = data.frame(ST_ID, DATE, PRCP, SNOW, TAVG, TMAX, TMIN)

#Create Abbotsford data frame ready to append
STATION_NAME = Abby_Climate$STATION_NAME
ELEVATION = Abby_Climate$ELEVATION
LATITUDE = Abby_Climate$LATITUDE
LONGITUDE = Abby_Climate$LONGITUDE
DATE = Abby_Climate$DATE
PRCP = Abby_Climate$PRCP
SNWD = Abby_Climate$SNWD
SNOW = Abby_Climate$SNOW
TAVG = Abby_Climate$TAVG
TMAX = Abby_Climate$TMAX
TMIN = Abby_Climate$TMIN
ST_ID = 31
ABBOTSFORD = data.frame(STATION_NAME, ELEVATION, LATITUDE, LONGITUDE,
                        DATE, PRCP, SNWD, SNOW, TAVG, TMAX, TMIN, ST_ID)
ABBOTSFORD[ABBOTSFORD == -9999] = NA

#Merge into one data frame
colnames(ABBOTSFORD) = colnames(Garibaldi)
ALLDATA = rbind(Garibaldi, ABBOTSFORD)

#Calculate TAVG where possible
ALLDATA$TAVG = rowMeans(ALLDATA[,c("TMIN", "TMAX")], na.rm = TRUE)

#SAVE
write.csv(ALLDATA, file = "AllClimate.csv")
write.csv(STATIONS, file = "ClimateStations.csv")
write.csv(CLIMATE, file = "Climate.csv")