import random
temposimu = int(input("Qual tempo da simualacao?\n"))
i = int(input("Quantos nos?\n"))
tx = int(input("Qual dimensao da topografia em x?\n"))
ty = int(input("Qual dimensao da topografia em y?\n"))
move = " "
movimenta = 1
if movimenta == 1:
    nmovs = int(input("Quanto nos irao se movimentar?\n"))
    velocidade = float(input("Qual velocidade dos nos?\n"))
    while nmovs > 0:
        nomv = int(input("Qual no vai se movimentar?\n"))
      #  v = float(input("Qual velocidade?\n"))
        v = velocidade
      #  t = float(input("Em qual momento?\n"))
        t = float(random.randrange(0,temposimu,1))
        move = move + "\n$ns at "+str(t)+' "$node_('+str(nomv)+') setdest ' + str(random.randrange(1,tx,1))+".0 " + str(random.randrange(1,ty,1)) + ".0 "+str(v)+'"'
        nmovs -=1



print(move)
