library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder_sai is
    Port ( 
				entrada : in  STD_LOGIC_VECTOR (1 downto 0); -- STD_LOGIC_VECTOR: STANDARD LOGIC VECTOR
				display : out  STD_LOGIC_VECTOR (6 downto 0));
end decoder_sai;

architecture example_sai of decoder_sai is

begin
	
	-- display receives "some date"
	-- Faz um processo semelhante ao mapa de Karnaugh
	display <= "0001000" when entrada = "00" else 
				  "1100000" when entrada = "01" else
				  "0110001" when entrada = "10" else
				  "1000010";

end example_sai;

