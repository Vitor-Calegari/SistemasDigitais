library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is

---------------------Entradas-----------------------
signal sig_clock, sig_iniciar, sig_reset: std_logic := '0';
signal sig_Mem_A, sig_Mem_B: std_logic_vector(7 downto 0);
----------------------Saidas-------------------------
signal sig_pronto, sig_ler: std_logic;
signal sig_endereco: std_logic_vector(5 downto 0);
signal sig_resultado: std_logic_vector(13 downto 0);
constant periodoClock : time := 20 ns;

shared variable passo : TIME:= 40 ns;

begin

	-- Connect DUV
	DUV: entity work.sad port map(sig_clock, sig_iniciar, sig_reset, 
											sig_Mem_A, sig_Mem_B, sig_pronto, 
											sig_ler,	sig_endereco, sig_resultado);
	
	sig_clock <= not sig_clock after periodoClock/2;
	process
	begin
	
		sig_iniciar   <= '0';
		sig_reset	  <= '0';
		sig_Mem_A	  <= "00000001";
		sig_Mem_B 	  <= "00000000";
		wait for passo;
		assert(sig_pronto = '1' and sig_resultado = "00000000000000") report "Fail 0" severity error;
		
		--Fazer os testes de verdade:
		
		assert false report "Test done." severity note;
	wait;
	end process;
end tb;