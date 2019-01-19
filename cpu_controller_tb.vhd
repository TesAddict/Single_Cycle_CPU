library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_controller_tb is
end cpu_controller_tb;

architecture behavioral of cpu_controller_tb is

signal CLK	: std_logic;
signal MLK  : std_logic;
signal sevenSegment: std_logic_vector(55 downto 0);
signal OUTPUT	: std_logic_vector(31 downto 0);
begin
	UUT: entity work.cpu_controller port map(CLK => CLK, MCLK => MLK, sevenSegment => sevenSegment, OUTPUT => OUTPUT);
	process
	begin
		CLK <= '0';
		MLK <= '0';
		wait for 100 ps;
		
		for i in 0 to 6 loop
			MLK <= '1';
			wait for 100 ps;
			MLK <= '0';
			wait for 100 ps;
			CLK <= '1';
			wait for 100 ps;
			CLK <= '0';
			wait for 100 ps;
			CLK <= '1';
			wait for 100 ps;
			CLK <= '0';
			wait for 100 ps;
		end loop;
		wait;
	end process;
end architecture behavioral; 
		