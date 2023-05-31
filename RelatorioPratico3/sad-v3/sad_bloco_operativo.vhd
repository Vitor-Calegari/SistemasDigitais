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

component multiplex_2x1_Nbits is
	generic(N: integer:= 14);
	port(
		sinal: in std_logic;
		A: in std_logic_vector(N - 1 downto 0);
		B: in std_logic_vector(N - 1 downto 0);
		S: out std_logic_vector(N - 1 downto 0)
		);
end component;

component registradorNbits is
	generic(N: integer:= 14);
	port(
		R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable, Clock: IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) 
		) ;
end component;

component somadorNbits_ovf is
	generic(N: integer:= 4);
	port(
		a, b: IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
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

pA0: registradorNbits generic map (8) port map (Mem_A(7 downto 0), cpA, Clock, sig_pA0);
pA1: registradorNbits generic map (8) port map (Mem_A(15 downto 8), cpA, Clock, sig_pA1);
pA2: registradorNbits generic map (8) port map (Mem_A(23 downto 16), cpA, Clock, sig_pA2);
pA3: registradorNbits generic map (8) port map (Mem_A(31 downto 24), cpA, Clock, sig_pA3);

pB0: registradorNbits generic map (8) port map (Mem_B(7 downto 0), cpB, Clock, sig_pB0);
pB1: registradorNbits generic map (8) port map (Mem_B(15 downto 8), cpB, Clock, sig_pB1);
pB2: registradorNbits generic map (8) port map (Mem_B(23 downto 16), cpB, Clock, sig_pB2);
pB3: registradorNbits generic map (8) port map (Mem_B(31 downto 24), cpB, Clock, sig_pB3);

subt_ABS0: subtrator8bits_abs port map (sig_pA0, sig_pB0, sig_diferenca0);
subt_ABS1: subtrator8bits_abs port map (sig_pA1, sig_pB1, sig_diferenca1);
subt_ABS2: subtrator8bits_abs port map (sig_pA2, sig_pB2, sig_diferenca2);
subt_ABS3: subtrator8bits_abs port map (sig_pA3, sig_pB3, sig_diferenca3);

soma80: somadorNbits_ovf generic map (8) port map (sig_diferenca0, sig_diferenca1, '0', sig_soma80, sig_over_flow_soma80);
soma81: somadorNbits_ovf generic map (8) port map (sig_diferenca2, sig_diferenca3, '0', sig_soma81, sig_over_flow_soma81);

soma9: somadorNbits_ovf generic map (9) port map (sig_over_flow_soma80 & sig_soma80, sig_over_flow_soma81 & sig_soma81, '0', sig_soma9, sig_over_flow_soma9);

soma14: somador14bits port map (sig_soma, "0000" & sig_over_flow_soma9 & sig_soma9, sig_soma14);

mux14: multiplex_2x1_Nbits generic map (14) port map (zsoma, sig_soma14, "00000000000000", sig_mux14);

reg_soma: registradorNbits generic map (14) port map (sig_mux14, csoma, Clock, sig_soma);
SAD_reg: registradorNbits generic map (14) port map (sig_soma, csadReg, Clock, sig_SadReg);
-----Contador end e menor-----
		
mux5: multiplex_2x1_Nbits generic map (5) port map (zi, sig_over_flow_soma4 & sig_soma4, "00000", sig_mux5);
reg_i: registradorNbits generic map (5) port map (sig_mux5, ci, Clock, sig_i);
soma4: somadorNbits_ovf generic map (4) port map (sig_i(3 downto 0), "0001", '0', sig_soma4, sig_over_flow_soma4);
------Saídas-------------------
		
ende  <=	sig_i(3 downto 0);
menor <=	not(sig_i(4));
saida <= sig_SadReg;

end arc;
