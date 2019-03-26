--	Quartus II - VHDL
--	Sistemas Digitais (Aula 3)
--	Data: 20.03.19


entity casca is

port(A,B,C : in bit;
		S : out bit);
end casca;

architecture miolo of casca is

signal D : bit;
begin
D<= A and B;
s<= D xor C;
end miolo;