LIBRARY IEEE;
USE IEEE.std_logic_1164.all; 
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

ENTITY sad_bloco_operativo IS
PORT(
	-- Entradas de dados
	Clock: IN std_logic;
	Mem_A, Mem_B: IN std_logic_vector(7 DOWNTO 0);

	-- Entradas de controle
	zi, ci, cpA, cpB, zSoma, cSoma, cSadReg: IN std_logic;

	-- Saídas de dados
	saida: out std_logic_vector(13 DOWNTO 0);
	ende: out std_logic_vector(5 downto 0);
	
	-- Saídas de status
	menor: out std_logic
);
END ENTITY;

ARCHITECTURE arc OF sad_bloco_operativo IS
---------------------------SIGNALS----------------------------------

--Registradores--
signal sig_pA, sig_pB: std_logic_vector(7 downto 0);
signal sig_soma, sig_SadReg: std_logic_vector(13 downto 0);
signal sig_i: std_logic_vector(6 downto 0);

----Somadores----
signal sig_diferenca : std_logic_vector(7 downto 0);
signal sig_soma14: std_logic_vector(13 downto 0);
signal sig_soma6: std_logic_vector(5 downto 0);
signal sig_over_flow_soma6: std_logic;

----Multiplex----
signal sig_mux14: std_logic_vector(13 downto 0);
signal sig_mux7: std_logic_vector(6 downto 0);

---------------------------COMPONENTS-------------------------------

component multiplex_2x1_Nbits is
	generic(N: integer := 14);
	port(
		sinal: in std_logic;
		A: in std_logic_vector(N - 1 downto 0);
		B: in std_logic_vector(N - 1 downto 0);
		S: out std_logic_vector(N - 1 downto 0)
		);
	
end component;

component registradorNbits is
	GENERIC(N :INTEGER:= 14);
	PORT (R : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0) ;
			Enable, Clock: IN STD_LOGIC ;
			Q : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
			) ;
end component;

component somador6bits_ovf is
	port(
		add1, add2: in std_logic_vector(5 downto 0);
		S: out std_logic_vector(5 downto 0);
		Cout: out std_logic
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

pA : registradorNbits generic map(8) port map( Mem_A, cpA, Clock, sig_pA );
pB : registradorNbits generic map(8) port map( Mem_B, cpB, Clock, sig_pB );
subt_ABS : subtrator8bits_abs port map( sig_pA, sig_pB, sig_diferenca );
soma14 : somador14bits port map( sig_soma, "000000" & sig_diferenca, sig_soma14 );
muxSoma : multiplex_2x1_Nbits generic map(14) port map ( zsoma, sig_soma14, "00000000000000", sig_mux14 );
soma :  registradorNbits generic map(14) port map ( sig_mux14, csoma, Clock, sig_soma );
SAD_reg : registradorNbits generic map(14) port map ( sig_soma, csadReg, Clock, sig_SadReg );

-----contador end e menor-----

mux_i : multiplex_2x1_Nbits generic map(7) port map ( zi, sig_over_flow_soma6 & sig_soma6, "0000000", sig_mux7 );
i : registradorNbits generic map(7) port map ( sig_mux7, ci, Clock, sig_i );
somador6 : somador6bits_ovf port map ( sig_i(5 downto 0), "000001", sig_soma6, sig_over_flow_soma6 );

------saídas-------------------

ende <= sig_i(5 downto 0);
menor <= not(sig_i(6));
saida <= sig_SadReg;

end arc;





