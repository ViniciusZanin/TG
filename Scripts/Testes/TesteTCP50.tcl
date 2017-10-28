#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 50 nos utilizando protocolo DSR com a grade tendo 500 x 500
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
set val(rp)             DSR                       ;# routing protocol 
set val(x)              500                  ;# X dimension of topography
set val(y)              500                  ;# Y dimension of topography
set val(stop)           500               ;# time of simulation end

set ns          [new Simulator]
set tracefd       [open TesteTCP50.tr w] 
set windowVsTime2 [open winTesteTCP50.tr w] 
set namtrace      [open simwrlsTesteTCP50.nam w]

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
 
$node_(49) set X_ 287.0
$node_(49) set Y_ 291.0
$node_(49) set Z_ 0.0

$node_(48) set X_ 441.0
$node_(48) set Y_ 183.0
$node_(48) set Z_ 0.0

$node_(47) set X_ 64.0
$node_(47) set Y_ 70.0
$node_(47) set Z_ 0.0

$node_(46) set X_ 278.0
$node_(46) set Y_ 259.0
$node_(46) set Z_ 0.0

$node_(45) set X_ 86.0
$node_(45) set Y_ 17.0
$node_(45) set Z_ 0.0

$node_(44) set X_ 488.0
$node_(44) set Y_ 399.0
$node_(44) set Z_ 0.0

$node_(43) set X_ 449.0
$node_(43) set Y_ 252.0
$node_(43) set Z_ 0.0

$node_(42) set X_ 347.0
$node_(42) set Y_ 243.0
$node_(42) set Z_ 0.0

$node_(41) set X_ 366.0
$node_(41) set Y_ 117.0
$node_(41) set Z_ 0.0

$node_(40) set X_ 468.0
$node_(40) set Y_ 111.0
$node_(40) set Z_ 0.0

$node_(39) set X_ 307.0
$node_(39) set Y_ 146.0
$node_(39) set Z_ 0.0

$node_(38) set X_ 496.0
$node_(38) set Y_ 459.0
$node_(38) set Z_ 0.0

$node_(37) set X_ 23.0
$node_(37) set Y_ 69.0
$node_(37) set Z_ 0.0

$node_(36) set X_ 350.0
$node_(36) set Y_ 79.0
$node_(36) set Z_ 0.0

$node_(35) set X_ 43.0
$node_(35) set Y_ 307.0
$node_(35) set Z_ 0.0

$node_(34) set X_ 351.0
$node_(34) set Y_ 320.0
$node_(34) set Z_ 0.0

$node_(33) set X_ 360.0
$node_(33) set Y_ 154.0
$node_(33) set Z_ 0.0

$node_(32) set X_ 448.0
$node_(32) set Y_ 464.0
$node_(32) set Z_ 0.0

$node_(31) set X_ 489.0
$node_(31) set Y_ 121.0
$node_(31) set Z_ 0.0

$node_(30) set X_ 146.0
$node_(30) set Y_ 225.0
$node_(30) set Z_ 0.0

$node_(29) set X_ 93.0
$node_(29) set Y_ 26.0
$node_(29) set Z_ 0.0

$node_(28) set X_ 476.0
$node_(28) set Y_ 321.0
$node_(28) set Z_ 0.0

$node_(27) set X_ 69.0
$node_(27) set Y_ 278.0
$node_(27) set Z_ 0.0

$node_(26) set X_ 298.0
$node_(26) set Y_ 445.0
$node_(26) set Z_ 0.0

$node_(25) set X_ 276.0
$node_(25) set Y_ 67.0
$node_(25) set Z_ 0.0

$node_(24) set X_ 498.0
$node_(24) set Y_ 9.0
$node_(24) set Z_ 0.0

$node_(23) set X_ 51.0
$node_(23) set Y_ 2.0
$node_(23) set Z_ 0.0

$node_(22) set X_ 186.0
$node_(22) set Y_ 30.0
$node_(22) set Z_ 0.0

