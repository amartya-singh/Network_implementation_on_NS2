#creating simulator object
set ns [new Simulator]

#Open NAM file in write mode (nf is NAM file handle)
set nf [open out.nam w]
#to write all details in the file handler i.e. NAM file
$ns namtrace-all $nf

#open trace file in write mode (nt is TRACE file handler)
set nt [open test.tr w]
#to write all detials in the trace file
$ns trace-all $nt

#define  a 'finish' procedure
proc finish {} {
	global ns nf nt
	$ns flush-trace
	#close the NAM & trace file
	close $nf
	close $nt
	#Excute NAM on trace file
	exec nam out.nam &
	exit 0
}

#creating four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#seting color & shape of nodes
$n0 color blue
$n0 shape box

$n1 color red
$n2 color green
$n3 color orange
$n4 color brown

#defining colors for data flow
$ns color 0 Blue
$ns color 1 Red
$ns color 2 Green
$ns color 3 Orange
$ns color 4 Brown

#creating links between the nodes with bandwidth of 1 MB, delay of 10 milli-seconds
#droptail & SFQ are active queue management algorithm
$ns duplex-link $n1 $n0 1Mb 10ms DropTail
$ns duplex-link $n2 $n0 1Mb 10ms DropTail
$ns duplex-link $n3 $n0 1Mb 10ms DropTail
$ns duplex-link $n4 $n0 1Mb 10ms DropTail

#orientation of nodes
$ns duplex-link-op $n0 $n1 orient up
$ns duplex-link-op $n0 $n2 orient right
$ns duplex-link-op $n0 $n3 orient down
$ns duplex-link-op $n0 $n4 orient left

#label the nodes
$ns at 0.0 "$n0 label node0"
$ns at 0.0 "$n1 label node1"
$ns at 0.0 "$n2 label node2"
$ns at 0.0 "$n3 label node3"
$ns at 0.0 "$n4 label node4"

###############################Node n0#############################

#create a UDP agent and attach it to node n0
set udp0 [new Agent/UDP]
$udp0 set fid_ 0
$ns attach-agent $n0 $udp0

#create a CBR traffic source & attach it to UDP0 i.e node n0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

#create a TCP agent and attach it to node n0
set tcp0 [new Agent/TCP]
$tcp0 set fid_ 0
$ns attach-agent $n0 $tcp0

#create a FTP source & attach it to TCP0 i.e node n0
set ftp0 [new Application/FTP]
$ftp0 set packetSize_ 500
$ftp0 set interval_ 0.005
$ftp0 attach-agent $tcp0

#Create a UDP SINK agent (a traffic sink) & attach it to node n0
set udp_sink0 [new Agent/Null]
$ns attach-agent $n0 $udp_sink0

#Create a TCP SINK agent (a traffic sink) & attach it to node n0
set tcp_sink0 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp_sink0

#####################################Node n1###################### 
#create a UDP agent and attach it to node n1
set udp1 [new Agent/UDP]
$udp1 set fid_ 1
$ns attach-agent $n1 $udp1

#create a CBR traffic source & attach it to UDP1 i.e node n1
set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.005
$cbr1 attach-agent $udp1

#create a TCP agent and attach it to node n1
set tcp1 [new Agent/TCP]
$tcp1 set fid_ 1
$ns attach-agent $n1 $tcp1

#create a FTP source & attach it to TCP1 i.e node n1
set ftp1 [new Application/FTP]
$ftp1 set packetSize_ 500
$ftp1 set interval_ 0.005
$ftp1 attach-agent $tcp1

#Create a UDP SINK agent (a traffic sink) & attach it to node n1
set udp_sink1 [new Agent/Null]
$ns attach-agent $n1 $udp_sink1

#Create a TCP SINK agent (a traffic sink) & attach it to node n1
set tcp_sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $tcp_sink1

#############################Node n2##############################
 
#create a UDP agent and attach it to node n2
set udp2 [new Agent/UDP]
$udp2 set fid_ 2
$ns attach-agent $n2 $udp2

#create a CBR traffic source & attach it to UDP2 i.e node n2
set cbr2 [new Application/Traffic/CBR]
$cbr2 set packetSize_ 500
$cbr2 set interval_ 0.005
$cbr2 attach-agent $udp2

#create a TCP agent and attach it to node n2
set tcp2 [new Agent/TCP]
$tcp2 set fid_ 2
$ns attach-agent $n2 $tcp2

#create a FTP source & attach it to TCP2 i.e node n2
set ftp2 [new Application/FTP]
$ftp2 set packetSize_ 500
$ftp2 set interval_ 0.005
$ftp2 attach-agent $tcp2

