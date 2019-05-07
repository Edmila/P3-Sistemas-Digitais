--IFPB
--Data:07.05.19
--Aula12 - utilizaçao do latch para ligar um led
--https://www.ti.com/lit/ds/symlink/cd54hc4511.pdf "link do CD54hc4511"
--slide de lincoln aula6

library ieee;
use ieee.std_logic_1164.all;

entity latchwhen is

port(reset, preset, en,d : in std_logic;
	q: out std_logic);
end latchwhen;

architecture arq of latchwhen is
signal state: std_logic:= '0';

begin
state <= '0' when reset = '1' else
			'1' when preset = '1' else
			d when en = '1' else
			state;
			
q<= state;
end arq;