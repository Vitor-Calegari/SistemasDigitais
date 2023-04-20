LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decodificadorBCD7Seg IS

	PORT (
			bcd : IN std_logic_vector(3 DOWNTO 0);
			abcdefg : OUT std_logic_vector(6 DOWNTO 0)
			);
			
END decodificadorBCD7Seg;

ARCHITECTURE arch OF decodificadorBCD7Seg IS

	signal A, B, C, D : std_logic;
	signal nA, nB, nC, nD : std_logic;

	BEGIN
	
		A <= bcd(0);
		B <= bcd(1);
		C <= bcd(2);
		D <= bcd(3);
		
		nA <= not bcd(0);
		nB <= not bcd(1);
		nC <= not bcd(2);
		nD <= not bcd(3);
		
		abcdefg(0) <= (nA and nB and nC and D) or (B and nC and nD) or (A and C) or (A and B);
		abcdefg(1) <= (B and nC and D) or (B and C and nD) or (A and C) or (A and B);
		abcdefg(2) <= (nB and C and nD) or (A and C) or (A and B);
		abcdefg(3) <= (nA and nB and nC and D) or (B and nC and nD) or (B and C and D) or (A and C) or (A and B);
		abcdefg(4) <= (D) or (B and nC) or (A and C);
		abcdefg(5) <= (nA and nB and D) or (nB and C) or (C and D) or (A and B);
		abcdefg(6) <= (nA and nB and nC) or (B and C and D) or (A and C) or (A and B);
		
END ARCHITECTURE;