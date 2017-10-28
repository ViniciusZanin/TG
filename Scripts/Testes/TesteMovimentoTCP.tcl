#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 50 nos utilizando protocolo AODV com a grade tendo 500 x 500
#Define as opcoes
set val(chan)           Channel/WirelessChannel    ;# channel type 
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation 
set val(netif)          Phy/WirelessPhy            ;# network interface type 

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue typei
set val(ll)             LL                         ;# link layer type 
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq 
set val(nn)             50                          ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol 
set val(x)              500                  ;# X dimension of topography
set val(y)              500                  ;# Y dimension of topography
set val(stop)           345               ;# time of simulation end

set ns          [new Simulator]
set tracefd       [open TesteMovimentoTCP.tr w] 
set windowVsTime2 [open winTesteMovimentoTCP.tr w] 
set namtrace      [open simwrlsTesteMovimentoTCP.nam w]

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
 
$node_(49) set X_ 309.0
$node_(49) set Y_ 214.0
$node_(49) set Z_ 0.0

$node_(48) set X_ 20.0
$node_(48) set Y_ 188.0
$node_(48) set Z_ 0.0

$node_(47) set X_ 435.0
$node_(47) set Y_ 373.0
$node_(47) set Z_ 0.0

$node_(46) set X_ 323.0
$node_(46) set Y_ 348.0
$node_(46) set Z_ 0.0

$node_(45) set X_ 152.0
$node_(45) set Y_ 467.0
$node_(45) set Z_ 0.0

$node_(44) set X_ 424.0
$node_(44) set Y_ 175.0
$node_(44) set Z_ 0.0

$node_(43) set X_ 336.0
$node_(43) set Y_ 495.0
$node_(43) set Z_ 0.0

$node_(42) set X_ 444.0
$node_(42) set Y_ 113.0
$node_(42) set Z_ 0.0

$node_(41) set X_ 143.0
$node_(41) set Y_ 483.0
$node_(41) set Z_ 0.0

$node_(40) set X_ 452.0
$node_(40) set Y_ 369.0
$node_(40) set Z_ 0.0

$node_(39) set X_ 185.0
$node_(39) set Y_ 274.0
$node_(39) set Z_ 0.0

$node_(38) set X_ 398.0
$node_(38) set Y_ 391.0
$node_(38) set Z_ 0.0

$node_(37) set X_ 195.0
$node_(37) set Y_ 227.0
$node_(37) set Z_ 0.0

$node_(36) set X_ 210.0
$node_(36) set Y_ 439.0
$node_(36) set Z_ 0.0

$node_(35) set X_ 210.0
$node_(35) set Y_ 129.0
$node_(35) set Z_ 0.0

$node_(34) set X_ 252.0
$node_(34) set Y_ 264.0
$node_(34) set Z_ 0.0

$node_(33) set X_ 21.0
$node_(33) set Y_ 453.0
$node_(33) set Z_ 0.0

$node_(32) set X_ 27.0
$node_(32) set Y_ 28.0
$node_(32) set Z_ 0.0

$node_(31) set X_ 237.0
$node_(31) set Y_ 476.0
$node_(31) set Z_ 0.0

$node_(30) set X_ 379.0
$node_(30) set Y_ 201.0
$node_(30) set Z_ 0.0

$node_(29) set X_ 148.0
$node_(29) set Y_ 416.0
$node_(29) set Z_ 0.0

$node_(28) set X_ 96.0
$node_(28) set Y_ 158.0
$node_(28) set Z_ 0.0

$node_(27) set X_ 377.0
$node_(27) set Y_ 203.0
$node_(27) set Z_ 0.0

$node_(26) set X_ 462.0
$node_(26) set Y_ 268.0
$node_(26) set Z_ 0.0

$node_(25) set X_ 470.0
$node_(25) set Y_ 161.0
$node_(25) set Z_ 0.0

$node_(24) set X_ 30.0
$node_(24) set Y_ 137.0
$node_(24) set Z_ 0.0

$node_(23) set X_ 458.0
$node_(23) set Y_ 151.0
$node_(23) set Z_ 0.0

$node_(22) set X_ 462.0
$node_(22) set Y_ 404.0
$node_(22) set Z_ 0.0

$node_(21) set X_ 192.0
$node_(21) set Y_ 152.0
$node_(21) set Z_ 0.0

$node_(20) set X_ 345.0
$node_(20) set Y_ 148.0
$node_(20) set Z_ 0.0

$node_(19) set X_ 386.0
$node_(19) set Y_ 135.0
$node_(19) set Z_ 0.0

$node_(18) set X_ 229.0
$node_(18) set Y_ 132.0
$node_(18) set Z_ 0.0

