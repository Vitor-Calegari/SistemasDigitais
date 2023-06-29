library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
    port (
        clk   : in std_logic;
        iniciar : in std_logic;
        reset: in std_logic;
        UlaOp: in std_logic_vector(1 downto 0);
        funct: in std_logic_vector(5 downto 0);
        a, b: in std_logic_vector(31 downto 0);
        c: out std_logic_vector(31 downto 0);
		  overflow: out std_logic
    );
end entity;

architecture rtl of toplevel is
    
    component controlador_estados is
        port (
            clk   : in std_logic;
            reset : in std_logic;
            iniciar: in std_logic;
            pronto: out std_logic;
            EnRegA, enRegB, enRegC, enRegD: out std_logic;
            reset_datapath: out std_logic
        );
    end component;
	 
	 component datapath is
		  port (
				clk   : in std_logic;
				reset: in std_logic;
				enRegA, enRegB, enRegC, enRegD: in std_logic;
				UlaOp: in std_logic_vector(1 downto 0);
				funct: in std_logic_vector(5 downto 0);
				a, b: in std_logic_vector(31 downto 0);
				c: out std_logic_vector(31 downto 0);
				overflow: out std_logic
		  );
	 end component;
	
    signal sig_enRegA, sig_enRegB, sig_enRegC, sig_enRegD: std_logic;
    signal reset_datapath: std_logic;

begin
    controlador_es: controlador_estados
        port map(
            clk => clk,
            reset => reset,
            iniciar => iniciar,
            EnRegA => sig_enRegA,
            EnRegB => sig_enRegB,
            EnRegC => sig_enRegC,
				EnRegD => sig_enRegD,
            reset_datapath => reset_datapath
        );
		  
	 bloco_operativo: datapath port map(
													clk    => clk,
													reset  => reset_datapath,
													enRegA => sig_enRegA,
													enRegB => sig_enRegB,
													enRegC => sig_enRegC,
													EnRegD => sig_enRegD,
													UlaOp  => UlaOp,
													funct  => funct,
													a      => a,
													b      => b,
													c      => c,
													overflow => overflow
	 );
    
end architecture;
