#To find total number of packets dropped
BEGIN{
#initializing no. of packet droped to 0
pktdrp = 0;
}
{
# $1 means the first column in tracefile i.e. type identifier
event = $1;
# d as identifier means packet is dropped
	if(event == "d")
	{
		#incremeanting packet drop count as we find d as type identifier i.e. in first column
		pktdrp++;
	}
}
END{
printf("The number of packet dropped is: %d\n",pktdrp);
}
