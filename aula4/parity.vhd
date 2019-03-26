--Quartus II - VHDL
--Sistemas Digitais (Aula 4)
--Data: 26.03.19
--Paridade  (criar um codigo para gerar varias saidas das portas)
-- Utilizaçao do "generate" que gera codigo

entity parity is
generic(n: integer:= 4);
port(input: in bit_vector(n-1 downto 0);
		output: out bit);
end parity;

architecture parity of parity is
signal s: bit_vector(n downto 0);
begin

laco: for i in 0 to n-1 generate
	s(i+1)<= s(i) xor input(i);
end generate;

s(0) <= '0';
output <= s(n);


end parity;