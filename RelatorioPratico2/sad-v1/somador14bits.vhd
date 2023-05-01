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
	BEGIN
		sum <= std_logic_vector(unsigned(add1) + unsigned(add2));
END rtl;
