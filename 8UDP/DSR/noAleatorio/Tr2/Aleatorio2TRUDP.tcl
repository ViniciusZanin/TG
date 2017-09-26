#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 8 nos utilizando protocolo AODV com a grade tendo 500 x 500
#Define as opcoes
set val(chan)           Channel/WirelessChannel    ;# channel type 
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation 
set val(netif)          Phy/WirelessPhy            ;# network interface type 

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue typei
set val(ll)             LL                         ;# link layer type 
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq 
set val(nn)             8                          ;# number of mobilenodes
set val(rp)             DSR                       ;# routing protocol 
set val(x)              500                  ;# X dimension of topography
set val(y)              500                  ;# Y dimension of topography
set val(stop)           150               ;# time of simulation end

set ns          [new Simulator]
set tracefd       [open Aleatorio2TRUDP.tr w] 
set windowVsTime2 [open winAleatorio2TRUDP.tr w] 
set namtrace      [open simwrlsAleatorio2TRUDP.nam w]

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
 
$node_(7) set X_ 350.0
$node_(7) set Y_ 105.0
$node_(7) set Z_ 0.0

$node_(6) set X_ 300.0
$node_(6) set Y_ 453.0
$node_(6) set Z_ 0.0

$node_(5) set X_ 35.0
$node_(5) set Y_ 145.0
$node_(5) set Z_ 0.0

$node_(4) set X_ 87.0
$node_(4) set Y_ 351.0
$node_(4) set Z_ 0.0

$node_(3) set X_ 210.0
$node_(3) set Y_ 497.0
$node_(3) set Z_ 0.0

$node_(2) set X_ 310.0
$node_(2) set Y_ 310.0
$node_(2) set Z_ 0.0

$node_(1) set X_ 392.0
$node_(1) set Y_ 68.0
$node_(1) set Z_ 0.0

$node_(0) set X_ 272.0
$node_(0) set Y_ 186.0
$node_(0) set Z_ 0.0

 
 #Define a conexao UDP entre 1 e3 Comecando em 15.0
set udp_(2) [new Agent/UDP]
$ns attach-agent $node_(1) $udp_(2)
set null_(2) [new Agent/Null]
$ns attach-agent $node_(3) $null_(2)
set cbr_(2) [new Application/Traffic/CBR]
$cbr_(2) set packetSize_ 512
$cbr_(2) set interval_ 0.05
$cbr_(2) set random_ 1
$cbr_(2) set maxpkts_ 10000
$cbr_(2) attach-agent $udp_(2)
$ns connect $udp_(2) $null_(2)
$ns at 15.0 "$cbr_(2) start"
 #Define a conexao UDP entre 5 e3 Comecando em 15.0
set udp_(1) [new Agent/UDP]
$ns attach-agent $node_(5) $udp_(1)
set null_(1) [new Agent/Null]
$ns attach-agent $node_(3) $null_(1)
set cbr_(1) [new Application/Traffic/CBR]
$cbr_(1) set packetSize_ 512
$cbr_(1) set interval_ 0.05
$cbr_(1) set random_ 1
$cbr_(1) set maxpkts_ 10000
$cbr_(1) attach-agent $udp_(1)
$ns connect $udp_(1) $null_(1)
$ns at 15.0 "$cbr_(1) start"

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
