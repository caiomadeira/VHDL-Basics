library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ex3 is
    port (CLK, DS: in std_logic;
        MS_SELECTOR: in std_logic_vector(1 downto 0);
        X, Y, Z: in std_logic_vector(7 downto 0);
        RA, RB: out std_logic_vector(7 downto 0); -- sao registradores
        );
end entity;

architecture ex3 of ex3 is

    signal OMUX, R1, R2: std_logic_vector(7 downto 0);
    signal L1, L2: std_logic;

begin 
    process(MS_SELECTOR, X, Y, Z)

    -- o mux recebe x quando o MS for 3
    omux <= x when  MS_SELECTOR = "11" else
    omux <= y when MS_SELECTOR = "10" else
    omux <= z when MS_SELECTOR = "01" else R2;

    L1 <= '1' when DS = '0' else '0';
    L2 <= '1' when DS = '1' else '0'; -- not l1;

    process(CLK)

    begin
        if(falling_edge(clk)) then
            if (L1 = '1') then
                R1 <= omux;
            end if;

            if (L2 = '1') then
                R2 <= R1;
            end if;
        end if;
    end process;

    RA <= R1;
    RB <= R2;
end architecture