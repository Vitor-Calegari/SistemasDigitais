library ieee;
use ieee.std_logic_1164.all;

entity somador6bits_ovf is
port(

	add1, add2: in std_logic_vector(5 downto 0);
	S: out std_logic_vector(5 downto 0);
	Cout: out std_logic
	);
	
end somador6bits_ovf;

architecture rtl of somador6bits_ovf is
    
	signal Ov0, Ov1, Ov2, Ov3, Ov4: std_logic;
	
	component fulladder is
		port (A: in std_logic;
				B: in std_logic; 
				Cin: in std_logic;
				S: out std_logic;
				Cout: out std_logic
				);
	end component;
	 
begin

    fa0: fulladder port map(add1(0), add2(0), '0', S(0), Ov0);
	 fa1: fulladder port map(add1(1), add2(1), Ov0, S(1), Ov1);
	 fa2: fulladder port map(add1(2), add2(2), Ov1, S(2), Ov2);
	 fa3: fulladder port map(add1(3), add2(3), Ov2, S(3), Ov3);
	 fa4: fulladder port map(add1(4), add2(4), Ov3, S(4), Ov4);
	 fa5: fulladder port map(add1(5), add2(5), Ov4, S(5), Cout);
    
end rtl;