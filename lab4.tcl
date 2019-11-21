set ns [ new Simulator]
set tf [ open lab4.tr w]
$ns trace-all $tf
set nf [ open lab4.nam w]
$ns namtrace-all $nf
$ns color 1 "red"
$ns color 2 "blue"
$ns color 3 "green"
set n0 [ $ns node]
set n1 [ $ns node]
set n2 [ $ns node]
set n3 [ $ns node]
set n4 [ $ns node]
$ns make-lan "$n0 $n1 $n2 $n3 $n4" 100Mb 10ms LL Queue/DropTail Mac/802_3
set tcp0 [ new Agent/TCP]
$ns attach-agent $n0 $tcp0
set ftp0 [ new Application/FTP]
$ftp0 attach-agent $tcp0
set sink2 [ new Agent/TCPSink]
$ns attach-agent $n2 $sink2
$ns connect $tcp0 $sink2
set udp2 [ new Agent/UDP]
$ns attach-agent $n2 $udp2
set cbr2 [ new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
set null1 [ new Agent/Null]
$ns attach-agent $n1 $null1
$ns connect $udp2 $null1
set tcp1 [ new Agent/TCP]
$ns attach-agent $n1 $tcp1
set ftp1 [ new Application/FTP]
$ftp1 attach-agent $tcp1
set sink3 [ new Agent/TCPSink]
$ns attach-agent $n3 $sink3
$ns connect $tcp1 $sink3
$tcp0 set class_ 1
$udp2 set class_ 2
$tcp1 set class_ 3
$udp2 set interval_ 0.001
$ftp1 set interval_ 0.001
proc finish {} {
global ns tf nf
$ns flush-trace
exec nam lab4.nam &
close $tf
close $nf
exit 0
}
$ns at 0.1 "$cbr2 start"
$ns at 1.2 "$ftp1 start"
$ns at 1.3 "$ftp0 start"
$ns at 9.5 "$cbr2 stop"
$ns at 9.5 "$ftp1 stop"
$ns at 10.5 "$ftp0 stop"
$ns at 10.0 "finish"
$ns run
