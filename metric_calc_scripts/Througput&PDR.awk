# AWK Script for Throughput and Packet Delivery Ratio Calculation for OLD Trace Format

BEGIN {
	recvdSize = 0;
	startTime = 0;
	stopTime = 0;
	sent=0;
	received=0;
}
{
  # get the current time
  time=$2;
  pkt_size=$8;

  if($1=="s" && $4=="AGT")
   {
    sent++;
    if(time<startTime) {
    	time = startTime;
    }
   }
  else if($1=="r" && $4=="AGT")
   {
     received++;
     if(stopTime<time) {
     	stopTime=time;
     }
     recvdSize += pkt_size;
   }
 
}
END {
 printf " Packet Sent:%d",sent;
 printf "\n Packet Received:%d",received;
 printf "\n Packet Delivery Ratio:%.2f\n",(received/sent)*100;
 printf "\n Average Throughput[kbps] = %.2f\t StartTime=%.2f\t StopTime = %.2f\n", (recvdSize/(stopTime-startTime)) * (8/1024), startTime,stopTime;
}