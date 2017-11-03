#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 18 nos utilizando protocolo DSR com a grade tendo 500 x 500
#Define as opcoes
set val(chan)           Channel/WirelessChannel    ;# channel type 
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation 
set val(netif)          Phy/WirelessPhy            ;# network interface type 

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            CMUPriQueue    ;# interface queue typei
set val(ll)             LL                         ;# link layer type 
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq 
set val(nn)             30                          ;# number of mobilenodes
set val(rp)             DSR                       ;# routing protocol 
set val(x)              500                  ;# X dimension of topography
set val(y)              500                  ;# Y dimension of topography
set val(stop)           1000               ;# time of simulation end

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

$ns at 469.0 "$node_(0) setdest 275.0 93.0 1.0"
$ns at 744.0 "$node_(1) setdest 145.0 135.0 1.0"
$ns at 865.0 "$node_(2) setdest 249.0 397.0 1.0"
$ns at 816.0 "$node_(3) setdest 453.0 304.0 1.0"
$ns at 17.0 "$node_(4) setdest 119.0 327.0 1.0"
$ns at 667.0 "$node_(5) setdest 252.0 149.0 1.0"
$ns at 548.0 "$node_(6) setdest 44.0 211.0 1.0"
$ns at 16.0 "$node_(7) setdest 127.0 78.0 1.0"
$ns at 34.0 "$node_(8) setdest 35.0 235.0 1.0"
$ns at 584.0 "$node_(9) setdest 115.0 350.0 1.0"
$ns at 312.0 "$node_(10) setdest 54.0 139.0 1.0"
$ns at 369.0 "$node_(11) setdest 472.0 119.0 1.0"
$ns at 754.0 "$node_(12) setdest 499.0 88.0 1.0"
$ns at 386.0 "$node_(13) setdest 467.0 3.0 1.0"
$ns at 902.0 "$node_(14) setdest 295.0 42.0 1.0"
$ns at 122.0 "$node_(15) setdest 466.0 211.0 1.0"
$ns at 567.0 "$node_(16) setdest 439.0 123.0 1.0"
$ns at 114.0 "$node_(17) setdest 100.0 131.0 1.0"
$ns at 664.0 "$node_(18) setdest 186.0 304.0 1.0"
$ns at 670.0 "$node_(19) setdest 173.0 450.0 1.0"
$ns at 562.0 "$node_(20) setdest 282.0 354.0 1.0"
$ns at 572.0 "$node_(21) setdest 16.0 389.0 1.0"
$ns at 134.0 "$node_(22) setdest 56.0 407.0 1.0"
$ns at 182.0 "$node_(23) setdest 159.0 324.0 1.0"
$ns at 131.0 "$node_(24) setdest 423.0 105.0 1.0"
$ns at 714.0 "$node_(25) setdest 385.0 37.0 1.0"
$ns at 332.0 "$node_(26) setdest 409.0 182.0 1.0"
$ns at 844.0 "$node_(27) setdest 32.0 308.0 1.0"
$ns at 884.0 "$node_(28) setdest 71.0 160.0 1.0"
$ns at 245.0 "$node_(29) setdest 447.0 336.0 1.0"
$ns at 272.0 "$node_(0) setdest 226.0 477.0 1.0"
$ns at 104.0 "$node_(1) setdest 298.0 339.0 1.0"
$ns at 916.0 "$node_(2) setdest 165.0 211.0 1.0"
$ns at 148.0 "$node_(3) setdest 407.0 81.0 1.0"
$ns at 163.0 "$node_(4) setdest 397.0 118.0 1.0"
$ns at 899.0 "$node_(5) setdest 326.0 177.0 1.0"
$ns at 634.0 "$node_(6) setdest 303.0 143.0 1.0"
$ns at 667.0 "$node_(7) setdest 442.0 33.0 1.0"
$ns at 509.0 "$node_(8) setdest 311.0 243.0 1.0"
$ns at 264.0 "$node_(9) setdest 475.0 492.0 1.0"
$ns at 504.0 "$node_(10) setdest 326.0 457.0 1.0"
$ns at 58.0 "$node_(11) setdest 435.0 304.0 1.0"
$ns at 455.0 "$node_(12) setdest 259.0 310.0 1.0"
$ns at 897.0 "$node_(13) setdest 225.0 495.0 1.0"
$ns at 751.0 "$node_(14) setdest 10.0 478.0 1.0"
$ns at 964.0 "$node_(15) setdest 339.0 128.0 1.0"
$ns at 328.0 "$node_(16) setdest 379.0 313.0 1.0"
$ns at 530.0 "$node_(17) setdest 378.0 358.0 1.0"
$ns at 90.0 "$node_(18) setdest 403.0 60.0 1.0"
$ns at 44.0 "$node_(19) setdest 136.0 1.0 1.0"
$ns at 622.0 "$node_(20) setdest 369.0 41.0 1.0"
$ns at 552.0 "$node_(21) setdest 469.0 26.0 1.0"
$ns at 52.0 "$node_(22) setdest 199.0 471.0 1.0"
$ns at 947.0 "$node_(23) setdest 99.0 124.0 1.0"
$ns at 230.0 "$node_(24) setdest 384.0 135.0 1.0"
$ns at 25.0 "$node_(25) setdest 289.0 130.0 1.0"
$ns at 776.0 "$node_(26) setdest 498.0 15.0 1.0"
$ns at 727.0 "$node_(27) setdest 92.0 368.0 1.0"
$ns at 178.0 "$node_(28) setdest 75.0 15.0 1.0"
$ns at 110.0 "$node_(29) setdest 126.0 334.0 1.0"
$ns at 969.0 "$node_(0) setdest 266.0 438.0 1.0"
$ns at 52.0 "$node_(1) setdest 65.0 200.0 1.0"
$ns at 661.0 "$node_(2) setdest 259.0 473.0 1.0"
$ns at 445.0 "$node_(3) setdest 296.0 492.0 1.0"
$ns at 150.0 "$node_(4) setdest 61.0 50.0 1.0"
$ns at 902.0 "$node_(5) setdest 416.0 99.0 1.0"
$ns at 725.0 "$node_(6) setdest 74.0 389.0 1.0"
$ns at 657.0 "$node_(7) setdest 3.0 178.0 1.0"
$ns at 933.0 "$node_(8) setdest 288.0 87.0 1.0"
$ns at 535.0 "$node_(9) setdest 68.0 200.0 1.0"
$ns at 691.0 "$node_(10) setdest 297.0 142.0 1.0"
$ns at 678.0 "$node_(11) setdest 322.0 165.0 1.0"
$ns at 723.0 "$node_(12) setdest 246.0 489.0 1.0"
$ns at 142.0 "$node_(13) setdest 38.0 490.0 1.0"
$ns at 660.0 "$node_(14) setdest 92.0 321.0 1.0"
$ns at 230.0 "$node_(15) setdest 75.0 156.0 1.0"
$ns at 937.0 "$node_(16) setdest 68.0 255.0 1.0"
$ns at 284.0 "$node_(17) setdest 2.0 473.0 1.0"
$ns at 301.0 "$node_(18) setdest 183.0 327.0 1.0"
$ns at 622.0 "$node_(19) setdest 440.0 451.0 1.0"
$ns at 703.0 "$node_(20) setdest 120.0 287.0 1.0"
$ns at 684.0 "$node_(21) setdest 336.0 349.0 1.0"
$ns at 449.0 "$node_(22) setdest 456.0 9.0 1.0"
$ns at 63.0 "$node_(23) setdest 180.0 140.0 1.0"
$ns at 195.0 "$node_(24) setdest 94.0 254.0 1.0"
$ns at 858.0 "$node_(25) setdest 127.0 484.0 1.0"
$ns at 576.0 "$node_(26) setdest 49.0 121.0 1.0"
$ns at 443.0 "$node_(27) setdest 457.0 249.0 1.0"
$ns at 536.0 "$node_(28) setdest 97.0 22.0 1.0"
$ns at 46.0 "$node_(29) setdest 258.0 227.0 1.0" 

#Define a conexao TCP entre 0 e 16 Comecando em 15.0
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2 
$tcp set packetSize_ 512
set sink [new Agent/TCPSink] 
$ns attach-agent $node_(0)  $tcp
$ns attach-agent $node_(18) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 10.0 "$ftp start"

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
$ns at 1000.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

 $ns run
