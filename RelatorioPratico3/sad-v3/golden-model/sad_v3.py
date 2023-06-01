class sad_v3:

    def __init__(self):
        self.__memA = str()
        self.__memB = str()
	self.__resultado = None

    @property
    def memA(self):
	return self.__memA
    
    @property
    def memB(self):
	return self.__memB

    def inclui_memA(self, string_32bits: String):
	self.__memA = string_32bits
	return

    def inclui_memB(self, string_32bits: String):
	self.__memB = string_32bits
	return

    def calcula(self):
	if self.__memA != '' and self.__memB != '' and len(self.__memA) == len(self.__memB):
            numero_0_memA = int(self.__memA[0:7],2)
	    numero_1_memA = int(self.__memA[8:15],2)
	    numero_2_memA = int(self.__memA[16:23],2)
	    numero_3_memA = int(self.__memA[24:31],2)

	    numero_0_memB = int(self.__memB[0:7],2)
	    numero_1_memB = int(self.__memB[8:15],2)
	    numero_2_memB = int(self.__memB[16:23],2)
	    numero_3_memB = int(self.__memB[24:31],2)
	
    	    resultado_parcial = int()
	    for i in range(16):
	        resultado_parcial += numero_0_memA - numero_0_memB
	        resultado_parcial += numero_1_memA - numero_1_memB
	        resultado_parcial += numero_2_memA - numero_2_memB
	        resultado_parcial += numero_3_memA - numero_3_memB
		
	        self.__resultado = bin(resultado_parcial)

	    return self.__resultado
	else:
	    print('Insira valores válidos nas memórias')
   
    def exporta(self):
	if resultado != None:
	    #Exporta
	else:
	    print("O valor da sad ainda não foi calculado")
