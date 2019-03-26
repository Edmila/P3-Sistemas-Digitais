entity testbench is
end testbench;

architecture test of testbench is
 
component parity is
port (a: in bit_vector(3 downto 0);
		p: out bit);
end component;

signal input: bit_vector(3 downto 0);
signal output: bit;

begin

x: parity port map(input, output);

input <= "0000",
			"0001" after 10 ns,
			"1011" after 20 ns,
			"0010" after 30 ns,
			"1110" after 40 ns,
			"1111" after 50 ns;
			
 end test;