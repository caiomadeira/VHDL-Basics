library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
entity regis1 is 
    generic(N: integer := 16);
    port(clock, reset, ce: in std_logic; 
        A: in std_logic_vector(N-1 downto 0);
        B: in std_logic_vector(N-1 downto 0); 
        C: in std_logic_vector(N-1 downto 0);

        Y: out std_logic_vector(N-1 downto 0));
end entity

-- Architecture
architecture 
