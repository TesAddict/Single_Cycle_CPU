library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
	port	(
				PCSrc		: in std_logic;
				CLK		: in std_logic;
				SignExt	: in std_logic_vector(31 downto 0);
				PCOutput	: inout std_logic_vector(5 downto 0) := "000000"
			);
end program_counter;

architecture arch of program_counter is
signal Increment : std_logic_vector(5 downto 0) := "000001";

begin
	pc:process(CLK) is
	begin
		if rising_edge(CLK) then
			if (PCSrc = '0') then
				PCOutput <= std_logic_vector(unsigned(Increment) + unsigned(PCOutput));
			end if;
			if (PCSrc = '1') then
				if (SignExt(31) = '0') then
					PCOutput <= std_logic_vector(unsigned(PCOutput) + unsigned(SignExt(5 downto 0)));
				end if;
				if (SignExt(31) = '1') then
					PCOutput <= std_logic_vector(unsigned(PCOutput) - to_unsigned(to_integer(signed(SignExt)), 6));
				end if;
			end if;
		end if;
	end process;
end arch;