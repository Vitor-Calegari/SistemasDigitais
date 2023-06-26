library IEEE;
use IEEE.Std_Logic_1164.all;

entity registrador is
PORT(CLK, R, E: IN std_logic;
    data: IN std_logic_vector(31 DOWNTO 0);
    q: OUT std_logic_vector(31 DOWNTO 0)
 );
end registrador;

architecture rtl of registrador is
begin
    process(CLK, R, E, data)
    begin
        if R = '1' then q <= (others => '0');
        elsif (CLK'event and CLK = '1') then
                if E = '1' then q <= data;
                end if;
        end if;

end process;
end rtl;