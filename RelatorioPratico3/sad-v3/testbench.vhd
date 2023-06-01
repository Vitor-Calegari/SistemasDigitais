library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

entity testbench is
end testbench;

architecture tb of testbench is

---------------------Entradas-----------------------
signal sig_clock, sig_iniciar, sig_reset: std_logic := '0';
signal sig_Mem_A, sig_Mem_B: std_logic_vector(31 downto 0);
----------------------Saidas-------------------------
signal sig_pronto, sig_ler: std_logic;
signal sig_endereco: std_logic_vector(3 downto 0);
signal sig_resultado: std_logic_vector(13 downto 0);

constant periodoClock : time := 20 ns;
constant passo : TIME:= 1040 ns;

begin

	-- Connect DUV
	DUV: entity work.sad port map(sig_clock, sig_iniciar, sig_reset, 
											sig_Mem_A, sig_Mem_B, sig_pronto, 
											sig_ler,	sig_endereco, sig_resultado);
	
	sig_clock   <= not sig_clock after periodoClock/2;
	sig_iniciar <= '1';
	sig_reset   <= '0';
	process is
	file arquivo_de_estimulos : text open read_mode is "../../estimulos.dat";
	variable linha_de_estimulos: line;
	variable espaco: character;
	variable valor_de_entrada_A, valor_de_entrada_B: bit_vector(31 downto 0);
	variable valor_de_saida: bit_vector(13 downto 0);
	begin
		while not endfile(arquivo_de_estimulos) loop
			-- lê linha
			readline(arquivo_de_estimulos, linha_de_estimulos);
			read(linha_de_estimulos, valor_de_entrada_A);
			sig_Mem_A <= to_stdlogicvector (valor_de_entrada_A);
			read(linha_de_estimulos, espaco);
			
			read(linha_de_estimulos, valor_de_entrada_B);
			sig_Mem_B <= to_stdlogicvector (valor_de_entrada_B);
			read(linha_de_estimulos, espaco);
			
			read(linha_de_estimulos, valor_de_saida);
			wait for passo;
				assert (sig_resultado = to_stdlogicvector(valor_de_saida)) 
					report "Falha na simulacao" severity error;
		end loop;
		wait for passo;
		assert false report "Test done." severity note;
	wait;
	end process;
end tb;