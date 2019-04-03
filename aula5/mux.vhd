--IFPB
--Data: 27.03.19
--multiplexador


entity mux is
port(a,b,c: in bit;
		s:out bit);
end mux;

architecture mux of mux is
begin

s<= ((not c) and a) or (c and b);

end mux;