library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbitMux is 
	generic ( n: integer := 32);
	port	(	INPUT_1 : in std_logic_vector(n-1 downto 0);
				INPUT_2 : in std_logic_vector(n-1 downto 0);
				SEL	  : in std_logic;
				OUTPUT  : out std_logic_vector(n-1 downto 0)
			);
end nbitMux;

architecture arch of nbitMux is
begin
	selector:process(INPUT_1, INPUT_2, SEL) is
	begin
		if (SEL = '0') then
			OUTPUT <= INPUT_1;
		end if;
		if (SEL = '1') then
			OUTPUT <= INPUT_2;
		end if;
	end process;
end arch;