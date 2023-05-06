LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY somador14bits IS

	PORT (
	
			add1 : IN std_logic_vector(13 DOWNTO 0);
			add2 : IN std_logic_vector(13 DOWNTO 0);
			sum : OUT std_logic_vector(13 DOWNTO 0));
	
END somador14bits;

ARCHITECTURE rtl OF somador14bits IS
	
	signal add1_un, add2_un: std_logic_vector(14 downto 0);
	
	BEGIN
		add1_un <= '0' & add1;
		add2_un <= '0' & add2;
		sum <= std_logic_vector(unsigned(add1_un) + unsigned(add2_un))(13 downto 0);
END rtl;
