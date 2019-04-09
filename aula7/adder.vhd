--Quartus II - VHDL
--Sistemas Digitais (Aula 7)
--Data: 03.04.19
-- Somadores
--somar dois vetores utilizando signed(depois de somar os bits é necessario voltar para o que tinha antes para poder colocar na saida)


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
generic(n: integer := 8);
port(a,b : in std_logic_vector(n-1 downto 0);
		s : out std_logic_vector(n-1 downto 0)
		);
end adder;
		
architecture adderI of adder is

begin

s <= std_logic_vector(signed(a)+signed(b));

end adderI;