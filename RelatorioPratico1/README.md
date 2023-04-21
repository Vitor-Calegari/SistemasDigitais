Grupo A:
 
--------------- dados do aluno ---------------

nome:Vitor Praxedes Calegari
matricula:22200379

--------------- dados do aluno ---------------

nome:Rita Louro Barbosa
matricula:22203157

----------- Descricao do trabalho ------------

Primeiramente foram escritos os codigos em vhdl 
dos seguintes blocos operacionais:
demultiplexador 1:4 (demux1para4), 
multiplexador 4:1 (mux4para1),  
decodificador bcd para display de 7 segmentos (decoficadorBCD7Seg).

O bloco decodificador recebeu duas versoes de codigo,
a primeira (presente na pasta decodificadorBCD7Seg-logica)
foi escrita utilizando a equação lógica da operação realizada
pelo bloco. Tal equação lógica foi obtida por meio do site
"circuitverse.org" ao qual fornecemos a tabela verdade da
operacao e ele nos retorno a equacao pronta e otimizada.
A segunda versao (presente na pasta "decodificadorBCD7Seg-case")
foi escrita utilizando case statement para determinar o funcionamento
da operacao do bloco.

--------- Explicacao das simulacoes ---------

Primeiramente utilizando o TimeQuest Timing Analyzer do Quartus II
verificamos o atraso maximo do circuito. Com essa informacao utilizamos
uma aproximacao inteira desse numero para determinar o periodo de
mudanca das entradas na simulacao com o ModelSim. Depois, analisando
o grafico fornecido pela simulacao, verificamos o correto funcionamento 
do circuito.

------ Explicacao simulacao demux1para4 ------

Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 9.407 nanossegundos, aproximados para 10 ns.
Forcamos a entrada "f" no valor estavel "11".
O valor da entrada "sel" foi modificado em um periodo de 10 ns,
iniciando no valor binario "00" até alcancar o valor "11" no
tempo 30 ns(Essa mudanca foi feita acrescentando "1" ao valor
binario a cada periodo).
Consultando a tabela verdade da operacao do bloco, verificamos
se as alteracoes observadas no valor da saida no grafico da si-
mulacao a cada periodo correspondia a saida esperada determinada
pela tabela verdade.

------- Explicacao simulacao mux4para1 -------

Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 9.115 nanossegundos, aproximados para 10 ns.
Forcamos das entradas "a", "b", "c" e "d" no valor estavel
de "01", "10", "11" e "00" respectivamente.
O valor da entrada "sel" foi modificado em um periodo de 10 ns,
iniciando no valor binario "00" até alcancar o valor "11" no
tempo 30 ns(Essa mudanca foi feita acrescentando "1" ao valor
binario a cada periodo).
Consultando a tabela verdade da operacao do bloco, verificamos
se as alteracoes observadas no valor da saida no grafico da si-
mulacao a cada periodo correspondia a saida esperada determinada
pela tabela verdade.

-- Explicacao simulacao decodificadorBCD7Seg (logico) --

Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 10.258 nanossegundos, aproximados para 11 ns.
O valor da entrada "bcd" foi modificado em um periodo de 11 ns,
iniciando no valor binario "0000" até alcancar o valor "1001" no
tempo 99 ns(Essa mudanca foi feita acrescentando "1" ao valor
binario a cada periodo).
Consultando a tabela verdade da operacao do bloco, verificamos
se as alteracoes observadas no valor da saida no grafico da si-
mulacao a cada periodo correspondia a saida esperada determinada
pela tabela verdade.

-- Explicacao simulacao decodificadorBCD7Seg (case) --

Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 10.259 nanossegundos, aproximados para 11 ns.
O valor da entrada "bcd" foi modificado em um periodo de 11 ns,
iniciando no valor binario "0000" até alcancar o valor "1001" no
tempo 99 ns(Essa mudanca foi feita acrescentando "1" ao valor
binario a cada periodo).
Consultando a tabela verdade da operacao do bloco, verificamos
se as alteracoes observadas no valor da saida no grafico da si-
mulacao a cada periodo correspondia a saida esperada determinada
pela tabela verdade.
