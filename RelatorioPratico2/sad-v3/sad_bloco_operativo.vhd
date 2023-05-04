LIBRARY IEEE;
USE IEEE.std_logic_1164.all; 
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

ENTITY sad_bloco_operativo IS
PORT(
	-- Entradas de dados
	Clock: IN std_logic;
	Mem_A, Mem_B: IN std_logic_vector(31 DOWNTO 0);

	-- Entradas de controle
	zi, ci, cpA, cpB, zSoma, cSoma, cSadReg: IN std_logic;

	-- Saídas de dados
	saida: out std_logic_vector(13 DOWNTO 0);
	ende: out std_logic_vector(3 downto 0);
	
	-- Saídas de status
	menor: out std_logic
);
END ENTITY;

ARCHITECTURE arc OF sad_bloco_operativo IS
---------------------------SIGNALS----------------------------------

--Registradores--
signal sig_pA0, sig_pA1, sig_pA2, sig_pA3: std_logic_vector(7 downto 0);
signal sig_pB0, sig_pB1, sig_pB2, sig_pB3: std_logic_vector(7 downto 0);
signal sig_soma, sig_SadReg: std_logic_vector(13 downto 0);
signal sig_i: std_logic_vector(4 downto 0);

----Somadores----
signal sig_diferenca0, sig_diferenca1, sig_diferenca2, sig_diferenca3 : std_logic_vector(7 downto 0);
signal sig_soma80, sig_soma81: std_logic_vector(7 downto 0);
signal sig_soma9: std_logic_vector(8 downto 0);
signal sig_soma14: std_logic_vector(13 downto 0);
signal sig_soma4: std_logic_vector(3 downto 0);
signal sig_over_flow_soma4, sig_over_flow_soma80, sig_over_flow_soma81, sig_over_flow_soma9: std_logic;

----Multiplex----
signal sig_mux14: std_logic_vector(13 downto 0);
signal sig_mux5: std_logic_vector(4 downto 0);

---------------------------COMPONENTS-------------------------------

component multiplex_2x1_5bits is
	port(
		sinal: in std_logic;
		A: in std_logic_vector(4 downto 0);
		B: in std_logic_vector(4 downto 0);
		S: out std_logic_vector(4 downto 0)
		);
end component;

component multiplex_2x1_14bits is
	port(
		sinal: in std_logic;
		A: in std_logic_vector(13 downto 0);
		B: in std_logic_vector(13 downto 0);
		S: out std_logic_vector(13 downto 0)
		);
end component;

component registrador5bits is
	port(
		R : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
		Enable, Clock: IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) 
		) ;
end component;

component registrador8bits is
	port(
		R : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Enable, Clock: IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
		) ;
end component;

component registrador14bits is
	port(
		R : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		Enable, Clock: IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(13 DOWNTO 0) 
		) ;
end component;

component somador4bits_ovf is
	port(
		a, b: IN STD_LOGIC_VECTOR (3 DOWNTO 0);-- troquei N-1 por 3
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);-- troquei N-1 por 3
		cout: OUT STD_LOGIC
		);
end component;

component somador8bits_ovf is
	port(
		a, b: IN STD_LOGIC_VECTOR (7 DOWNTO 0);-- troquei N-1 por 7
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);-- troquei N-1 por 7
		cout: OUT STD_LOGIC
		);
end component;

component somador9bits_ovf is
	port(
		a, b: IN STD_LOGIC_VECTOR (8 DOWNTO 0);-- troquei N-1 por 8
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR (8 DOWNTO 0);-- troquei N-1 por 8
		cout: OUT STD_LOGIC
		);
end component;

component somador14bits is
	port(
		add1 : IN std_logic_vector(13 DOWNTO 0);
		add2 : IN std_logic_vector(13 DOWNTO 0);
		sum : OUT std_logic_vector(13 DOWNTO 0)
		);
	
end component;

component subtrator8bits_abs is
	port(
		add1 : IN std_logic_vector(7 DOWNTO 0);
		add2 : IN std_logic_vector(7 DOWNTO 0);
		sum : OUT std_logic_vector(7 DOWNTO 0)
		);
		
end component;

BEGIN

-----Principal---------------

pA0: registrador8bits port map (Mem_A(7 downto 0), cpA, Clock, sig_pA0);
pA1: registrador8bits port map (Mem_A(15 downto 8), cpA, Clock, sig_pA1);
pA2: registrador8bits port map (Mem_A(23 downto 16), cpA, Clock, sig_pA2);
pA3: registrador8bits port map (Mem_A(31 downto 24), cpA, Clock, sig_pA3);

pB0: registrador8bits port map (Mem_B(7 downto 0), cpB, Clock, sig_pB0);
pB1: registrador8bits port map (Mem_B(15 downto 8), cpB, Clock, sig_pB1);
pB2: registrador8bits port map (Mem_B(23 downto 16), cpB, Clock, sig_pB2);
pB3: registrador8bits port map (Mem_B(31 downto 24), cpB, Clock, sig_pB3);

subt_ABS0: subtrator8bits_abs port map (sig_pA0, sig_pB0, sig_diferenca0);
subt_ABS1: subtrator8bits_abs port map (sig_pA1, sig_pB1, sig_diferenca1);
subt_ABS2: subtrator8bits_abs port map (sig_pA2, sig_pB2, sig_diferenca2);
subt_ABS3: subtrator8bits_abs port map (sig_pA3, sig_pB3, sig_diferenca3);

soma80: somador8bits_ovf port map (sig_diferenca0, sig_diferenca1, '0', sig_soma80, sig_over_flow_soma80);
soma81: somador8bits_ovf port map (sig_diferenca2, sig_diferenca3, '0', sig_soma81, sig_over_flow_soma81);

soma9: somador9bits_ovf port map ('0' & sig_soma80, '0' & sig_soma81, '0', sig_soma9, sig_over_flow_soma9);

soma14: somador14bits port map (sig_soma, "00000" & sig_soma9, sig_soma14);

mux14: multiplex_2x1_14bits port map (zsoma, sig_soma14, "00000000000000", sig_mux14);

reg_soma: registrador14bits port map (sig_mux14, csoma, Clock, sig_soma);
SAD_reg: registrador14bits port map (sig_soma, csadReg, Clock, sig_SadReg);
-----Contador end e menor-----
		
mux5: multiplex_2x1_5bits port map (zi, sig_over_flow_soma4 & sig_soma4, "00000", sig_mux5);
reg_i: registrador5bits port map (sig_mux5, ci, Clock, sig_i);
soma4: somador4bits_ovf port map (sig_i(3 downto 0), "0001", '0', sig_soma4, sig_over_flow_soma4);
------Saídas-------------------
		
ende  <=	sig_i(3 downto 0);
menor <=	not(sig_i(4));
saida <= sig_SadReg;

end arc;
