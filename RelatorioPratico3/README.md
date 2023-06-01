--------------- dados do aluno ---------------

nome:Vitor Praxedes Calegari
matricula:22200379

--------------- dados do aluno ---------------

nome:Rita Louro Barbosa
matricula:22203157

----------- Descricao do trabalho ------------

---------Desafios enfrentados--------------


--------- Explicacao das simulacoes ---------


------ Explicacao simulacao V1 ------


------- Explicacao simulacao V3 -------

Anotações sobre o desenvolvimento:

-Não testar a saida de endereço e pronto são escolhas intencionais pois perguntei ao professor em aula e ele disse que eu poderia testar apenas o resultado
-tempo usado no testbench da sad_v1: 11850 ns
-tempo usado no testbench da sad_v3: 53040 ns
-ao rodar o golden model (sad_v3.py) será criado um arquivo chamado "estimulos.dat" no mesmo diretório que o arquivo .py se encontra.

-Dificuldades:
--Entender o tempo do testbench já que o clock e o tempo de funcionamento do sistema por completo são diferentes
--Perceber que a sintaxe do python e do vhdl para selecionar bits de um vetor é diferente.
    Ex: 
        Python:
        lista = 00001
        lista[0:4] = 0000

        Vhdl:
        lista = 00001
        lista(4 downto 0) = 00001
