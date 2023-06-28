library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
    port(
        sel: in std_logic_vector(2 downto 0);  --000: and, 001: or , 010: adicao, 110: subtracao, 111: set on less than
        dataA, dataB: in std_logic_vector(31 downto 0);
        resultado: out std_logic_vector(31 downto 0);
		  overflow: out std_logic
    );
end entity;

architecture arc_ULA of ULA is
signal A33bits, B33bits, add33bits, sub33bits: std_logic_vector(32 downto 0);
signal set_on_less_than: std_logic_vector(31 downto 0);
begin

-- lidando com a adição e subtração concatenando um 0 a esquerda
	A33bits <= '0' & dataA;
	B33bits <= '0' & dataB;
	add33bits <= std_logic_vector(unsigned(A33bits) + unsigned(B33bits));
	sub33bits <= std_logic_vector(unsigned(A33bits) - unsigned(B33bits));

-- definindo o valor do sinal set_on_less_than que o resultado irá receber quando sel = "110"
	set_on_less_than <=
		std_logic_vector(to_unsigned(1, 32)) when dataA < dataB else
		std_logic_vector(to_unsigned(0, 32));

-- valor do output resultado
	resultado <= 
		dataA and dataB when sel = "000" else
		dataA or dataB when sel = "001" else
		add33bits(31 downto 0) when sel = "010" else
		sub33bits(31 downto 0) when sel = "110" else
		set_on_less_than;

-- valor do output overflow
	overflow <=
		add33bits(32) when sel = "010" else
		sub33bits(32) when sel = "110" else
		'0';

end architecture;