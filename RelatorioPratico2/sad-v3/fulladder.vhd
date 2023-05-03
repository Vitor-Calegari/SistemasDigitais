library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
port(
	A, B, Cin: in std_logic;
	S, Cout: out std_logic
	);
end fulladder;

architecture ubuntu2 of fulladder is
    signal D, E, F: std_logic;
begin
    D <= A xor B;
    E <= D and Cin;
    F <= A and B;
    S <= D xor Cin;
    Cout <= E or F;
    
end ubuntu2;