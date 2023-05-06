library ieee;
use ieee.std_logic_1164.all;

entity multiplex_2x1_Nbits is
	generic(N: integer := 14);
	port(
		sinal: in std_logic;
		A: in std_logic_vector(N - 1 downto 0);
		B: in std_logic_vector(N - 1 downto 0);
		S: out std_logic_vector(N - 1 downto 0)
		);
end multiplex_2x1_Nbits;

architecture rtl of multiplex_2x1_Nbits is
begin
    S <= A when sinal = '0' else
         B;
end rtl;