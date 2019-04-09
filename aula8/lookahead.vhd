--Quartus II - VHDL
--Sistemas Digitais (Aula 7)
--Data: 09.04.19
--LookAhead (usa em conjunto com o half_adder)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lookAhead is
generic(num: integer := 4);
port(a,b : in std_logic_vector(num-1 downto 0);
		cin : in std_logic;
		c : out std_logic_vector(num downto 0); -- nao faz diferença nesse programa
		s : out std_logic_vector(num-1 downto 0));
end lookAhead;

architecture look of lookAhead is

component half_adder is
generic(num: integer := 4);
port(a,b : in std_logic;
		g,p : out std_logic);
end component;

signal g,p: std_logic_vector(num-1 downto 0);
signal cout : std_logic_vector(num downto 0);

begin

laco: for i in 0 to num-1 generate 
comp_half : half_adder port map(a(i),b(i),g(i),p(i));
end generate;

cout(0) <= cin;
cout(1) <= g(0) or (p(0) and cin);
cout(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
cout(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
cout(4) <= g(3) or (p(3) and g(3)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);


laco2: for y in 0 to num-1 generate
s(y) <= cout(y) xor p(y);
end generate;

end look;