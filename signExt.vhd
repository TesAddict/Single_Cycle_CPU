library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signExt is
	port	(	INPUT_EXT	: in std_logic_vector(15 downto 0);
				OUTPUT_EXT	: out std_logic_vector(31 downto 0)
			);
end signExt;

architecture arch of signExt is

begin
	ext:process(INPUT_EXT) is
	begin
		if (INPUT_EXT(15) = '0') then
			OUTPUT_EXT <= "0000000000000000" & INPUT_EXT;
		end if;
		if (INPUT_EXT(15) = '1') then
			OUTPUT_EXT <= "1111111111111111" & INPUT_EXT;
		end if;
	end process;
end arch;