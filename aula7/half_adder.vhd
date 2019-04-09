--Quartus II - VHDL
--Sistemas Digitais (Aula 7)
--Data: 03.04.19
-- half adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity half_adder is
generic(num: integer := 4);
port(a,b : in bit;
		g,p : out bit);
end half_adder;

architecture half of half_adder is
begin

g <= a and b;
p <= a xor b;

end half;