#Create a UDP SINK agent (a traffic sink) & attach it to node n2
set udp_sink2 [new Agent/Null]
$ns attach-agent $n2 $udp_sink2

#Create a TCP SINK agent (a traffic sink) & attach it to node n2
set tcp_sink2 [new Agent/TCPSink]
$ns attach-agent $n2 $tcp_sink2

#################################Node n3###########################
#create a UDP agent and attach it to node n3
set udp3 [new Agent/UDP]
$udp3 set fid_ 3
$ns attach-agent $n3 $udp3

#create a CBR traffic source & attach it to UDP3 i.e node n3
set cbr3 [new Application/Traffic/CBR]
$cbr3 set packetSize_ 500
$cbr3 set interval_ 0.005
$cbr3 attach-agent $udp3

#create a TCP agent and attach it to node n3
set tcp3 [new Agent/TCP]
$tcp3 set fid_ 3
$ns attach-agent $n3 $tcp3

#create a FTP source & attach it to TCP3 i.e node n3
set ftp3 [new Application/FTP]
$ftp3 set packetSize_ 500
$ftp3 set interval_ 0.005
$ftp3 attach-agent $tcp3

#Create a UDP SINK agent (a traffic sink) & attach it to node n3
set udp_sink3 [new Agent/Null]
$ns attach-agent $n3 $udp_sink3
#Create a TCP SINK agent (a traffic sink) & attach it to node n3
set tcp_sink3 [new Agent/TCPSink]
$ns attach-agent $n3 $tcp_sink3

#############################Node n4 ###########################

#create a UDP agent and attach it to node n4
set udp4 [new Agent/UDP]
$udp4 set fid_ 4
$ns attach-agent $n4 $udp4

#create a CBR traffic source & attach it to UDP4 i.e node n4
set cbr4 [new Application/Traffic/CBR]
$cbr4 set packetSize_ 500
$cbr4 set interval_ 0.005
$cbr4 attach-agent $udp4

#create a TCP agent and attach it to node n4
set tcp4 [new Agent/TCP]
$tcp4 set fid_ 4
$ns attach-agent $n4 $tcp4

#create a FTP source & attach it to TCP4 i.e node n4
set ftp4 [new Application/FTP]
$ftp4 set packetSize_ 500
$ftp4 set interval_ 0.005
$ftp4 attach-agent $tcp4

#Create a UDP SINK agent (a traffic sink) & attach it to node n4
set udp_sink4 [new Agent/Null]
$ns attach-agent $n4 $udp_sink4
#Create a TCP SINK agent (a traffic sink) & attach it to node n4
set tcp_sink4 [new Agent/TCPSink]
$ns attach-agent $n4 $tcp_sink4

###################################################################

#Connect the traffic sources with the traffic sink
$ns connect $tcp0 $tcp_sink1
$ns connect $udp0 $udp_sink2

$ns connect $tcp1 $tcp_sink2
$ns connect $udp1 $udp_sink3

$ns connect $tcp2 $tcp_sink3
$ns connect $udp2 $udp_sink4

$ns connect $tcp3 $tcp_sink4
$ns connect $udp3 $udp_sink0

$ns connect $tcp4 $tcp_sink0
$ns connect $udp4 $udp_sink1

#Schedule events for the CBR agents. Simulation time are given in seconds
$ns at 0.5 "$ftp0 start"
$ns at 0.5 "$cbr0 start"
$ns at 0.5 "$ftp1 start"
$ns at 0.5 "$cbr1 start"
$ns at 0.5 "$ftp2 start"
$ns at 0.5 "$cbr2 start"
$ns at 0.5 "$ftp3 start"
$ns at 0.5 "$cbr3 start"
$ns at 0.5 "$ftp4 start"
$ns at 0.5 "$cbr4 start"

$ns at 4.5 "$ftp0 stop"
$ns at 4.5 "$cbr0 stop"
$ns at 4.5 "$ftp1 stop"
$ns at 4.5 "$cbr1 stop"
$ns at 4.5 "$ftp2 stop"
$ns at 4.5 "$cbr2 stop"
$ns at 4.5 "$ftp3 stop"
$ns at 4.5 "$cbr3 stop"
$ns at 4.5 "$ftp4 stop"
$ns at 4.5 "$cbr4 stop"

#Call the finish procedure after 5 seconds of simulation time
#finish procedure closes the nf which is file handler of NAM trace file and opens the network animator
$ns at 5.0 "finish"

#Run the simulation
$ns run
