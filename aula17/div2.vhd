-- IFPB
-- EDMILA DE MACEDO 
-- DATA: 29.05.19
-- DIVISOR 2

-- A é o valor que vai ser dividido e B o divisor. 
-- aplica complemento de 2 em B, subtrai e o resultado(carry out) soma em A --> A= A-B quando cout =1
-- apos o resultado do carry desloca B p/ direita
-- no final do cout vai ser armazenado em resto

library ieee;
use ieee.std_logic_1164.all;

entity div2 is 
generic(size: integer := 8);
port(a, b : in std_logic_vector(size-1 downto 0);
	  resto, resultado : out std_logic_vector(size-1 downto 0);
	  clock, reset : in std_logic;
	  ready : out std_logic);
end div2;

architecture div of div2 is
component subtrator is 
generic(n: integer := 2*size);
port(a,b:in std_logic_vector(n-1 downto 0);
	  s:out std_logic_vector(n-1 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;

signal a_m, b_m, temp_a_m : std_logic_vector(2*size-1 downto 0);
signal temp_res : std_logic_vector(size-1 downto 0);
signal cout : std_logic;

begin

resultado <= temp_res;
resto <= a_m(size-1 downto 0);

sub : subtrator port map(a_m,b_m,temp_a_m,'1',cout);

process(reset,clock)

variable cont : integer range 0 to 9 := 0; -- so existe dentro do bloco process. 

begin

if(reset = '1') then
	a_m(size-1 downto 0) <= a;
	a_m(2*size-1 downto size) <= (others => '0');
	
	b_m(size-1 downto 0) <= (others => '0');
	b_m(2*size-1 downto size) <= b;
	
	temp_res <= (others => '0');
	ready <= '0';
	cont := 0; -- por ser uma variable nao tem <=
	
elsif(clock'event and clock = '0') then -- pulso de clock
	if(cont = size+1) then
		ready <= '1';
	else
		cont := cont + 1;
		temp_res(size-1 downto 1) <= temp_res(size-2 downto 0); -- para mover os bits
		temp_res(0) <= cout;
		b_m(2*size-2 downto 0) <= b_m(2*size-1 downto 1);
		b_m(2*size-1) <= '0';
		
		if(cout = '1') then
		a_m <= temp_a_m;
		end if;
		
	end if;

end if;

end process;

end div;