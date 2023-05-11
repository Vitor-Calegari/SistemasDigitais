--------------- dados do aluno ---------------

nome:Vitor Praxedes Calegari
matricula:22200379

--------------- dados do aluno ---------------

nome:Rita Louro Barbosa
matricula:22203157

----------- Descricao do trabalho ------------
###falando de cada um dos circuitos###

Foram feitas duas versões de uma SAD que realiza o somatório das diferenças absolutas entre os dados de duas memórias matriciais, conforme requisitado. 
A V1 realiza esse somatório comparando dois valores por vez (um de cada matriz). 
A v3 aumenta o paralelismo das operações, visando diminuir o número de ciclos da operação. Nesta versão, são comparados 4 pares por vez. 

Para a V1, primeiramente foram escritos os codigos em vhdl 
dos seguintes blocos:
A)multiplexador 2:1 de 7 e 14 bits;
B)registradores de 7, 8 e 14 bits;
C)somador de 6 bits com saíde de over flow;
D)somador de 14 bits;
E)subtrator absoluto de 8 bits. 

A) Posteriormente, para otimizar a criação de blocos futuros e facilitar a reusabilidade de código, o multiplexador foi adaptado para uma versão genérica de "N" bits. (Usando a funcionalidade "generic") Com isso, ele pode ser instanciado em diferentes components com diferentes número de bits, a depender da necessidade. No caso específico do utilizado na V1, ele foi utilizado como component para criar os mux de 7 e 14 bits necessários, apenas definindo o "N" com o valor especificado. 

B) Metodologia semelhante à utilizada na A) foi aplicada para tornar o registrador antes específico em um registrador genérico de "N" bits. O registrador genérico foi utilizado como component para formar registradores de 7, 8 e 14 bits no BO. 

C) No BO é apresentado um somador de 6 bits que utiliza a saída de over flow como bit complementar a ser concatenado como bit mais significativo (com o propósito de economizar material). Para descrever esse somador em VHDL, foi necessário, anteriormente, descrever o código de um fulladder, que posteriormente foi utilizado como component do somador. Com a junção da instância de 6 fulladders, foi descrito o somador de 6 bits, definindo a saída cout do fullader do bit mais significativo como a saída do over flow do bloco somador.

E) Com o propósito de simplificar e organizar melhor o cálculo da diferença absoluta, decidiu-se utilizar um único bloco que realiza o cálculo de subtração e a transformação do resultado em uma diferença absoluta. 
Para calcular a diferença absoluta entre dois números, foi aplicada a função abs() do VHDL sobre o resultado da subtração das duas entradas do bloco.
Os valores de entradas são recebidos como std logic vector mas são declarados como signed na hora do cálculo. 


Após a criação dos códigos acima, foi descrito o circuito do BO da SAD  com a instância e portmap dos componets de acordo com o desenho do BO apresentado no slide base. 

Para a descrição do bloco de controle, foram observados os valores dos sinais de controle em cada estado, conforme definido na FSM fornecida. 

Finalmente, foi descrito um arquivo de topo chamado "sad" que 
utilizava o bloco operativo e o bloco de controle interligados  para montar a SAD. 

Para a descrição da V3 foram utilizados os arquivos de blocos multiplexador, registrador e somador já criados para a V1. Como haviam sido criados uzando o generic value, foi possível adaptar o número de bits facilmente na instância dos components no BO. Foi reaproveitado também o bloco subtrator qe calcula a diferença absoluta entre 2 valores. A novidade que a V3 carrega em questão de blocos é a descrição de um somador genérico de "N" bits com saída de over flow (na V1 foi utilizado um somador semelhante, mas com o número de bits truncado em 6).

Para a descrição do BO, do BC e do arquivo de topo (sad) da SAD V3 foi utilizada metodologia equivalente à aplicada na descrição destes blocos na V1. A diferença principal está no novo paralelismo de operações criado nessa nova versão. Agora, a diferença de 4 números de cada matriz é calculada por vez e somada ao registrador soma. 


---------Desafios enfrentados--------------

Durante a construção do projeto, surgiram dois desafios principais:
- Ao tentar fazer a compilação da *******, foi apontado um erro de compilação por conta de quantidade insuficiente de pinos na placa escolhida. Para a resolução desse problema foi escolida uma nova placa para simulação do circuito, agora com quantidade suficiente de pinos. A placa anteriormente utilizada era a **(dispositivo: EP3C5E144C7) (V1). A novaa placa utilizada é a **(dispositivo: EP3C5M164C7) (V3) ???????

- Para a criação dos blocos com valor genérico de bits foi necessário estudo paralelo para se compreender o funcionamento da funcionalidade "generic" do VHDL. 


--------- Explicacao das simulacoes ---------

Primeiramente utilizando o TimeQuest Timing Analyzer do Quartus II
verificamos o atraso maximo do circuito ######(arquivo de topo SAD)####. Com essa informacao utilizamos 
uma aproximacao inteira desse numero para determinar o periodo de
mudanca das entradas na simulacao com o ModelSim. Depois, analisando
o grafico fornecido pela simulacao, verificamos o correto funcionamento 
do circuito.

------ Explicacao simulacao V1 ------

Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 7.631 nanossegundos, aproximados para ##### 10 ns.
O valor da entrada "iniciar" foi forçado para 0 no tempo 0ns e para 1 no tempo 20ns. 
A entrada "reset" foi forçada para 0 no tempo 0ns, para 1 no tempo 40ns e para 0 no tempo 60ns. 
A entrada "Mem_A" foi forçada para "00000001" no tempo 0 ns, para "11111111" no tempo 4000 ns e para "00000011" no tempo 7950 ns. 
A entrada "Mem_B" foi forçada para "00000000" no tempo 0 ns e para "00000001" no tempo 7950 ns. 

Esses valores de entrada de reset e iniciar foram definidos visando o teste do funcionamento do sinal de controle iniciar e do sinal de controle resent da sad. 
 Os valores das entradas de memória foram definidos visando o teste do cálculo da diferença mínima e diferença máxima possível entre os valores das memórias. Também foi testado o cálculo da diferença de dois valores quaisquer.  


------- Explicacao simulacao V3 -------
Com o TimeQuest descobrimos que o atraso maximo no bloco
é de 7.621 nanossegundos, aproximados para ##### 10 ns.
O valor da entrada "iniciar" foi forçado para 0 no tempo 0ns e para 1 no tempo 20ns. 
A entrada "reset" foi forçada para 0 no tempo 0ns, para 1 no tempo 40ns e para 0 no tempo 60ns. 
A entrada "Mem_A" foi forçada para "00000001000000010000000100000001" no tempo 0 ns, para 11111111111111111111111111111111 no tempo 1100 ns e para "00100001001000100101000010010010" no tempo 2150 ns. 
A entrada "Mem_B" foi forçada para "00000000000000000000000000000000" no tempo 0 ns e para "10011110101111111100011111111000" no tempo 2150 ns. 

 Esses valores de entrada de reset e iniciar foram definidos visando o teste do funcionamento do sinal de controle iniciar e do sinal de controle resent da sad. 
 Os valores das entradas de memória foram definidos visando o teste do cálculo da diferença mínima e diferença máxima possível entre os valores das memórias. Também foi testado o cálculo da diferença de dois valores quaisquer.  