$node_(17) set X_ 272.0
$node_(17) set Y_ 350.0
$node_(17) set Z_ 0.0

$node_(16) set X_ 55.0
$node_(16) set Y_ 460.0
$node_(16) set Z_ 0.0

$node_(15) set X_ 339.0
$node_(15) set Y_ 255.0
$node_(15) set Z_ 0.0

$node_(14) set X_ 214.0
$node_(14) set Y_ 103.0
$node_(14) set Z_ 0.0

$node_(13) set X_ 481.0
$node_(13) set Y_ 380.0
$node_(13) set Z_ 0.0

$node_(12) set X_ 199.0
$node_(12) set Y_ 471.0
$node_(12) set Z_ 0.0

$node_(11) set X_ 387.0
$node_(11) set Y_ 164.0
$node_(11) set Z_ 0.0

$node_(10) set X_ 481.0
$node_(10) set Y_ 430.0
$node_(10) set Z_ 0.0

$node_(9) set X_ 134.0
$node_(9) set Y_ 30.0
$node_(9) set Z_ 0.0

$node_(8) set X_ 88.0
$node_(8) set Y_ 3.0
$node_(8) set Z_ 0.0

$node_(7) set X_ 366.0
$node_(7) set Y_ 33.0
$node_(7) set Z_ 0.0

$node_(6) set X_ 83.0
$node_(6) set Y_ 376.0
$node_(6) set Z_ 0.0

$node_(5) set X_ 215.0
$node_(5) set Y_ 263.0
$node_(5) set Z_ 0.0

$node_(4) set X_ 303.0
$node_(4) set Y_ 428.0
$node_(4) set Z_ 0.0

$node_(3) set X_ 483.0
$node_(3) set Y_ 19.0
$node_(3) set Z_ 0.0

$node_(2) set X_ 368.0
$node_(2) set Y_ 67.0
$node_(2) set Z_ 0.0

$node_(1) set X_ 294.0
$node_(1) set Y_ 358.0
$node_(1) set Z_ 0.0

$node_(0) set X_ 201.0
$node_(0) set Y_ 150.0
$node_(0) set Z_ 0.0


 
#Define a conexao TCP entre 5 e 37 Comecando em 329.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(5)  $tcp
$ns attach-agent $node_(37) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 329.0 "$ftp start"

#Define a conexao TCP entre 19 e 35 Comecando em 41.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(19)  $tcp
$ns attach-agent $node_(35) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 41.0 "$ftp start"

#Define a conexao TCP entre 39 e 38 Comecando em 194.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(39)  $tcp
$ns attach-agent $node_(38) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 194.0 "$ftp start"

#Define a conexao TCP entre 46 e 47 Comecando em 72.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(46)  $tcp
$ns attach-agent $node_(47) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 72.0 "$ftp start"

#Define a conexao TCP entre 9 e 5 Comecando em 315.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(9)  $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 315.0 "$ftp start"

#Define a conexao TCP entre 4 e 40 Comecando em 50.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(4)  $tcp
$ns attach-agent $node_(40) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 50.0 "$ftp start"

#Define a conexao TCP entre 46 e 48 Comecando em 323.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(46)  $tcp
$ns attach-agent $node_(48) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 323.0 "$ftp start"

#Define a conexao TCP entre 25 e 29 Comecando em 223.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(25)  $tcp
$ns attach-agent $node_(29) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 223.0 "$ftp start"

#Define a conexao TCP entre 30 e 14 Comecando em 338.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(30)  $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 338.0 "$ftp start"

#Define a conexao TCP entre 27 e 1 Comecando em 271.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(27)  $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 271.0 "$ftp start"


 #Exibe o tamanho da janela
proc plotWindow {tcpSource file} {
global ns 
set time 0.01 
set now [$ns now] 
set cwnd [$tcpSource set cwnd_] 
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.1 "plotWindow $tcp $windowVsTime2"

 
$ns at 244.0 "$node_(1) setdest 304.0 110.0 3.0"
$ns at 53.0 "$node_(2) setdest 257.0 381.0 3.0"
$ns at 61.0 "$node_(34) setdest 14.0 356.0 3.0"
$ns at 120.0 "$node_(5) setdest 324.0 163.0 3.0"
$ns at 63.0 "$node_(6) setdest 396.0 390.0 3.0"
$ns at 106.0 "$node_(7) setdest 351.0 332.0 3.0"
$ns at 129.0 "$node_(8) setdest 265.0 35.0 3.0"
$ns at 48.0 "$node_(9) setdest 130.0 83.0 3.0"
$ns at 34.0 "$node_(10) setdest 245.0 248.0 3.0"
$ns at 160.0 "$node_(11) setdest 317.0 19.0 3.0"


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
$ns at 345.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

 $ns run