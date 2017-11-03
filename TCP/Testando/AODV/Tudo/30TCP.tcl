#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 18 nos utilizando protocolo DSR com a grade tendo 500 x 500
#Define as opcoes
set val(chan)           Channel/WirelessChannel    ;# channel type 
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation 
set val(netif)          Phy/WirelessPhy            ;# network interface type 

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue typei
set val(ll)             LL                         ;# link layer type 
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq 
set val(nn)             30                          ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol 
set val(x)              500                  ;# X dimension of topography
set val(y)              500                  ;# Y dimension of topography
set val(stop)           150               ;# time of simulation end

set ns          [new Simulator]
set tracefd       [open 30TCP.tr w] 
set windowVsTime2 [open win30TCP.tr w] 
set namtrace      [open simwrls30TCP.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

#define topografia 

set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y) 

 create-god $val(nn)


#Cria os nn nos moveis e atrela eles ao canal

     $ns node-config -adhocRouting $val(rp)\
             -llType $val(ll) \
             -macType $val(mac) \
            -ifqType $val(ifq) \
             -ifqLen $val(ifqlen) \
             -antType $val(ant) \
             -propType $val(prop) \
             -phyType $val(netif) \
             -channelType $val(chan) \
             -topoInstance $topo \
             -agentTrace ON \
             -routerTrace ON \
             -macTrace OFF \
             -movementTrace ON

	for {set i 0} {$i < $val(nn)} { incr i } {
	  set node_($i) [$ns node] 
	}


#Posicicoes iniciais dos nos

$node_(29) set X_ 200.0
$node_(29) set Y_ 0.0
$node_(29) set Z_ 0.0


$node_(28) set X_ 400.0
$node_(28) set Y_ 0.0
$node_(28) set Z_ 0.0


$node_(27) set X_ 200.0
$node_(27) set Y_ 100.0
$node_(27) set Z_ 0.0


$node_(26) set X_ 400.0
$node_(26) set Y_ 100.0
$node_(26) set Z_ 0.0


$node_(25) set X_ 200.0
$node_(25) set Y_ 200.0
$node_(25) set Z_ 0.0


$node_(24) set X_ 400.0
$node_(24) set Y_ 200.0
$node_(24) set Z_ 0.0


$node_(23) set X_ 200.0
$node_(23) set Y_ 300.0
$node_(23) set Z_ 0.0


$node_(22) set X_ 400.0
$node_(22) set Y_ 300.0
$node_(22) set Z_ 0.0


$node_(21) set X_ 200.0
$node_(21) set Y_ 400.0
$node_(21) set Z_ 0.0


$node_(20) set X_ 400.0
$node_(20) set Y_ 400.0
$node_(20) set Z_ 0.0


$node_(19) set X_ 200.0
$node_(19) set Y_ 500.0
$node_(19) set Z_ 0.0

$node_(18) set X_ 400.0
$node_(18) set Y_ 500.0
$node_(18) set Z_ 0.0
 
$node_(17) set X_ 500.0
$node_(17) set Y_ 500.0
$node_(17) set Z_ 0.0

$node_(16) set X_ 300.0
$node_(16) set Y_ 500.0
$node_(16) set Z_ 0.0

$node_(15) set X_ 100.0
$node_(15) set Y_ 500.0
$node_(15) set Z_ 0.0

$node_(14) set X_ 500.0
$node_(14) set Y_ 400.0
$node_(14) set Z_ 0.0

$node_(13) set X_ 300.0
$node_(13) set Y_ 400.0
$node_(13) set Z_ 0.0

$node_(12) set X_ 100.0
$node_(12) set Y_ 400.0
$node_(12) set Z_ 0.0

$node_(11) set X_ 500.0
$node_(11) set Y_ 300.0
$node_(11) set Z_ 0.0

$node_(10) set X_ 300.0
$node_(10) set Y_ 300.0
$node_(10) set Z_ 0.0

$node_(9) set X_ 100.0
$node_(9) set Y_ 300.0
$node_(9) set Z_ 0.0

$node_(8) set X_ 500.0
$node_(8) set Y_ 200.0
$node_(8) set Z_ 0.0

$node_(7) set X_ 300.0
$node_(7) set Y_ 200.0
$node_(7) set Z_ 0.0

$node_(6) set X_ 100.0
$node_(6) set Y_ 200.0
$node_(6) set Z_ 0.0

$node_(5) set X_ 500.0
$node_(5) set Y_ 100.0
$node_(5) set Z_ 0.0

$node_(4) set X_ 300.0
$node_(4) set Y_ 100.0
$node_(4) set Z_ 0.0

$node_(3) set X_ 100.0
$node_(3) set Y_ 100.0
$node_(3) set Z_ 0.0

$node_(2) set X_ 500.0
$node_(2) set Y_ 0.0
$node_(2) set Z_ 0.0

