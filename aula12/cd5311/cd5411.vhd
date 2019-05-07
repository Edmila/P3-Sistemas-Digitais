	--IFPB
	--Data:30.04.19
	--Aula12 - latch cd4511
	--"https://www.tinkercad.com/things/4hDEPx4HFS2-display-7-seg-multiplex/editel?sharecode=47HKcXm0Zu3HG1M5HAQ8z3B1kQX5Zm6FuEZ-f_5qAhA=" circuito equivalente
	library ieee;
	use ieee.std_logic_1164.all;

	entity cd4511 is
	port(abcd : std_logic_vector(3 downto 0);
			n_LE,n_BL,n_LT: in std_logic;
			disp: out std_logic_vector(6 downto 0)); --vai ser conectado no display de 7 segmentos
	end cd4511;

	architecture cd4511 of cd4511 is
	signal latches: std_logic_vector(3 downto 0):="0000";
	signal decoder: std_logic_vector(6 downto 0);
	signal driver: std_logic_vector(6 downto 0);
	signal mode: std_logic := '0'; --0 -> catodo comum
											 --1 -> anodo comum

	begin
	latches <= abcd when n_LE = '0' else
					latches;
			--abcdefg
			
	decoder <= "0000000" when n_BL = '0' else
				"1111110" when latches = "0000" else -- 0
				"0110000" when latches = "0001" else -- 1
				"1101101" when latches = "0010" else -- 2
				"1111001" when latches = "0011" else -- 3
				"0110011" when latches = "0100" else -- 4
				"1011011" when latches = "0101" else -- 5
				"1011111" when latches = "0110" else -- 6
				"1110000" when latches = "0111" else -- 7
				"1111111" when latches = "1000" else -- 8
				"1111011" when latches = "1001" else -- 9
				"0000000";
			
	driver <= 	"1111111" when n_LT ='0' else
				decoder;
					
	laco : for i in 0 to 6 generate
			disp(i) <= driver(i) xor mode;	
	end generate;

	end cd4511;

