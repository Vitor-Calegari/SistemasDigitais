library IEEE;
use IEEE.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity testbench_controle_ula is
end testbench_controle_ula;

architecture tb of testbench_controle_ula is

---------------------Entradas-----------------------
signal clk      : std_logic;
signal iniciar  : std_logic;
signal reset    : std_logic;
signal funct	: std_logic_vector (5 downto 0);
signal UlaOp	: std_logic_vector (1 downto 0);
signal a		: std_logic_vector (31 downto 0);
signal b		: std_logic_vector (31 downto 0);
----------------------Saidas-------------------------
signal c          : std_logic_vector (31 downto 0);


signal passo : TIME:= 30 ns;
signal clock_period : TIME := 20 ns;


clk_process :process
begin
	 clk <= '0';
	 wait for clk_period/2;
	 clk <= '1';
	 wait for clk_period/2;
end process;

process

begin

	-- Connect DUV
	DUV: entity work.toplevel port map(clk, iniciar, reset, UlaOp, funct, a, b, c);

    process
	begin
	
		rst <= '0';
		iniciar <= '1';
		a <= "00000000000000000000000011111111"; -- 11111111 (8bits)
      	b <= "00000000000000000000000000000000"; -- 00000000 (8bits)
		funct <= "000000"; -- 000000 (6 bits)
		UlaOp <= "00";
		wait for passo;
		assert(c="00000000000000000000000011111111") 
		report "Falha no lw/sw" severity error;

		a <= "00000000000000000000000000000011"; -- 11111111 (8bits)
      	b <= "00000000000000000000000000000001"; -- 00000000 (8bits)
		funct <= "000000"; -- 000000 (6 bits)
		UlaOp <= "01";
		wait for passo;
		assert(c="00000000000000000000000000000010") 
		report "Falha no beq" severity error;

		a <= "00000000000000000000000000000011"; -- 11111111 (8bits)
		b <= "00000000000000000000000000000001"; -- 00000000 (8bits)
		funct <= "100000"; -- 000000 (6 bits)
		UlaOp <= "10";
		wait for passo;
		assert(c="00000000000000000000000000000100") 
		report "Falha na adição" severity error;

		a <= "00000000000000000000000000000111"; -- 11111111 (8bits)
		b <= "00000000000000000000000000000001"; -- 00000000 (8bits)
		funct <= "100010"; -- 000000 (6 bits)
		UlaOp <= "10";
		wait for passo;
		assert(c="00000000000000000000000000000110") 
		report "Falha na subtração" severity error;

		a <= "11111111111111111111111111111111"; -- 11111111 (8bits)
		b <= "00000000000000000000000000000000"; -- 00000000 (8bits)
		funct <= "100100"; -- 000000 (6 bits)
		UlaOp <= "10";
		wait for passo;
		assert(c="00000000000000000000000000000000") 
		report "Falha no and bit a bit" severity error;

		a <= "11111111111111111111111111111111"; -- 11111111 (8bits)
		b <= "00000000000000000000000000000000"; -- 00000000 (8bits)
		funct <= "100101"; -- 000000 (6 bits)
		UlaOp <= "10";
		wait for passo;
		assert(c="11111111111111111111111111111111") 
		report "Falha no or bit a bit" severity error;

		a <= "11111111111111111111111111111111"; -- 11111111 (8bits)
		b <= "00000000000000000000000000000000"; -- 00000000 (8bits)
		funct <= "101010"; -- 000000 (6 bits)
		UlaOp <= "10";
		wait for passo;
		assert(c="00000000000000000000000000000000") 
		report "Falha no or slt" severity error;

	end process;
end tb;