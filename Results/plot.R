x=c(seq(10,70,10))
# aodv
y=c(97.22,96.61,95.08,96.62,95.78,93.89,93.70)
# dsdv
y1 = c(98.76,98.64,97.91,98.78,98.37,97.53,96.32)
# dsr
y2 = c(99.16,44.44,43.59,76.33,37.29,27.45,26.98)

y = 100-y
y1 = 100-y1
y2 = 100-y2

y

y1

y2

setwd("~/Documents/Vanet-Guindy/")

png("PacketLoss.png")

plot(x,y,type="b", col = "red", xlab = "Number of Vehicles", ylab = "Packet Loss (%)", xlim = c(min(x),max(x)), ylim = c(min(y,y1,y2)-5, max(y,y1,y2)+15), cex=1.5)

lines(x,y1,col="#4CAF50",type="b", cex = 1.5)

lines(x,y2,col="blue",type="b", cex = 1.5)

legend(20, max(y,y1,y2)+15, legend=c("AODV", "DSDV", "DSR"),
       col=c("red", "#4CAF50", "blue"), lty=1:2, cex=0.8)

dev.off()