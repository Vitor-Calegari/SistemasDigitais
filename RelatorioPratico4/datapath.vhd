library ieee;
use ieee.std_logic_1164.all;

entity datapath is
    port (
        clk   : in std_logic;
        reset: in std_logic;
        enRegA, enRegB, enRegC: in std_logic;
		UlaOp: in std_logic_vector(1 downto 0);
        funct: in std_logic_vector(5 downto 0);
        a, b: in std_logic_vector(31 downto 0);
        c: out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of datapath is

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

    signal sig_sel: std_logic_vector(2 downto 0);
    signal sig_regA_to_ula, sig_regB_to_ula, sig_ula_to_regC: std_logic_vector(31 downto 0);

begin

    RegA: registrador port map(
										CLK => clk,
										R => reset,
										data => a,
										q => sig_regA_to_ula,
										E => enRegA
										);

    RegB: registrador port map(
										CLK => clk,
										R => reset,
										data => b,
										q => sig_regB_to_ula,
										E => enRegB
										);
    
	 RegC: registrador port map(
										CLK => clk,
										R => reset,
										data => sig_ula_to_regC,
										q => c,
										E => enRegC
										);
    
	 ULA_IMPL: ula port map(
									sel => sig_sel,
									dataA => sig_regA_to_ula,
									dataB => sig_regB_to_ula,
									resultado => sig_ula_to_regC
									);
    
	 Ctrl_ULA: ControleUla port map(
                                            funct => funct,
                                            ULAOp => ULAOp,
                                            sel => sig_sel
                                        );

end architecture;
