LIBRARY IEEE;
USE IEEE.Std_Logic_1164.all;
USE IEEE.std_logic_arith.all;
USE IEEE.std_logic_unsigned.all;

ENTITY Topo is
	port(
		-- Entradas --
		Clock: IN std_logic;
		iniciar, reset: IN std_logic;
		Mem_A, Mem_B : in std_logic_vector(7 downto 0);
		--- Saídas ---­
		pronto, ler: OUT std_logic;
		endereco: OUT std_logic_vector(5 downto 0);
		resultado: OUT std_logic_vector(13 DOWNTO 0)
		);
end ENTITY;

ARCHITECTURE arc OF Topo is

------- signals saída do bloco de controle ----------
	signal sig_zi, sig_ci, sig_cpA, sig_cpB, sig_zsoma, sig_csoma, sig_csad_reg : std_logic;
	
	----- signals saída bloco operativo --------------
	
	signal sig_menor: std_logic;
	
-----------components------------------

	component sad_bloco_operativo is
		port (
			-- Entradas de dados
			Clock: IN std_logic;
			Mem_A, Mem_B: IN std_logic_vector(7 DOWNTO 0);

			-- Entradas de controle
			zi, ci, cpA, cpB, zSoma, cSoma, cSadReg: IN std_logic;

			-- Saídas de dados
			saida: out std_logic_vector(13 DOWNTO 0);
			ende: out std_logic_vector(5 downto 0);
			
			-- Saídas de status
			menor: out std_logic
			) ;
		END component;
		
	component sad_controle is
		port (
			clk, iniciar, reset, menor	: in std_logic;
			zi, ci, cpA, cpB, zsoma, csoma, csad_reg, pronto, ler : out std_logic
			);

		END component;

BEGIN
bloco_de_controle: sad_controle port map (Clock, iniciar, reset, sig_menor,
														sig_zi, sig_ci, sig_cpA, sig_cpB, 
														sig_zsoma, sig_csoma, sig_csad_reg,
														pronto, ler );
bloco_operativo: sad_bloco_operativo port map (Clock, Mem_A, Mem_B, sig_zi, sig_ci,
															  sig_cpA, sig_cpB, sig_zsoma, sig_csoma,
															  sig_csad_reg, resultado, endereco,
															  sig_menor );

															  
															  
END ARCHITECTURE;


		
		
	

	