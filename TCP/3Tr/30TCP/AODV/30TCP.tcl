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

 
#Define a conexao TCP entre 1 e 13 Comecando em 15.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(1)  $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 15.0 "$ftp start"



#Define a conexao TCP entre 12 e 8 Comecando em 15.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(11)  $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 15.0 "$ftp start"


#Define a conexao TCP entre 0 e 13 Comecando em 15.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0)  $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp

 

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
