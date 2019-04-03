--IFPB
--Data: 27.03.19
--multiplexador 2 (versao com when)
--Aula5


entity mux2 is
port(a,b,c: in bit;
		s:out bit);
end mux2;

architecture mux2 of mux2 is
begin

s <= a when c = '0' else
		b;

end mux2;