$node_(21) set X_ 453.0
$node_(21) set Y_ 471.0
$node_(21) set Z_ 0.0

$node_(20) set X_ 293.0
$node_(20) set Y_ 173.0
$node_(20) set Z_ 0.0

$node_(19) set X_ 199.0
$node_(19) set Y_ 29.0
$node_(19) set Z_ 0.0

$node_(18) set X_ 79.0
$node_(18) set Y_ 14.0
$node_(18) set Z_ 0.0

$node_(17) set X_ 359.0
$node_(17) set Y_ 58.0
$node_(17) set Z_ 0.0

$node_(16) set X_ 104.0
$node_(16) set Y_ 482.0
$node_(16) set Z_ 0.0

$node_(15) set X_ 306.0
$node_(15) set Y_ 47.0
$node_(15) set Z_ 0.0

$node_(14) set X_ 264.0
$node_(14) set Y_ 139.0
$node_(14) set Z_ 0.0

$node_(13) set X_ 66.0
$node_(13) set Y_ 302.0
$node_(13) set Z_ 0.0

$node_(12) set X_ 103.0
$node_(12) set Y_ 377.0
$node_(12) set Z_ 0.0

$node_(11) set X_ 285.0
$node_(11) set Y_ 64.0
$node_(11) set Z_ 0.0

$node_(10) set X_ 475.0
$node_(10) set Y_ 367.0
$node_(10) set Z_ 0.0

$node_(9) set X_ 390.0
$node_(9) set Y_ 192.0
$node_(9) set Z_ 0.0

$node_(8) set X_ 172.0
$node_(8) set Y_ 475.0
$node_(8) set Z_ 0.0

$node_(7) set X_ 67.0
$node_(7) set Y_ 252.0
$node_(7) set Z_ 0.0

$node_(6) set X_ 288.0
$node_(6) set Y_ 196.0
$node_(6) set Z_ 0.0

$node_(5) set X_ 241.0
$node_(5) set Y_ 222.0
$node_(5) set Z_ 0.0

$node_(4) set X_ 490.0
$node_(4) set Y_ 68.0
$node_(4) set Z_ 0.0

$node_(3) set X_ 347.0
$node_(3) set Y_ 409.0
$node_(3) set Z_ 0.0

$node_(2) set X_ 59.0
$node_(2) set Y_ 26.0
$node_(2) set Z_ 0.0

$node_(1) set X_ 87.0
$node_(1) set Y_ 411.0
$node_(1) set Z_ 0.0

$node_(0) set X_ 130.0
$node_(0) set Y_ 322.0
$node_(0) set Z_ 0.0


 
#Define a conexao TCP entre 32 e 31 Comecando em 86.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(32)  $tcp
$ns attach-agent $node_(31) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 86.0 "$ftp start"

#Define a conexao TCP entre 19 e 20 Comecando em 222.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(19)  $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 222.0 "$ftp start"

#Define a conexao TCP entre 14 e 5 Comecando em 253.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(14)  $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 253.0 "$ftp start"

#Define a conexao TCP entre 13 e 44 Comecando em 257.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(13)  $tcp
$ns attach-agent $node_(44) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 257.0 "$ftp start"

#Define a conexao TCP entre 41 e 27 Comecando em 362.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(41)  $tcp
$ns attach-agent $node_(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 362.0 "$ftp start"

#Define a conexao TCP entre 48 e 37 Comecando em 0.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(48)  $tcp
$ns attach-agent $node_(37) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.0 "$ftp start"

#Define a conexao TCP entre 38 e 48 Comecando em 250.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(38)  $tcp
$ns attach-agent $node_(48) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 250.0 "$ftp start"

#Define a conexao TCP entre 12 e 9 Comecando em 93.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(12)  $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 93.0 "$ftp start"

#Define a conexao TCP entre 1 e 10 Comecando em 127.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(1)  $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 127.0 "$ftp start"

#Define a conexao TCP entre 43 e 0 Comecando em 317.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(43)  $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 317.0 "$ftp start"


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
$ns at 500.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

 $ns run