--IFPB
--Data:10.04.19
--Aula9 - Carry select adder(em conjunto com o add1b, mux2 e addnbits)
library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder is
port(a,b,c,d : in std_logic_vector(3 downto 0);
		cin: in std_logic;
		coutfin : out std_logic;
		s1,Sfinal : out std_logic_vector(3 downto 0));
end carry_select_adder;

architecture carry of carry_select_adder is

component addnbits is
generic(n: integer := 4);
port(a,b: in std_logic_vector(n-1 downto 0);
     s: out std_logic_vector(n-1 downto 0);
	  cin: in std_logic;
	  cout: out std_logic);
end component;

--component mux2 is
--port(a,b,c: in std_logic; s:out std_logic);
--end component;

signal carry: std_logic;
signal cout1,cout2: std_logic;
signal cin0,cin1: std_logic;
signal saidaf,s2,s3 : std_logic_vector(3 downto 0);

begin
cin0<= '0';
cin1<= '1';

adder : addnbits port map(a,b,s1,cin,carry);
adder1 : addnbits port map(c,d,s2,cin0,cout1);
adder2 : addnbits port map(c,d,s3,cin1,cout2);

coutfin <= cout1 when carry = '0' else cout2;

Sfinal<= s2 when carry = '0' else s3;
end carry;
