import random

nomesim = input("Defina um nome para simulacao \n")
protocolo = input("Qual o protocolo? (AODV,DSR,WCETT)\n")
i = int(input("Quantos nos?\n"))
nnos = i
randnos = input("Deseja que os nos sejam aleatorios? 1 Para sim e 0 para nao\n")
movimenta = int(input("Deseja que os nos se movimentem? 1 Para e 0 Para nao \n"))
ntrans = int(input("Quantos nos irao transmitir?\n"))
tipotraf = int(input("Qual tipo de trafego? 1 para CBR ou 2 para TCP\n"))
randtraf = int(input("Deseja que o trafego seja aleatorio? 1 para sim ou 0 para nao\n"))
traffic = " "
tcpWindows = "\n\n #Exibe o tamanho da janela\n"+"proc plotWindow {tcpSource file} {\n"+"global ns \n"+"set time 0.01 \n"+"set now [$ns now] \n"+"set cwnd [$tcpSource set cwnd_] \n" +'puts $file "$now $cwnd"\n'+'$ns at [expr $now+$time] "plotWindow $tcpSource $file" }\n'+'$ns at 10.1 "plotWindow $tcp $windowVsTime2"\n'
temposimu = int(input("Qual tempo da simualacao?\n"))

if tipotraf == 2:
	while ntrans > 0:
		if(randtraf == 0):
			norigem = int(input("Qual no de origem?\n"))
			nodestino = int(input("Qual no de destino?\n"))
			strans = float(input("Quando a transmissao ira comecar?\n"))
			traffic = traffic + "\n#Define a conexao TCP entre "+str(norigem)+" e "+str(nodestino)+" Comecando em "+str(strans)+"\nset tcp [new Agent/TCP/Newreno]\n"+"$tcp set class_ 2 \n"+"set sink [new Agent/TCPSink] \n"+"$ns attach-agent $node_("+str(norigem)+")  $tcp\n" + "$ns attach-agent $node_("+str(nodestino)+") $sink\n"+"$ns connect $tcp $sink\n"+"set ftp [new Application/FTP]\n"+"$ftp attach-agent $tcp\n"+"$ns at " +str(strans)+ ' "$ftp start"'
			ntrans -=1
		else:
			norigem = int(random.randrange(0,nnos-1,1))
			nodestino = int(random.randrange(0,nnos-1,1))
			while(norigem == nodestino):
				nodestino = int(random.randrange(0,nnos-1,1))
			strans = float(random.randrange(0,temposimu,1))
			traffic = traffic + "\n#Define a conexao TCP entre "+str(norigem)+" e "+str(nodestino)+" Comecando em "+str(strans)+"\nset tcp [new Agent/TCP/Newreno]\n"+"$tcp set class_ 2 \n"+"set sink [new Agent/TCPSink] \n"+"$ns attach-agent $node_("+str(norigem)+")  $tcp\n" + "$ns attach-agent $node_("+str(nodestino)+") $sink\n"+"$ns connect $tcp $sink\n"+"set ftp [new Application/FTP]\n"+"$ftp attach-agent $tcp\n"+"$ns at " +str(strans)+ ' "$ftp start"'+"\n"
			ntrans -=1



