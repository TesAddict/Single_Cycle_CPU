library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_controller is
	port	(	CLK				: in std_logic;
				MCLK				: in std_logic;
				sevenSegment   : out std_logic_vector(55 downto 0);
				OUTPUT			: inout std_logic_vector(31 downto 0)
			);
end cpu_controller;

architecture arch of cpu_controller is
signal PCOutput: std_logic_vector(5 downto 0);
signal INSTR	: std_logic_vector(31 downto 0);
signal WD		: std_logic_vector(31 downto 0);
signal WR_ADDR : std_logic_vector(4 downto 0);
signal R1_DATA : std_logic_vector(31 downto 0);
signal R2_DATA : std_logic_vector(31 downto 0);
signal R2_ACT	: std_logic_vector(31 downto 0);
signal ALU_O	: std_logic_vector(31 downto 0);
signal EXT_O	: std_logic_vector(31 downto 0);
signal MEM_RD	: std_logic_vector(31 downto 0);
signal RegWrite: std_logic;
signal PCSrc	: std_logic := '0';
signal RegDst	: std_logic;
signal ALUSrc	: std_logic;
signal ZERO		: std_logic;
signal MemWrite: std_logic;
signal MemRead : std_logic;
signal MemToReg: std_logic;
signal R1_ADDR : std_logic_vector(4 downto 0);
signal R2_ADDR : std_logic_vector(4 downto 0);
signal ALUop	: std_logic_vector(3 downto 0);

begin
R1_ADDR <= INSTR(25 downto 21);
R2_ADDR <= INSTR(20 downto 16);
ALUop <= INSTR(29 downto 26);
MUX1: entity work.nbitMux generic map (5) port map(INPUT_1 => INSTR(20 downto 16), INPUT_2 => INSTR(15 downto 11), OUTPUT => WR_ADDR, SEL => RegDst);

MUX2: entity work.nbitMux generic map (32) port map(INPUT_1 => R2_DATA, INPUT_2 => EXT_O, SEL => ALUSrc, OUTPUT => R2_ACT);

MUX3: entity work.nbitMux generic map (32) port map(INPUT_1 => MEM_RD, INPUT_2 => ALU_O, SEL => MemToReg, OUTPUT => WD);   

PC_COUNTER: entity work.program_counter port map(PCSrc => PCSrc, CLK => MCLK, SignExt => EXT_O, PCOutput => PCOutput);

INSTR_MEMORY: entity work.instr_memory port map(CLK => MCLK, RD_ADDR => PCOutput, INTR_OUT => INSTR);

REGISTER_MEMORY: entity work.reg_32 port map(RegWrite => RegWrite, CLK => CLK, WD => WD, R1_ADDR => R1_ADDR, 
					R2_ADDR => R2_ADDR, WR_ADDR => WR_ADDR, R1_DATA => R1_DATA, R2_DATA => R2_DATA);

EXTND: entity work.signExt port map(INPUT_EXT => INSTR(15 downto 0), OUTPUT_EXT => EXT_O); 					
					
ALU: entity work.alu port map(INPUT_A => R1_DATA, INPUT_B => R2_ACT, ALUop => ALUop, RESULT => ALU_O, ZERO => ZERO);

DATA_MEM: entity work.data_memory port map(CLK => CLK, MemWrite => MemWrite, MemRead => MemRead, 
					READ_ADDR => ALU_O(4 downto 0), WRT_ADDR => ALU_O(4 downto 0), WRT_DATA => R2_DATA, READ_DATA => MEM_RD);

SVN_SEG: entity work.binaryToHexDisp port map(binary => OUTPUT, sevenSegment => sevenSegment);

		
	cpu:process(MCLK, INSTR, ZERO) is
	begin
			case INSTR(29 downto 26) is
				when "0000" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0001" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0010" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0011" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0100" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0101" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0110" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "0111" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "1000" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "1001" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "1010" =>
				RegDst <= '1';
				RegWrite <= '1';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when "1011" =>
				RegDst <= '0';
				RegWrite <= '1';
				ALUSrc <= '1';
				MemWrite <= '0';
				MemRead <= '1';
				MemToReg <= '0';
			when "1100" =>
				RegDst <= '0';
				RegWrite <= '0';
				ALUSrc <= '1';
				MemWrite <= '1';
				MemRead <= '0';
				MemToReg <= '1';	
			when "1101" =>
				RegDst <= '0';
				RegWrite <= '0';
				ALUSrc <= '0';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
				if (ZERO = '1') then
					PCSrc <= '0';
				end if;
				if (ZERO = '0') then
					PCSrc <= '1';
				end if;
			when "1110" =>
				RegDst <= '0';
				RegWrite <= '1';
				ALUSrc <= '1';
				MemWrite <= '0';
				MemRead <= '0';
				MemToReg <= '1';
			when others =>
				NULL;
		end case;
	end process;
	OUTPUT <= ALU_O;
end arch;
		