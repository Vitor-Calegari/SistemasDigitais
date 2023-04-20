LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY demux1para4 IS
	GENERIC (N : POSITIVE := 2);
	PORT (
			f : IN std_logic_vector(N - 1 DOWNTO 0);
			sel : IN std_logic_vector (1 DOWNTO 0);
			a, b, c, d : OUT std_logic_vector(N - 1 DOWNTO 0)
			);
			
END demux1para4;

ARCHITECTURE arch OF demux1para4 IS

	BEGIN
	
	a <= f when sel = "00" else (others => '0');
	b <= f when sel = "01" else (others => '0');
	c <= f when sel = "10" else (others => '0');
	d <= f when sel = "11" else (others => '0');
	
END arch;
