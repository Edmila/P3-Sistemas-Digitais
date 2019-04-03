library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component addnbits is
generic(n: integer := 8);
port(a,b: in std_logic_vector(n-1 downto 0);
     s: out std_logic_vector(n-1 downto 0);
	  cin: in std_logic;
	  cout: out std_logic);
end component;

signal a,b,s: std_logic_vector(8-1 downto 0);
signal cin, cout: std_logic;
begin
x: addnbits port map(a,b,s,cin,cout);

a <=  "11000000",
		"01100000" after 100 ns,
		"00010100" after 200 ns,
		"01100000" after 300 ns,
		"00000001" after 400 ns,
		"00000000" after 500 ns;
		
b <=  "00000110",
		"00000011" after 100 ns,
		"01000100" after 200 ns,
		"01001100" after 300 ns,
		"01111111" after 400 ns,
		"00000000" after 500 ns;
cin <= '0';
end test;