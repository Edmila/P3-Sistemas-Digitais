--Quartus II - VHDL
--Sistemas Digitais (Aula 4)
--Data: 26.03.19
--testbench

entity testbench is
end testbench;

architecture test of testbench is

component parity is
generic(n: integer:= 5);
port(input: in bit_vector(n-1 downto 0);
		output: out bit);
end component;

signal entrada: bit_vector(4 downto 0);
signal saida: bit;
begin

check: parity port map(entrada,saida);

entrada <= "01011",
				"01111" after 10 ns,
				"01001" after 20 ns,
				"11101" after 30 ns,
				"11101" after 40 ns,
				"01101" after 50 ns,
				"00000" after 60 ns;
				
end test;