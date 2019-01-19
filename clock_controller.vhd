library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_controller is
	Port	(
		CLK_50mhz	: in std_logic;
		sevenSegment: out std_logic_vector(55 downto 0)
		);
end clock_controller;

architecture arch of clock_controller is
signal count : integer :=1;
signal OUTPUT : std_logic_vector(31 downto 0);
signal CLK	: std_logic := '0';
signal MCLK : std_logic := '0';
begin
	UUT: entity work.cpu_controller port map(CLK => CLK, MCLK => MCLK, OUTPUT => OUTPUT, sevenSegment => sevenSegment);

 --clk generation.For 100 MHz clock this generates 1 Hz clock.
process(CLK_50mhz) 
begin
	if(CLK_50mhz'event and CLK_50mhz = '1') then
		count <= count+1;
		if(count = 12500000) then
			MCLK <= not MCLK;
		end if;
		if(count = 25000000) then
			MCLK <= not MCLK;
		end if;
		if(count = 30000000) then
			CLK <= not CLK;
		end if;
		if(count = 40000000) then
			CLK <= not CLK;
		end if;
		if(count = 45000000) then
			CLK <= not CLK;
		end if;
		if(count = 50000000) then
			CLK <= not CLK;
			count <= 1;
		end if;
	end if;
end process;
end arch;