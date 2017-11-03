#Simulacaoo gerada pelo script em python feito por Vinicius Zanin
#Simualcao com 18 nos utilizando protocolo DSR com a grade tendo 500 x 500
#Define as opcoes
set val(chan)           Channel/WirelessChannel    ;# channel type 
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation 
set val(netif)          Phy/WirelessPhy            ;# network interface type 

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue   ;# interface queue typei
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

$ns at 71.0 "$node_(0) setdest 91.0 123.0 5.0"
$ns at 83.0 "$node_(1) setdest 53.0 415.0 5.0"
$ns at 136.0 "$node_(2) setdest 30.0 491.0 5.0"
$ns at 4.0 "$node_(3) setdest 321.0 290.0 5.0"
$ns at 81.0 "$node_(4) setdest 476.0 252.0 5.0"
$ns at 117.0 "$node_(5) setdest 441.0 361.0 5.0"
$ns at 89.0 "$node_(6) setdest 322.0 394.0 5.0"
$ns at 47.0 "$node_(7) setdest 241.0 250.0 5.0"
$ns at 126.0 "$node_(8) setdest 149.0 495.0 5.0"
$ns at 68.0 "$node_(9) setdest 389.0 10.0 5.0"
$ns at 55.0 "$node_(10) setdest 313.0 27.0 5.0"
$ns at 88.0 "$node_(11) setdest 3.0 456.0 5.0"
$ns at 51.0 "$node_(12) setdest 277.0 287.0 5.0"
$ns at 31.0 "$node_(13) setdest 86.0 210.0 5.0"
$ns at 48.0 "$node_(14) setdest 400.0 32.0 5.0"
$ns at 7.0 "$node_(15) setdest 106.0 323.0 5.0"
$ns at 132.0 "$node_(16) setdest 35.0 128.0 5.0"
$ns at 57.0 "$node_(17) setdest 336.0 212.0 5.0"
$ns at 130.0 "$node_(18) setdest 239.0 97.0 5.0"
$ns at 99.0 "$node_(19) setdest 465.0 240.0 5.0"
$ns at 99.0 "$node_(20) setdest 288.0 273.0 5.0"
$ns at 5.0 "$node_(21) setdest 157.0 55.0 5.0"
$ns at 2.0 "$node_(22) setdest 181.0 498.0 5.0"
$ns at 137.0 "$node_(23) setdest 379.0 464.0 5.0"
$ns at 137.0 "$node_(24) setdest 308.0 230.0 5.0"
$ns at 67.0 "$node_(25) setdest 303.0 217.0 5.0"
$ns at 138.0 "$node_(26) setdest 487.0 443.0 5.0"
$ns at 43.0 "$node_(27) setdest 341.0 204.0 5.0"
$ns at 51.0 "$node_(28) setdest 341.0 57.0 5.0"
$ns at 102.0 "$node_(29) setdest 153.0 439.0 5.0"
$ns at 52.0 "$node_(0) setdest 132.0 193.0 5.0"
$ns at 29.0 "$node_(1) setdest 386.0 177.0 5.0"
$ns at 106.0 "$node_(2) setdest 86.0 302.0 5.0"
$ns at 43.0 "$node_(3) setdest 211.0 15.0 5.0"
$ns at 119.0 "$node_(4) setdest 291.0 335.0 5.0"
$ns at 6.0 "$node_(5) setdest 219.0 449.0 5.0"
$ns at 23.0 "$node_(6) setdest 47.0 210.0 5.0"
$ns at 26.0 "$node_(7) setdest 128.0 51.0 5.0"
$ns at 55.0 "$node_(8) setdest 78.0 422.0 5.0"
$ns at 19.0 "$node_(9) setdest 30.0 339.0 5.0"
$ns at 119.0 "$node_(10) setdest 144.0 416.0 5.0"
$ns at 99.0 "$node_(11) setdest 268.0 130.0 5.0"
$ns at 4.0 "$node_(12) setdest 288.0 486.0 5.0"
$ns at 98.0 "$node_(13) setdest 72.0 100.0 5.0"
$ns at 41.0 "$node_(14) setdest 199.0 445.0 5.0"
$ns at 18.0 "$node_(15) setdest 4.0 224.0 5.0"
$ns at 65.0 "$node_(16) setdest 49.0 1.0 5.0"
$ns at 80.0 "$node_(17) setdest 29.0 296.0 5.0"
$ns at 107.0 "$node_(18) setdest 455.0 324.0 5.0"
$ns at 6.0 "$node_(19) setdest 203.0 258.0 5.0"
$ns at 20.0 "$node_(20) setdest 484.0 461.0 5.0"
$ns at 11.0 "$node_(21) setdest 328.0 241.0 5.0"
$ns at 77.0 "$node_(22) setdest 436.0 179.0 5.0"
$ns at 80.0 "$node_(23) setdest 330.0 144.0 5.0"
$ns at 147.0 "$node_(24) setdest 350.0 192.0 5.0"
$ns at 6.0 "$node_(25) setdest 108.0 310.0 5.0"
$ns at 137.0 "$node_(26) setdest 39.0 69.0 5.0"
$ns at 6.0 "$node_(27) setdest 473.0 485.0 5.0"
$ns at 121.0 "$node_(28) setdest 317.0 170.0 5.0"
$ns at 123.0 "$node_(29) setdest 254.0 233.0 5.0"
$ns at 35.0 "$node_(0) setdest 28.0 327.0 5.0"
$ns at 68.0 "$node_(1) setdest 317.0 472.0 5.0"
$ns at 83.0 "$node_(2) setdest 404.0 255.0 5.0"
$ns at 145.0 "$node_(3) setdest 173.0 224.0 5.0"
$ns at 58.0 "$node_(4) setdest 223.0 92.0 5.0"
$ns at 9.0 "$node_(5) setdest 144.0 312.0 5.0"
$ns at 24.0 "$node_(6) setdest 385.0 366.0 5.0"
$ns at 142.0 "$node_(7) setdest 290.0 203.0 5.0"
$ns at 63.0 "$node_(8) setdest 1.0 177.0 5.0"
$ns at 60.0 "$node_(9) setdest 288.0 253.0 5.0"
$ns at 91.0 "$node_(10) setdest 433.0 411.0 5.0"
$ns at 44.0 "$node_(11) setdest 317.0 172.0 5.0"
$ns at 111.0 "$node_(12) setdest 109.0 469.0 5.0"
$ns at 119.0 "$node_(13) setdest 439.0 401.0 5.0"
$ns at 123.0 "$node_(14) setdest 9.0 273.0 5.0"
$ns at 67.0 "$node_(15) setdest 222.0 122.0 5.0"
$ns at 13.0 "$node_(16) setdest 342.0 392.0 5.0"
$ns at 131.0 "$node_(17) setdest 315.0 19.0 5.0"
$ns at 21.0 "$node_(18) setdest 136.0 373.0 5.0"
$ns at 69.0 "$node_(19) setdest 340.0 113.0 5.0"
$ns at 21.0 "$node_(20) setdest 94.0 208.0 5.0"
$ns at 73.0 "$node_(21) setdest 134.0 456.0 5.0"
$ns at 57.0 "$node_(22) setdest 32.0 334.0 5.0"
$ns at 77.0 "$node_(23) setdest 481.0 439.0 5.0"
$ns at 0.0 "$node_(24) setdest 198.0 139.0 5.0"
$ns at 105.0 "$node_(25) setdest 323.0 30.0 5.0"
$ns at 23.0 "$node_(26) setdest 190.0 55.0 5.0"
$ns at 121.0 "$node_(27) setdest 440.0 378.0 5.0"
$ns at 42.0 "$node_(28) setdest 230.0 353.0 5.0"
$ns at 44.0 "$node_(29) setdest 345.0 59.0 5.0" 
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
