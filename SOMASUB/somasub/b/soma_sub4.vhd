--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity soma_sub4 is
	port (A, B: in STD_LOGIC_VECTOR(3 downto 0);
		M: in STD_LOGIC;
		COUT, OV: out STD_LOGIC;
		S: out STD_LOGIC_VECTOR(3 downto 0);
	);
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture soma_sub4 of soma_sub4 is
	signal MIDDLE_CARRY: in STD_LOGIC_VECTOR(4 downto 0);
begin

    fulladder1: entity.work.soma_sub

end architecture;