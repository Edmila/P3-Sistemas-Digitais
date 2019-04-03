--IFPB
--Data: 27.03.19
--Somador 4 bits
--Aula5

entity soma4 is
port(a,b,c: in bit_vector(3 downto 0); --vai ter espaco para 4 bits em a e b
		s: out bit_vector(3 downto 0); --espera-se que saiam 4 bits na saida
		cin: in bit;		--cin e cout so possuem um bit (ver tabela aula 3)
		cout: out bit);

end soma4;

architecture soma4 of soma4 is
component add1b is 
port(a,b,cin: in bit;
		s,cout: out bit);
end component;
signal carry: bit_vector(4 downto 0);

begin

add0: add1b port map(a(0),b(0),carry(0),s(0),carry(1));

add1: add1b port map(a(1),b(1),carry(1),s(1),carry(2));

add2: add1b port map(a(2),b(2),carry(2),s(2),carry(3));

add3: add1b port map(a(3),b(3),carry(3),s(3),carry(4));

carry(0) <= cin;
cout <= carry(4);

end soma4;