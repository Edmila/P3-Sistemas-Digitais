--IFPB
--Data: 27.03.19
--Somador completo
--Aula5


entity add1b is
port(a,b,cin: in bit;
		cout,s:out bit);
end add1b;

architecture add1b of add1b is
signal y: bit;
begin

y <= a xor b;
cout <= (a and b) or (cin and y);
s <= cin xor y;

end add1b;