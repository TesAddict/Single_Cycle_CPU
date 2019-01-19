library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instr_memory is
	port	(  CLK		:	in std_logic;
				RD_ADDR  :  in std_logic_vector(5 downto 0);
				INTR_OUT	:  out std_logic_vector(31 downto 0)
			);
end instr_memory;

architecture arch of instr_memory is
	type instructionFile is array(0 to 63) of std_logic_vector(31 downto 0);
	signal instruction : instructionFile;
begin
	instruction(0 to 7) <= ( 0 => "00111000000000000000000000000011", --Store 11 in register 0.
									 1 => "00111000000000010000000000000001", --Store 01 in register 1.
									 2 => "00100100000000010001000000000000", --Add registers 0 and 1, store in register 2.
									 3 => "00100100010000010000000000000000", --Add registers 2 and 1, store in register 0.
									 4 => "00110000000000100000000000000000", --Store register 2 in memory at address 0.
									 5 => "00101100000000000000000000000000", --Load memory at address 0 into register 0.
									 6 => "00100100000000100000100000000000", --Add register 0 and 2, store in register 1.
									 7 => "00101000001000100000000000000000"  --Multiply register 0 and 2, store in register 1.
									);
	instrFile:process(CLK) is
	begin
		if rising_edge(CLK) then
			INTR_OUT <= instruction(to_integer(unsigned(RD_ADDR)));
		end if;
	end process;
end arch;
