-- IFPB
-- EDMILA DE MACEDO GOMES
-- DATA: 22.05.19
-- CRC - checar redundancia REGISTRADOR DE DESLOCAMENTO (aula 14)
-- aula 7 slide 12
-- obejtivo: fazer com que o resto da divisao seja "00" = dados nao violados


library ieee;
use ieee.std_logic_1164.all;

entity crcx2 is
port(ser_in, clk : in std_logic;
		reset : in std_logic;
		crc_out : out std_logic_vector(1 downto 0));
end crcx2;

architecture arq of crcx2 is
signal crc : std_logic_vector(1 downto 0) := "00";

begin

crc_out <= crc;

process(clk,reset) -- lista de sensibilidade (so funciona quando tem uma variaçao na borda)
-- tudo que funciona de maneira sequencial
begin

if(reset = '1') then
	crc <= "00";
elsif(clk'event and clk = '0') then -- borda de descida
	crc(0) <= ser_in xor crc(1);
	crc(1) <= crc(0); -- deslocando o bit
end if;


end process;

end arq;