$node_(1) set X_ 300.0
$node_(1) set Y_ 0.0
$node_(1) set Z_ 0.0

$node_(0) set X_ 100.0
$node_(0) set Y_ 0.0
$node_(0) set Z_ 0.0

 
 
#Define a conexao TCP entre 16 e 0 Comecando em 16.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(16)  $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 16.0 "$ftp start"

#Define a conexao TCP entre 19 e 17 Comecando em 68.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(19)  $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 68.0 "$ftp start"

#Define a conexao TCP entre 15 e 25 Comecando em 141.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(15)  $tcp
$ns attach-agent $node_(25) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 141.0 "$ftp start"

#Define a conexao TCP entre 14 e 5 Comecando em 55.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(14)  $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 55.0 "$ftp start"

#Define a conexao TCP entre 4 e 19 Comecando em 6.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(4)  $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 6.0 "$ftp start"

#Define a conexao TCP entre 4 e 25 Comecando em 7.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(4)  $tcp
$ns attach-agent $node_(25) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 7.0 "$ftp start"

#Define a conexao TCP entre 10 e 15 Comecando em 12.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(10)  $tcp
$ns attach-agent $node_(15) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 12.0 "$ftp start"

#Define a conexao TCP entre 21 e 9 Comecando em 82.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(21)  $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 82.0 "$ftp start"

#Define a conexao TCP entre 16 e 4 Comecando em 20.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(16)  $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 20.0 "$ftp start"

#Define a conexao TCP entre 12 e 17 Comecando em 147.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(12)  $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 147.0 "$ftp start"

#Define a conexao TCP entre 17 e 7 Comecando em 108.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(17)  $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 108.0 "$ftp start"

#Define a conexao TCP entre 7 e 27 Comecando em 106.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(7)  $tcp
$ns attach-agent $node_(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 106.0 "$ftp start"

#Define a conexao TCP entre 12 e 22 Comecando em 90.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(12)  $tcp
$ns attach-agent $node_(22) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 90.0 "$ftp start"

#Define a conexao TCP entre 19 e 10 Comecando em 8.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(19)  $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 8.0 "$ftp start"

#Define a conexao TCP entre 28 e 15 Comecando em 76.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(28)  $tcp
$ns attach-agent $node_(15) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 76.0 "$ftp start"

#Define a conexao TCP entre 28 e 4 Comecando em 21.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(28)  $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 21.0 "$ftp start"

#Define a conexao TCP entre 15 e 8 Comecando em 100.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(15)  $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 100.0 "$ftp start"

#Define a conexao TCP entre 25 e 3 Comecando em 33.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(25)  $tcp
$ns attach-agent $node_(3) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 33.0 "$ftp start"

#Define a conexao TCP entre 4 e 16 Comecando em 92.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(4)  $tcp
$ns attach-agent $node_(16) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 92.0 "$ftp start"

#Define a conexao TCP entre 4 e 1 Comecando em 12.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(4)  $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 12.0 "$ftp start"

#Define a conexao TCP entre 28 e 24 Comecando em 146.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(28)  $tcp
$ns attach-agent $node_(24) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 146.0 "$ftp start"

#Define a conexao TCP entre 28 e 14 Comecando em 11.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(28)  $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 11.0 "$ftp start"

#Define a conexao TCP entre 5 e 28 Comecando em 10.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(5)  $tcp
$ns attach-agent $node_(28) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 10.0 "$ftp start"

#Define a conexao TCP entre 21 e 20 Comecando em 32.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(21)  $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 32.0 "$ftp start"

#Define a conexao TCP entre 0 e 12 Comecando em 64.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(0)  $tcp
$ns attach-agent $node_(12) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 64.0 "$ftp start"

#Define a conexao TCP entre 17 e 8 Comecando em 122.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(17)  $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 122.0 "$ftp start"

#Define a conexao TCP entre 26 e 1 Comecando em 72.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(26)  $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 72.0 "$ftp start"

#Define a conexao TCP entre 13 e 1 Comecando em 21.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(13)  $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 21.0 "$ftp start"

#Define a conexao TCP entre 16 e 21 Comecando em 80.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(16)  $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 80.0 "$ftp start"

#Define a conexao TCP entre 12 e 23 Comecando em 6.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(12)  $tcp
$ns attach-agent $node_(23) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 6.0 "$ftp start"

 #Exibe o tamanho da janela
proc plotWindow {tcpSource file} {
global ns 
set time 0.01 
set now [$ns now] 
set cwnd [$tcpSource set cwnd_] 
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.1 "plotWindow $tcp $windowVsTime2"


#Define os nos inicias no nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}


 #Mostra para os nos quando a simualacao termina
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}


 #termina nam e a simulacao
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 150.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

 $ns run
