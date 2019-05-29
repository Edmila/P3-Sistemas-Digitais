library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component div2 is 
generic(size: integer := 4);
port(a, b : in std_logic_vector(size-1 downto 0);
	  resto, resultado : out std_logic_vector(size-1 downto 0);
	  clock, reset : in std_logic;
	  ready : out std_logic);
end component;

signal a :  std_logic_vector(3 downto 0) := "1111";
signal b :  std_logic_vector(3 downto 0) := "0011";
signal resto, resultado : std_logic_vector(3 downto 0);
signal clock : std_logic := '0';
signal reset : std_logic := '0';
signal ready : std_logic := '1';

begin

div : div2 port map(a,b,resto,resultado,clock,reset,ready);

process
begin

wait for 10 ns;
reset <= '1';
wait for 10 ns;
reset <= '0';

for i in 0 to 10 loop 
	clock <= '1';
	wait for 100 ns;
	clock <= '0';
	wait for 100 ns;
	
end loop;
wait;
end process;

end test;