library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg_32 is
	port	(	RegWrite	: in std_logic; --Control Code
				CLK		: in std_logic;
				WD			: in std_logic_vector(31 downto 0); --Value Written to Register.
				R1_ADDR	: in std_logic_vector(4 downto 0); --Read Register 1.
				R2_ADDR	: in std_logic_vector(4 downto 0); --Read Register 2.
				WR_ADDR	: in std_logic_vector(4 downto 0); --Write Register.
				R1_DATA	: inout std_logic_vector(31 downto 0); --Read Data 1.
				R2_DATA	: inout std_logic_vector(31 downto 0) --Read Data 2.
			);
end reg_32;

architecture arch of reg_32 is
	type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
	signal registers : registerFile;
begin
	regFile:process(CLK) is
	begin
		if rising_edge(CLK) then
		-- Read A and B before bypass
		R1_DATA <= registers(to_integer(unsigned(R1_ADDR)));
		R2_DATA <= registers(to_integer(unsigned(R2_ADDR)));
		--Write and bypass
			if RegWrite = '1' then
				registers(to_integer(unsigned(WR_ADDR))) <= WD;
				if R1_ADDR = WR_ADDR then
					R1_DATA <= WD;
				end if;
				if R2_ADDR = WR_ADDR then
					R2_DATA <= WD;
				end if;
			end if;
		end if;
	end process;
end arch;