elif tipotraf == 1:
    while ntrans > 0:
        if(randtraf==0):
            norigem = int(input("Qual no de origem?\n"))
            nodestino = int(input("Qual no de destino?\n"))
            strans = float(input("Quando a transmissao ira comecar?\n"))
            intervalo = float(input("Qual intervalo de transmissao?\n"))
            cbr = "cbr_("+ str(ntrans)+")"
            traffic = traffic + "\n #Define a conexao UDP entre "+str(norigem)+" e"+str(nodestino)+" Comecando em "+str(strans)+"\nset udp_("+str(ntrans)+") [new Agent/UDP]\n"+"$ns attach-agent $node_("+str(norigem)+") $udp_("+str(ntrans)+")\n"+"set null_("+str(ntrans)+") [new Agent/Null]\n"+"$ns attach-agent $node_("+str(nodestino)+") $null_("+str(ntrans)+")\n"+"set "+cbr +" [new Application/Traffic/CBR]\n"+"$"+cbr+" set packetSize_ 512\n"+"$"+cbr+" set interval_ "+str(intervalo)+"\n$"+cbr+" set random_ 1\n"+"$"+cbr+" set maxpkts_ 10000\n"+"$"+cbr+" attach-agent $udp_("+str(ntrans)+")\n"+"$ns connect $udp_("+str(ntrans)+") $null_("+str(ntrans)+")\n"+"$ns at "+str(strans)+' "$'+cbr+' start"'
            ntrans -=1

        else:
            norigem = int(random.randrange(0,nnos-1,1))
            nodestino = int(random.randrange(0,nnos-1,1))
            while(norigem == nodestino):
                nodestino = int(random.randrange(0,nnos-1,1))
            strans = float(random.randrange(0,temposimu,1))
#            intervalo = float(random.uniform(0.01,1.0)) talvez
            intervalo = 0.05
            cbr = "cbr_("+ str(ntrans)+")"
            traffic = traffic + "\n #Define a conexao UDP entre "+str(norigem)+" e"+str(nodestino)+" Comecando em "+str(strans)+"\nset udp_("+str(ntrans)+") [new Agent/UDP]\n"+"$ns attach-agent $node_("+str(norigem)+") $udp_("+str(ntrans)+")\n"+"set null_("+str(ntrans)+") [new Agent/Null]\n"+"$ns attach-agent $node_("+str(nodestino)+") $null_("+str(ntrans)+")\n"+"set "+cbr +" [new Application/Traffic/CBR]\n"+"$"+cbr+" set packetSize_ 512\n"+"$"+cbr+" set interval_ "+str(intervalo)+"\n$"+cbr+" set random_ 1\n"+"$"+cbr+" set maxpkts_ 10000\n"+"$"+cbr+" attach-agent $udp_("+str(ntrans)+")\n"+"$ns connect $udp_("+str(ntrans)+") $null_("+str(ntrans)+")\n"+"$ns at "+str(strans)+' "$'+cbr+' start"'+"\n"
            ntrans -=1
else:
    print("Opcao invalida")
    exit()

if tipotraf == 2:
    traffic = traffic + tcpWindows

tx = int(input("Qual dimensao da topografia em x?\n"))
ty = int(input("Qual dimensao da topografia em y?\n"))


posicaono = " "
while i > 0:
    if(int(randnos) != 0):
        posicaono = posicaono + "\n$node_(" + str(i-1) + ") set X_ "+str(random.randrange(1,tx,1))+".0\n"
        posicaono = posicaono + "$node_(" + str(i-1) + ") set Y_ "+str(random.randrange(1,ty,1))+".0\n"
        posicaono = posicaono + "$node_(" + str(i-1) + ") set Z_ 0.0\n"
        i -=1
    else:
        print("Entre a posicao do no:"+str(i)+"\n")
        posicaono = posicaono + "\n$node_(" + str(i-1) + ") set X_ "+input("Coordenada X\n")+".0\n"
        posicaono = posicaono + "$node_(" + str(i-1) + ") set Y_ "+input("Coordenada Y\n")+".0\n"
        posicaono = posicaono + "$node_(" + str(i-1) + ") set Z_ 0.0\n"
        i -=1

move = " "
if movimenta == 1:
    nmovs = int(input("Quanto nos irao se movimentar?\n"))
    while nmovs > 0:
        nomv = int(input("Qual no vai se movimentar?\n"))
        v = float(input("Qual velocidade?\n"))
        t = float(input("Em qual momento?\n"))
        move = move + "\n$ns at "+str(t)+' "$node_('+nomv+') setdest ' + str(random.randrange(1,tx,1))+".0 " + str(random.randrange(1,ty,1)) + ".0 "+str(v)+'"'
        nmovs -=1



