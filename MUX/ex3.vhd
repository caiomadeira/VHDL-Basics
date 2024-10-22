--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
-- Import unsigned

--------------------------------------
-- Entidade
--------------------------------------
entity ex3 is
  port( B : IN std_logic_vector(7 downto 0);
        D : IN std_logic_vector(3 downto 0);
        BB : OUT std_logic_vector(7 downto 0)
      );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture ex3 of ex3 is
  -- Sinais internos sao declarados antes de começar o código
  signal SD : STD_LOGIC_VECTOR(1 DOWNTO 0);
begin

  -- SD eh a saida de alta prioridade
  sd <= "11" when D(3) = '1' else
        "10" when D(2) = '1' else
        "01" when D(1) = '1' else
        "00"; -- when D(0) = '1';
	
  -- parte baixa do B sao os bits menos significativos
  BB <= B(3 downto 0) & B(7 DOWNTO 4) when sd = "00" else
        "1111" & B(3 DOWNTO 0)          when sd = "01" else
        '0' & B(7 DOWNTO 1)             when sd = "10" else
        B(6 DOWNTO 0) & '0'             when sd = "11";
	
end architecture;