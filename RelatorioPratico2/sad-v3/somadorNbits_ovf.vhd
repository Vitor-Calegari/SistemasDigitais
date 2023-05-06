LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY somadorNbits_ovf IS
	GENERIC (N : INTEGER := 4);
	PORT(
		a, b: IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
		cout: OUT STD_LOGIC );
	END somadorNbits_ovf;

ARCHITECTURE comportamento OF somadorNbits_ovf IS

	SIGNAL c: STD_LOGIC_VECTOR (N - 1 DOWNTO 1);

	COMPONENT fulladder
		PORT(
			A, B, Cin: IN STD_LOGIC;
			S, Cout: OUT STD_LOGIC );
	END COMPONENT;
	
	BEGIN
		scs: for i in 0 to N - 1 generate
			sc_internal: if (i = 0) generate 
				sc: fulladder PORT MAP(a(i), b(i), cin, s(i), c(i+1));
				elsif (i = (N - 1)) generate 
					sc : fulladder PORT MAP(a(i), b(i), c(i), s(i), cout);
					
				else generate 
					sc: fulladder PORT MAP(a(i), b(i), c(i), s(i), c(i+1));
		
		end generate sc_internal;
	end generate scs;
END comportamento;
