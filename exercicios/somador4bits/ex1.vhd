library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Entity
-- O que entra e o que sai do circuito
entity ex1 is
    port (
        reset: in std_logic; -- ambos tem apenas um bit
        clock: in std_logic;

        saida: out std_logic_vector(3 downto 0)
    );
end entity;

-- Architecture
architecture ex1 of ex1 is
    -- declarar os sinais inteirno do circuito antes de comecar a arquitetura
    signal R1, R2, sum: std_logic_vector(3 downto 0);
  
begin
    process(clock, reset)
    begin
        if (reset = '1') then
            R1 <= "0001";
            R2 <= "0000";
        -- se nao olha a borda do clock
        elsif (rising_edge(clock)) then 
            R1 <= sum;
            R2 <= R1;
        end if;
    end process;

    sum <= R2 + R1;
    saida <= sum;

end architecture;