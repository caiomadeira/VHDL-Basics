--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Entidade
--------------------------------------
entity soma_sub is
	port (A, B, Cin, m: in std_logic;
		Cout, Soma: out std_logic);
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture soma_sub of soma_sub is
	signal BB: STD_LOGIC;
begin
	BB <= B xor m;
	Cout <= (A and BB) or (A and Cin) or (BB and Cin);
	Soma <= A xor BB xor Cin;
	
end architecture;