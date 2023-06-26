library ieee;
use ieee.std_logic_1164.all;

entity UlaMips is
    port (
        clk   : in std_logic;
        iniciar : in std_logic;
        reset: in std_logic;
        UlaOp: in std_logic_vector(1 downto 0);
        funct: in std_logic_vector(5 downto 0);
        a: in std_logic_vector(31 downto 0);
        b: in std_logic_vector(31 downto 0);
        c: out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of UlaMips is
    component registrador is
        PORT(CLK, R, E: IN std_logic;
            data: IN std_logic_vector(31 DOWNTO 0);
            q: OUT std_logic_vector(31 DOWNTO 0)
        );
    end component;

    component ula is
        PORT(
            sel: in std_logic_vector(2 downto 0);
            dataA, dataB: in std_logic_vector(31 downto 0);
            resultado: out std_logic_vector(31 downto 0)
        );
    end component;

    component ControleUla is
        PORT(
            funct: in std_logic_vector(5 downto 0);
            ULAOp: in std_logic_vector(1 downto 0);
            sel: out std_logic_vector(2 downto 0)
        );
    end component;

    component controlador_estados is
        port (
            clk   : in std_logic;
            reset : in std_logic;
            iniciar: in std_logic;
            EnRegA, enRegB, enRegC: out std_logic;
            pronto: out std_logic
        );
    end component;

    signal sel: std_logic_vector(2 downto 0);
    signal regA_to_ula: std_logic_vector(31 downto 0);
    signal regB_to_ula: std_logic_vector(31 downto 0);
    signal ula_to_regC: std_logic_vector(31 downto 0);
    signal enRegA, enRegB, enRegC: std_logic;

begin
    controlador_es: controlador_estados
        port map(
            clk => clk,
            reset => reset,
            iniciar => iniciar,
            EnRegA => enRegA,
            EnRegB => enRegB,
            EnRegC => enRegC
        );
    RegA: registrador
        port map(
            CLK => clk,
            R => reset,
            data => a,
            q => regA_to_ula,
            E => enRegA
        );
    RegB: registrador
        port map(
            CLK => clk,
            R => reset,
            data => b,
            q => regB_to_ula,
            E => enRegB
        );
    RegC: registrador
        port map(
            CLK => clk,
            R => reset,
            data => ula_to_regC,
            q => c,
            E => enRegC
        );
    ULA_IMPL: ula
        port map(
            sel => sel,
            dataA => regA_to_ula,
            dataB => regB_to_ula,
            resultado => ula_to_regC
        );
    Ctrl_ULA: ControleUla
        port map(
            funct => funct,
            ULAOp => ULAOp,
            sel => sel
        );

end architecture;
