library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity testbench_controle_ula is
end testbench_controle_ula;

architecture tb of testbench_controle_ula is

---------------------Entradas-----------------------
signal sig_funct	: std_logic_vector (5 downto 0);
signal sig_ULAOp	: std_logic_vector (1 downto 0);
----------------------Saidas-------------------------
signal sig_sel    : std_logic_vector (2 downto 0);

signal passo : TIME:= 10 ns;


begin

	-- Connect DUV
	DUV: entity work.ControleUla port map(sig_funct, sig_ULAOp, sig_sel);
	

	process
	begin
	
		sig_funct <= "000000";
		sig_ULAOp <= "00";
		wait for passo;
		assert(sig_sel = "010") report "Fail 0" severity error;
		
		sig_funct <= "000000";
		sig_ULAOp <= "01";
		wait for passo;
		assert(sig_sel = "110") report "Fail 1" severity error;
		
		sig_funct <= "100000";
		sig_ULAOp <= "10";
		wait for passo;
		assert(sig_sel = "010") report "Fail 2" severity error;
		
		sig_funct <= "100010";
		sig_ULAOp <= "10";
		wait for passo;
		assert(sig_sel = "110") report "Fail 3" severity error;
		
		sig_funct <= "100100";
		sig_ULAOp <= "10";
		wait for passo;
		assert(sig_sel = "000") report "Fail 4" severity error;
		
		sig_funct <= "100101";
		sig_ULAOp <= "10";
		wait for passo;
		assert(sig_sel = "001") report "Fail 5" severity error;
		
		sig_funct <= "101010";
		sig_ULAOp <= "10";
		wait for passo;
		assert(sig_sel = "111") report "Fail 6" severity error;
		
		assert false report "Test done." severity note;
	wait;
	end process;
end tb;