library ieee;
use ieee.std_logic_1164.all;

entity controlador_estados is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        iniciar: in std_logic;
        EnRegA, enRegB, enRegC: out std_logic;
        pronto: out std_logic
    );
end entity;

architecture rtl of controlador_estados is
    TYPE
    Estado is (S0, S1, S2);
    signal estado_atual: Estado;

begin

    process (reset, clk)
    begin
        if reset = '1' then
            estado_atual <= S0;
        elsif (rising_edge(clk)) then
            case estado_atual is
                when S0 =>
                if iniciar = '1' then
                    estado_atual <= S1;
                else
                    estado_atual <= S0;
                end if;
                
                when S1 =>
                    estado_atual <= S2;

                when S2 => 
                    estado_atual <= S0;
                end case;
            end if;
        end process;
        pronto <= '1' when
            estado_atual = S0
        else '0';
        EnRegA <= '1' when
            estado_atual = S1
        else '0';
        EnRegB <= '1' when
            estado_atual = S1
        else '0';
        EnRegC <= '1' when
            estado_atual = S2
        else '0';
end architecture;
