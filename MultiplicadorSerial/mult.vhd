--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity mult is
    port( clock, reset, start: in std_logic;
          A, B: in std_logic_vector(31 downto 0); -- Entradas de 32 BITS
          produto: out std_logic_vector(63 downto 0);
          end_mul: out std_logic
        );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture mult of mult is
  type states is (INIT, SUM, SHIFT, FIM); -- TAREFA: <COMPLETAR>
  --signal EA, PE : states; -- fazer sem o proximo estado, apenas com o atual (mais facil)
  signal EA : states;
  signal cont : std_logic_vector(4 downto 0); -- precisamos contar 32 - 5 bits
  signal regP : std_logic_vector(64 downto 0); -- regP: n*2 bits + 1
begin                           

  -- Processo para troca de estados
  process(reset, clock)
  begin
    if reset = '1' then
      EA <= INIT;
    elsif rising_edge(clock) then
      case EA is  
        when INIT =>
          if start = '1' then
            EA <= SUM;
          else
            EA <= INIT;
          end if;
        when SUM =>
            EA <= SHIFT;
        when SHIFT =>
            if cont = "0000" then
              EA <= FIM;
            else
              EA <= SUM;
            end if;
        when FIM =>
              EA <= INIT;
        when others =>
          EA <= INIT;
      end case;
    end if;
  end process;

  -- Bloco de dados conforme as laminas
  process (reset, clock)  
  begin
    if reset='1' then
      regP    <= (others=>'0');
      produto <= (others=>'0');
    elsif rising_edge(clock) then
      case EA is
        when INIT =>
          regP(64 downto 32) <= (others=>'0');
          regP(31 downto 0)  <= A;
          cont <= (others=>'0'); 
          end_mul <='0';

        when SUM =>
          cont <= cont-1;
          if regP(0)='1' then
            regP(64 downto 32) <= regP(64 downto 32) + ('0' & B);
          end if;

        when SHIFT =>
          if cont=0 then 
            end_mul <='1';
          end if;
          regP <= '0' & regP(64 downto 1);

        when FIM =>
          produto <= regP(63 downto 0);                 
      end case;
    end if;
  end process;

end architecture;