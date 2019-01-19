library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is
	port	(	CLK			:  in std_logic;
				MemWrite		:  in std_logic;
				MemRead		:  in std_logic;
				READ_ADDR	:	in std_logic_vector(4 downto 0);
				WRT_ADDR		:  in std_logic_vector(4 downto 0);
				WRT_DATA		:  in std_logic_vector(31 downto 0);
				READ_DATA	:  out std_logic_vector(31 downto 0)
			);
end data_memory;

architecture arch of data_memory is
	type memoryFile is array(0 to 31) of std_logic_vector(31 downto 0);
	signal memory_seg	: memoryFile;
begin
	memFile:process(CLK) is
	begin
		if rising_edge(CLK) then	
			if MemWrite = '1' then
				memory_seg(to_integer(unsigned(WRT_ADDR))) <= WRT_DATA;
			end if;
			if MemRead = '1' then
				READ_DATA <= memory_seg(to_integer(unsigned(READ_ADDR)));
			end if;
		end if;
	end process;
end arch;
				