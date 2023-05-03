LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY subtrator8bits_abs IS

	PORT (
	
			add1 : IN std_logic_vector(7 DOWNTO 0);
			add2 : IN std_logic_vector(7 DOWNTO 0);
			sum : OUT std_logic_vector(7 DOWNTO 0));
	
END subtrator8bits_abs;

ARCHITECTURE rtl OF subtrator8bits_abs IS

	signal add1_s, add2_s: std_logic_vector(8 downto 0);

begin

	add1_s <= '0' & add1;
	add2_s <= '0' & add2;
	
	process(add1_s, add2_s) is
	BEGIN
		sum <= std_logic_vector(abs(signed(add1_s) - signed(add2_s)))(7 downto 0);
	end process;
	
END rtl;