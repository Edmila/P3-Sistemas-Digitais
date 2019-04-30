-- IFPB
-- Data:30.04.19
-- Aula11 - versao 2 do latch (outra forma de fazer)

library ieee;
use ieee.std_logic_1164.all;

entity latch_v2 is
port(r,s : in std_logic;
		q,qb: out std_logic);
end latch_v2;

architecture combinational of latch_v2 is
signal state: std_logic;
begin

q <= state;
qb <= not state;

-- process = lista de sensibilidade (condiçao para ser executado)
process(r,s) -- bloco que permite que as linhas sejam executadas sequencialmente
begin
if(r = '1') then
	state <= '0';
	elsif(s = '1') then
	state <= '1';
	end if;
	
end process;

end combinational;