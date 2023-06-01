import os

class sad_v3:

	def __init__(self):
		self.__memA = str()
		self.__memB = str()
		self.__resultado = None
		self.__testes = []

	@property
	def memA(self):
		return self.__memA
    
	@property
	def memB(self):
		return self.__memB
	
	@property
	def testes(self):
		return self.__testes

	def inclui_memA(self, string_32bits: str):
		if self.__checaStrBin(string_32bits):
			self.__memA = string_32bits
		return

	def inclui_memB(self, string_32bits: str):
		if self.__checaStrBin(string_32bits):
			self.__memB = string_32bits
		return
	
	'''
	Função auxiliar que checa se uma dada string é binária
	'''
	def __checaStrBin(self, string):

		conjuntoProva = {'0', '1'}
		conjuntoTeste = set(string)

		if conjuntoTeste.issubset(conjuntoProva):
			return True
		else:
			return False
		
	'''
	Salva o valor das memórias e do resultado na lista de testes
	'''
	def __salva_teste(self):
		self.__testes.append((self.__memA, self.__memB, self.__resultado))
		return
	
	'''
	Calcula a sad baseado nos valores de self.__memA e self.__memB
	'''
	def calcula(self):
		if self.__memA.isnumeric() and self.__memB.isnumeric() and self.__checaStrBin(self.__memA) and self.__checaStrBin(self.__memB) and len(self.__memA) == len(self.__memB):
			numero_0_memA = int(self.__memA[0:8],2)
			numero_1_memA = int(self.__memA[8:16],2)
			numero_2_memA = int(self.__memA[16:24],2)
			numero_3_memA = int(self.__memA[24:32],2)

			numero_0_memB = int(self.__memB[0:8],2)
			numero_1_memB = int(self.__memB[8:16],2)
			numero_2_memB = int(self.__memB[16:24],2)
			numero_3_memB = int(self.__memB[24:32],2)

			resultado_parcial = int()
			for i in range(16):
				resultado_parcial += abs(numero_0_memA - numero_0_memB)
				resultado_parcial += abs(numero_1_memA - numero_1_memB)
				resultado_parcial += abs(numero_2_memA - numero_2_memB)
				resultado_parcial += abs(numero_3_memA - numero_3_memB)
			
			self.__resultado = bin(resultado_parcial)[2:].zfill(14)
			self.__salva_teste()

			print("Sad calculada com sucesso!")
			
			return self.__resultado
		else:
			print('Insira valores válidos nas memórias')
	
	'''
	Exporta a lista de testes para um arquivo .dat
	'''
	def exporta(self):
		nome_arquivo = "estimulos.dat"

		if self.__resultado != None:
			dados = ''

			for teste in self.__testes:
				linha_de_teste = ' '.join(teste)
				dados += f'{linha_de_teste}\n'

			diretorio_atual = os.path.dirname(os.path.abspath(__file__))
			caminho_arquivo = os.path.join(diretorio_atual, nome_arquivo)

			with open(caminho_arquivo, 'w') as arquivo:
				arquivo.write(dados)
				arquivo.close()
			print(f'Arquivo "{nome_arquivo}" exportado com sucesso!')
		else:
			print("O valor da sad ainda não foi calculado")

if __name__ == '__main__':
	sad = sad_v3()
	sad.inclui_memA('00000001000000010000000100000001')
	sad.inclui_memB('00000000000000000000000000000000')
	sad.calcula()
	sad.inclui_memA('11111111111111111111111111111111')
	sad.inclui_memB('00000000000000000000000000000000')
	sad.calcula()
	sad.exporta()