library IEEE;
use IEEE.Std_Logic_1164.all;

entity registrador_1bit is
PORT(CLK, R, E: IN std_logic;
    data: IN std_logic;
    q: OUT std_logic
 );
end registrador_1bit;

architecture rtl of registrador_1bit is
begin
    process(CLK, R, E, data)
    begin
        if R = '1' then q <= '0';
        elsif (CLK'event and CLK = '1') then
                if E = '1' then q <= data;
                end if;
        end if;

end process;
end rtl;