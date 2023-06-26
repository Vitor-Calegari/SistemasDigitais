library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
    port(
        sel: in std_logic_vector(2 downto 0);  --000:AND , 001:OR , 010:ADD, 110:SUB, 111:SLT
        dataA, dataB: in std_logic_vector(31 downto 0);
        resultado: out std_logic_vector(31 downto 0)
    );
end entity;

architecture arc_ULA of ULA is
begin
    resultado <= 
        dataA and dataB when sel = "000" else
        dataA or dataB when sel = "001" else
        std_logic_vector(unsigned(dataA) + unsigned(dataB)) when sel = "010" else
        std_logic_vector(unsigned(dataA) - unsigned(dataB)) when sel = "110" else
        "00000000000000000000000000000001" when dataA < dataB else
        "00000000000000000000000000000000";
end architecture;