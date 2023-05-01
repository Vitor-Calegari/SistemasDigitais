library ieee;
use ieee.std_logic_1164.all;

entity multiplex_2x1_7bits is
	port(
		sinal: in std_logic;
		A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(6 downto 0);
		S: out std_logic_vector(6 downto 0)
		);
end multiplex_2x1_7bits;

architecture rtl of multiplex_2x1_7bits is
begin
    S <= A when sinal = '0' else
         B;
end rtl;