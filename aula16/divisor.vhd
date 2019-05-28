-- IFPB
-- EDMILA DE MACEDO 
-- DATA: 28.05.19
-- DIVISOR

library ieee;
use ieee.std_logic_1164.all;

entity divisor is 
generic(size: integer := 8);
port(a, b : in std_logic_vector(size-1 downto 0);
	  resto, resultado : out std_logic_vector(size-1 downto 0);
	  clock, reset : in std_logic;
	  ready : out std_logic);
end divisor;

architecture div of divisor is

component subtrator is 
generic(n: integer := 8);
port(a,b:in std_logic_vector(n-1 downto 0);
	  s:out std_logic_vector(n-1 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;

signal acc : std_logic_vector(size-1 downto 0) := (others => '0'); --others: referencia ao que os outros valores irao receber, como nao existem outros, todos irao receber '0'
signal w : std_logic_vector(size-1 downto 0):= (others => '0');
signal x : std_logic_vector(size-1 downto 0):= (others => '0');
signal temp_add : std_logic_vector(size-1 downto 0); 
signal temp_sub : std_logic_vector(size-1 downto 0);
signal add_c : std_logic;
signal sub_c : std_logic;
signal status : std_logic;
signal temp : std_logic_vector(size-1 downto 0);

begin

temp <= (size-1 downto 1 => '0',0 => sub_c);
sub : subtrator port map(w,x,temp_sub,'1',sub_c);
adder : subtrator port map(acc,temp,temp_add,'0',add_c);
ready <= status;
resto <= w;
resultado <= acc;

process(reset, clock)
begin

if(reset = '1') then
	status <= '0';
	w <= a;
	x <= b;
	acc <= (others => '0');
	
elsif(clock'event and clock = '0') then
	if(sub_c = '1') then
		w <= temp_sub;
		acc <= temp_add;
	else
		status <= '1';
	end if;
end if;

end process;

end div;
