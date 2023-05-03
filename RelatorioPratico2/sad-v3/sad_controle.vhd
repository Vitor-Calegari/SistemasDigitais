library ieee;
use ieee.std_logic_1164.all;

entity sad_controle is

	port 
	(
		clk, iniciar, reset, menor	: in std_logic;
		zi, ci, cpA, cpB, zsoma, csoma, csad_reg, pronto, ler : out std_logic
	);

end entity;

architecture bc of sad_controle is

	type Estado is (S0, S1, S2, S3, S4, S5);

	signal estado_atual, proximo_estado : Estado;

begin

	process (estado_atual, iniciar, menor)
	begin
		case estado_atual is
			when S0 =>
			
				zi       <= 'X';
				ci       <= '0';
				cpA      <= '0';
				cpB      <= '0';
				zsoma    <= 'X';
				csoma    <= '0';
				csad_reg <= '0';
				pronto   <= '1';
				ler      <= '0';
					
				if (iniciar = '1') then
					proximo_estado <= S1;
				else
					proximo_estado <= S0;
				end if;
				
			when S1 =>
			
				zi       <= '1';
				ci       <= '1';
				cpA      <= '0';
				cpB      <= '0';
				zsoma    <= '1';
				csoma    <= '1';
				csad_reg <= '0';
				pronto   <= '0';
				ler      <= '0';
			
				proximo_estado <= S2;
				
			when S2 =>
				
				zi       <= 'X';
				ci       <= '0';
				cpA      <= '0';
				cpB      <= '0';
				zsoma    <= 'X';
				csoma    <= '0';
				csad_reg <= '0';
				pronto   <= '0';
				ler      <= '0';
				
				if (menor = '1') then
					proximo_estado <= S3;
				else
					proximo_estado <= S5;
				end if;
				
			when S3 =>
			
				zi       <= 'X';
				ci       <= '0';
				cpA      <= '1';
				cpB      <= '1';
				zsoma    <= 'X';
				csoma    <= '0';
				csad_reg <= '0';
				pronto   <= '0';
				ler      <= '1';
			
				proximo_estado <= S4;
				
			when S4 =>
			
				zi       <= '0';
				ci       <= '1';
				cpA      <= '0';
				cpB      <= '0';
				zsoma    <= '0';
				csoma    <= '1';
				csad_reg <= '0';
				pronto   <= '0';
				ler      <= '0';
			
				proximo_estado <= S2;
				
			when S5 =>
			
				zi       <= 'X';
				ci       <= '0';
				cpA      <= '0';
				cpB      <= '0';
				zsoma    <= 'X';
				csoma    <= '0';
				csad_reg <= '1';
				pronto   <= '0';
				ler      <= '0';
			
				proximo_estado <= S0;
				
		end case;
	end process;

	process (clk, reset)

	begin
		if (reset = '1') then
			Estado_atual <= S0;
		elsif (rising_edge(clk)) then
			Estado_atual <= Proximo_estado;
		end if;
			
	end process;

end bc;
