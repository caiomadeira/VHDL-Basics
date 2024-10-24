library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Entity
entity ex2 is 
    port (fin: in std_logic; fout: out std_logic);
end entity;

-- architecture
architecture ex2 of ex2 is
    -- Damos um valor inicial, pois nao tem RESET.
    -- Sem reset ele comeca com qualquer valor, nao garantimos qual.
    signal QA, QB, QC: std_logic := '0';

begin 
    process(fin)
    begin
        if (rising_edge(fin)) then
            QA <= NOT QA;
        end if;
    end process;

    process(fin)
    begin
        if (rising_edge(QA)) then
            QB <= NOT QB;
        end if;
    end process;

    process(fin)
    begin
        if (rising_edge(QB)) then
            QC <= NOT QC;
        end if;
    end process;


    fout <= QC;

end architecture;