library(reshape2)
library(plyr)
library(dplyr)

Climate$DATE = as.Date(as.character(Climate$DATE), format = "%Y%m%d")
Climate$MONTH = as.numeric(format(Climate$DATE, "%m"))
Climate$YEAR = as.numeric(format(Climate$DATE, "%"))


# melt...

#molten = melt(Climate, id = )
Climate1 = dcast(Climate, YEAR ~ variable, mean, na.rm = TRUE)

View(Climate1)