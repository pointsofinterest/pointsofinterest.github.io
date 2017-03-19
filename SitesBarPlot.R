sites <- c()
area <- c()
siteselect.df <- data.frame(cbind(sites, area))

ggplot(data=siteselect.df, aes(x=area, y=site)) + 
    geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") + 
    guides(fill=FALSE) +
    xlab("Area") + ylab("Site") +
    ggtitle("Potential Site Area")