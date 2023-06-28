library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbenchULA is
end testbenchULA;

architecture arc_testULA of testbenchULA is
signal sel: std_logic_vector(2 downto 0);
signal dataA: std_logic_vector(31 downto 0);
signal dataB: std_logic_vector(31 downto 0);
signal resultado: std_logic_vector(31 downto 0);
signal overflow: std_logic;

CONSTANT passo : TIME := 20 ns;

begin
duv: entity work.ula
port map(sel, dataA, dataB, resultado, overflow);

	process
	begin

		-- testes de and e or

		dataA <= "11111111111111111111111111111111";
		dataB <= "11111111111111111111111111111111";

		sel <= "000"; -- and
		wait for passo;
		assert (resultado="11111111111111111111111111111111" and overflow='0')
		report "Erro em and no primeiro caso" severity error;

		sel <= "001"; -- or
		wait for passo;
		assert (resultado="11111111111111111111111111111111")
		report "Erro em or no primeiro caso" severity error;


		dataA <= "11111111111111111111111111111111";
		dataB <= "00000000000000000000000000000000";

		sel <= "000"; -- and
		wait for passo;
		assert (resultado="00000000000000000000000000000000" and overflow='0')
		report "Erro em and no segundo caso" severity error;

		sel <= "001"; -- or
		wait for passo;
		assert (resultado="11111111111111111111111111111111")
		report "Erro em or no segundo caso" severity error;


		dataA <= "00000000000000000000000000000000";
		dataB <= "00000000000000000000000000000000";

		sel <= "000"; -- and
		wait for passo;
		assert (resultado="00000000000000000000000000000000" and overflow='0')
		report "Erro em and no terceiro caso" severity error;

		sel <= "001"; -- or
		wait for passo;
		assert (resultado="00000000000000000000000000000000")
		report "Erro em or no terceiro caso" severity error;


		dataA <= "01101001000110110111010011010100";
		dataB <= "10110010110111001101001010011011";

		sel <= "000"; -- and
		wait for passo;
		assert (resultado="00100000000110000101000010010000" and overflow='0')
		report "Erro em and no quarto caso" severity error;

		sel <= "001"; -- or
		wait for passo;
		assert (resultado="11111011110111111111011011011111")
		report "Erro em or no quarto caso" severity error;


		-- testes da operação adição
		sel <= "010"; -- add

		dataA <= "11111111111111111111111111111111";
		dataB <= "00000000000000000000000000000000";
		wait for passo;
		assert (resultado="11111111111111111111111111111111" and overflow='0')
		report "Erro em adicao no primeiro caso" severity error;


		dataA <= "11111111111111111111111111111111";
		dataB <= "11111111111111111111111111111111";
		wait for passo;
		assert (resultado="11111111111111111111111111111110" and overflow='1')
		report "Erro em adicao no segundo caso" severity error;


		dataA <= "00000000000000000000000000000000";
		dataB <= "00000000000000000000000000000000";
		wait for passo;
		assert (resultado="00000000000000000000000000000000" and overflow='0')
		report "Erro em adicao no terceiro caso" severity error;


		dataA <= std_logic_vector(to_unsigned(50000, 32));
		dataB <= std_logic_vector(to_unsigned(85000, 32));
		wait for passo;
		assert (resultado=std_logic_vector(to_unsigned(135000, 32)) and overflow='0')
		report "Erro em adicao no quarto caso" severity error;


		-- testes da operacao subtração
		sel <= "110"; -- sub

		dataA <= "11111111111111111111111111111111";
		dataB <= "11111111111111111111111111111111";
		wait for passo;
		assert (resultado="00000000000000000000000000000000" and overflow='0')
		report "Erro em subtracao no primeiro caso" severity error;


		dataA <= "11111111111111111111111111111111";
		dataB <= "00000000000000000000000000000000";
		wait for passo;
		assert (resultado="11111111111111111111111111111111" and overflow='0')
		report "Erro em subtracao no segundo caso" severity error;


		dataA <= "00000000000000000000000000000111";
		dataB <= "00000000000000000000000000000010";
		wait for passo;
		assert (resultado="00000000000000000000000000000101" and overflow='0')
		report "Erro em subtracao no terceiro caso" severity error;


		dataA <= "00000000000000000000000000000000";
		dataB <= "11111111111111111111111111111111";
		wait for passo;
		assert (resultado="00000000000000000000000000000001" and overflow='1')
		report "Erro em subtracao no quarto caso" severity error;


		dataA <= "00000000000000000000000000000010";
		dataB <= "00000000000000000000000000000111";
		wait for passo;
		assert (resultado="11111111111111111111111111111011" and overflow='1')
		report "Erro em subtracao no quinto caso" severity error;


		-- testes da operacao set on less than
		sel <= "111"; -- sub

		dataA <= "10010101000101110100011000011000";
		dataB <= "00110010110001011111001010100101";
								-- A>B
		wait for passo;
		assert (resultado=std_logic_vector(to_unsigned(0, 32)) and overflow='0')
		report "Erro em set on less than no primeiro caso" severity error;


		dataA <= "00110010110001011111001010100101";
		dataB <= "10010101000101110100011000011000";
								-- A<B
		wait for passo;
		assert (resultado=std_logic_vector(to_unsigned(1, 32)) and overflow='0')
		report "Erro em set on less than no segundo caso" severity error;


		dataA <= "10010101000101110100011000011000";
		dataB <= "10010101000101110100011000011000";
								-- A=B
		wait for passo;
		assert (resultado=std_logic_vector(to_unsigned(0, 32)) and overflow='0')
		report "Erro em set on less than no terceiro caso" severity error;


		wait for passo;
		assert false report "Teste feito" severity note;
		wait;
	end process;
end arc_testULA;
