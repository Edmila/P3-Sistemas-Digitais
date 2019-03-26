--Quartus II - VHDL
--Sistemas Digitais (Aula 3)
--Data: 19.03.19
-- Exercicio 1: paridade fazendo com vector

entity parity is
port (a: in bit_vector(3 downto 0);
		p: out bit);
end parity;

architecture interna of parity is

begin
p <= a(0) xor a(1) xor a(2) xor a(3);
		
end interna;