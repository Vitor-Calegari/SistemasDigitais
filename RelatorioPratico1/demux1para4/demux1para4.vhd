LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY demux1para4 IS

	PORT (
			f : IN std_logic;
			sel : IN std_logic_vector (1 DOWNTO 0);
			a, b, c, d : OUT std_logic
			);
			
END demux1para4;

ARCHITECTURE arch OF demux1para4 IS

	BEGIN
	
	a <= f when sel = "00" else '0';
	b <= f when sel = "01" else '0';
	c <= f when sel = "10" else '0';
	d <= f when sel = "11" else '0';
	
END arch;