comentscript = "#Simulacaoo gerada pelo script em python feito por Vinicius Zanin\n" + "#Simualcao com "+ str(nnos) + " nos utilizando protocolo " + protocolo + " com a grade tendo " + str(tx) + " x " + str(ty) + "\n"
options = "#Define as opcoes\n"+"set val(chan)           Channel/WirelessChannel    ;# channel type \n"+"set val(prop)           Propagation/TwoRayGround   ;# radio-propagation \n"+"set val(netif)          Phy/WirelessPhy            ;# network interface type \n"+"\n"+"set val(mac)            Mac/802_11                 ;# MAC type\n"+"set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue typei\n"+"set val(ll)             LL                         ;# link layer type \n" +"set val(ant)            Antenna/OmniAntenna        ;# antenna model\n"+"set val(ifqlen)         50                         ;# max packet in ifq \n"+"set val(nn)             "+str(nnos)+"                          ;# number of mobilenodes\n"+"set val(rp)             "+protocolo+"                       ;# routing protocol \n"+"set val(x)              "+str(tx)+"                  ;# X dimension of topography\n"+"set val(y)              "+str(ty)+"                  ;# Y dimension of topography\n"+"set val(stop)           "+str(temposimu)+"               ;# time of simulation end\n"+"\n"+"set ns          [new Simulator]\n"+"set tracefd       [open "+ nomesim+".tr w] \n"+"set windowVsTime2 [open win"+nomesim+".tr w] \n"+"set namtrace      [open simwrls"+nomesim+".nam w]\n"+"\n$ns trace-all $tracefd\n"+"$ns namtrace-all-wireless $namtrace $val(x) $val(y)\n"+"\n#define topografia \n"+"\nset topo       [new Topography]\n"+"\n$topo load_flatgrid $val(x) $val(y) \n" + "\n create-god $val(nn)\n"+ "\n\n#Cria os nn nos moveis e atrela eles ao canal\n"+"\n     $ns node-config -adhocRouting $val(rp)\\\n"+"             -llType $val(ll) \\\n"+"             -macType $val(mac) \\\n"+"            -ifqType $val(ifq) \\\n"+"             -ifqLen $val(ifqlen) \\\n"+"             -antType $val(ant) \\\n"+"             -propType $val(prop) \\\n"+"             -phyType $val(netif) \\\n"+"             -channelType $val(chan) \\\n"+"             -topoInstance $topo \\\n"+"             -agentTrace ON \\\n"+"             -routerTrace ON \\\n"+"             -macTrace OFF \\\n"+"             -movementTrace ON\n"+"\n	for {set i 0} {$i < $val(nn)} { incr i } {\n"+"	  set node_($i) [$ns node] \n"+"	}\n" + "\n\n#Posicicoes iniciais dos nos\n"+posicaono+"\n"+move+"\n"+traffic+"\n\n#Define os nos inicias no nam\n"+"for {set i 0} {$i < $val(nn)} { incr i } {\n"+"# 30 defines the node size for nam\n"+"$ns initial_node_pos $node_($i) 30\n"+"}\n"+"\n\n #Mostra para os nos quando a simualacao termina\n"+"for {set i 0} {$i < $val(nn) } { incr i } {\n"+'    $ns at $val(stop) "$node_($i) reset";\n'+"}\n"+"\n\n #termina nam e a simulacao\n"+'$ns at $val(stop) "$ns nam-end-wireless $val(stop)"\n'+'$ns at $val(stop) "stop"\n'+'$ns at 150.01 "puts \\"end simulation\\" ; $ns halt"\n'+'proc stop {} {\n'+"    global ns tracefd namtrace\n"+"    $ns flush-trace\n"+"    close $tracefd\n"+"    close $namtrace\n"+"}\n"+"\n $ns run"



print(comentscript)
print(options)

with open(str(nomesim)+".tcl","w+") as f:
	f.write(comentscript+options)

