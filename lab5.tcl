set ns [ new Simulator]
set tf [ open lab5.tr w]
$ns trace-all $tf
set nf [ open lab5.nam w]
$ns namtrace-all $nf
$ns color 1 "red"
$ns color 2 "blue"
set n0 [ $ns node]
set n1 [ $ns node]
set n2 [ $ns node]
set n3 [ $ns node]
set n4 [ $ns node]
set n5 [ $ns node]
set n6 [ $ns node]
$n0 label "ping0"
$n2 label "router"
$n4 label "ping4"
$n5 label "ping5"
$n6 label "ping6"
$ns duplex-link $n0 $n2 100Mb 300ms DropTail
$ns duplex-link $n1 $n2 1Mb 300ms DropTail
$ns duplex-link $n3 $n2 1Mb 300ms DropTail
$ns duplex-link $n4 $n2 1Mb 300ms DropTail
$ns duplex-link $n5 $n2 100Mb 300ms DropTail
$ns duplex-link $n6 $n2 1Mb 300ms DropTail
$ns queue-limit $n0 $n2 5
$ns queue-limit $n4 $n2 2
$ns queue-limit $n5 $n2 5
$ns queue-limit $n6 $n2 3
set ping0 [ new Agent/Ping]
$ns attach-agent $n0 $ping0
set ping4 [ new Agent/Ping]
$ns attach-agent $n4 $ping4
set ping5 [ new Agent/Ping]
$ns attach-agent $n5 $ping5
set ping6 [ new Agent/Ping]
$ns attach-agent $n6 $ping6
$ns connect $ping0 $ping4
$ns connect $ping5 $ping6
$ping0 set class_ 1
$ping5 set class_ 2
$ping0 set packetSize_ 50000
$ping5 set packetSize_ 50000
$ping0 set interval_ 0.00001
$ping5 set interval_ 0.00001
Agent/Ping instproc recv {from rtt} {
	$self instvar node_
puts "The node [$node_ id] received a reply from $from with a round trip time of  $rtt"
}
$ns at 0.1 "$ping0 send"
$ns at 0.2 "$ping0 send"
$ns at 0.3 "$ping0 send"
$ns at 0.4 "$ping0 send"
$ns at 0.5 "$ping0 send"
$ns at 0.6 "$ping0 send"
$ns at 0.7 "$ping0 send"
$ns at 0.8 "$ping0 send"
$ns at 0.9 "$ping0 send"
$ns at 1.0 "$ping0 send"
$ns at 1.1 "$ping0 send"
$ns at 1.2 "$ping0 send"
$ns at 1.3 "$ping0 send"
$ns at 1.4 "$ping0 send"
$ns at 1.5 "$ping0 send"
$ns at 1.6 "$ping0 send"
$ns at 1.7 "$ping0 send"
$ns at 1.8 "$ping0 send"
$ns at 1.9 "$ping0 send"
$ns at 0.1 "$ping5 send"
$ns at 0.2 "$ping5 send"
$ns at 0.3 "$ping5 send"
$ns at 0.4 "$ping5 send"
$ns at 0.5 "$ping5 send"
$ns at 0.6 "$ping5 send"
$ns at 0.7 "$ping5 send"
$ns at 0.8 "$ping5 send"
$ns at 0.9 "$ping5 send"
$ns at 1.0 "$ping5 send"
$ns at 1.1 "$ping5 send"
$ns at 1.2 "$ping5 send"
$ns at 1.3 "$ping5 send"
$ns at 1.4 "$ping5 send"
$ns at 1.5 "$ping5 send"
$ns at 1.6 "$ping5 send"
$ns at 1.7 "$ping5 send"
$ns at 1.8 "$ping5 send"
$ns at 1.9 "$ping5 send"
proc finish {} {
global ns tf nf
$ns flush-trace
exec nam lab5.nam &
close $tf
close $nf
exit 0
}
$ns at 5.0 "finish"
$ns run


