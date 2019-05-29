--IFPB
--Data: 02.04.19
--Somador completo
--Aula5

library ieee;
use ieee.std_logic_1164.all;

entity add1b is
port(a,b,cin: in std_logic;
		cout,s:out std_logic);
end add1b;

architecture add1b of add1b is
signal temp: std_logic;
begin

temp <= a xor b;
cout <= (a and b) or (cin and temp);
s <= cin xor temp;

end add1b;