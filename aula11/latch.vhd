--IFPB
--Data:30.04.19
--Aula11 - latch 

library ieee;
use ieee.std_logic_1164.all;

entity latche is
port(r,s : in std_logic;
		q,qb: buffer std_logic); --(buffer) permite que tenha um sinal de saida realimentando com outro sinal de saida
end latche;

architecture combinational of latche is

begin

q <= (not s) nand qb;
qb <= (not r) nand q;

end combinational;