entity testbench is
end testbench;

architecture test of testbench is

--definição das variaveis(signals)
component aula2 IS

--pinos de entrada A
--pinos de saida Y
PORT(A1,A2,A3,A4,A5,A6: IN BIT;
            Y1,Y2,Y3,Y4,Y5,Y6: OUT BIT);
END component;
----------------------------

signal a1,a2,a3,a4,a5,a6: bit;
signal y1,y2,y3,y4,y5,y6: bit;

begin

x: aula2 port map(a1,a2,a3,a4,a5,a6,
                  y1,y2,y3,y4,y5,y6);  --vai mapear os pinos com os sinais (colocar na ordem)

-- <= recebe
a1 <= '0',
		'1' after 90 ns,
		'0' after 200 ns, -- começa com um nivel logico e depois de um tempo ele muda o estado
		'1' after 250 ns;
		
a2 <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
		
a3 <= '0',
		'1' after 90 ns,
		'0' after 200 ns, 
		'1' after 250 ns;
		
a4 <= '0',
		'1' after 90 ns,
		'0' after 200 ns, 
		'1' after 250 ns;
	
a5 <= '0',
		'1' after 90 ns,
		'0' after 200 ns, 
		'1' after 250 ns;
		
a6 <= '0',
		'1' after 90 ns,
		'0' after 200 ns, 
		'1' after 250 ns;
		
end test;