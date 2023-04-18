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

	BEGIN
	
		abcdefg <= "0000001" when bcd = "0000" else
				     "1001111" when bcd = "0001" else
					  "0010010" when bcd = "0010" else
					  "0000110" when bcd = "0011" else
					  "1001100" when bcd = "0100" else
					  "0100100" when bcd = "0101" else
					  "0100000" when bcd = "0110" else
					  "0001111" when bcd = "0111" else
					  "0000000" when bcd = "1000" else
					  "0000100" when bcd = "1001" else
					  "0000000";
	
	END arch;