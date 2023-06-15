library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControleUla is

	port(
		funct	: in std_logic_vector (5 downto 0);
		ULAOp	: in std_logic_vector (1 downto 0);
		sel   : out std_logic_vector(2 downto 0)
	);

end entity;

architecture rtl of ControleUla is

	signal sig_funct_sel: std_logic_vector(2 downto 0);

begin

	sig_funct_sel <= "010" when funct = "100000" else -- adição
						  "110" when funct = "100010" else -- subtração
						  "000" when funct = "100100" else -- and
						  "001" when funct = "100101" else -- or
						  "111" when funct = "101010" else -- set on less than
					     "011";									  -- adição
						  
	sel <= "010" 			when ULAOp = "00" else -- adição
			 "110" 			when ULAOp = "01" else -- subtração
			 sig_funct_sel when ULAOp = "10" else -- seleção funct
			 "011";                               -- erro

end rtl;
