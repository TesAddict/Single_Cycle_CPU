library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
 
entity binaryToHexDisp is
	port	(	binary	: in std_logic_vector(31 downto 0);
				sevenSegment: out std_logic_vector(55 downto 0)
			);
end binaryToHexDisp;

architecture arch of binaryToHexDisp is
begin
	process(binary)
	begin
		case binary(3 downto 0) is
			when "0000" => sevenSegment(6 downto 0) <= not "1111110"; -- 0
			when "0001" => sevenSegment(6 downto 0)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(6 downto 0) <= not "1101101"; -- 2
			when "0011" => sevenSegment(6 downto 0) <= not "1111001"; -- 3
			when "0100" => sevenSegment(6 downto 0) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(6 downto 0) <= not "1011011"; -- 5
			when "0110" => sevenSegment(6 downto 0) <= not "1011111"; -- 6
			when "0111" => sevenSegment(6 downto 0) <= not "1110000"; -- 7
			when "1000" => sevenSegment(6 downto 0) <= not "1111111"; -- 8
			when "1001" => sevenSegment(6 downto 0) <= not "1110011"; -- 9
			when "1010" => sevenSegment(6 downto 0) <= not "1110111"; -- a
			when "1011" => sevenSegment(6 downto 0) <= not "0011111"; -- b
			when "1100" => sevenSegment(6 downto 0) <= not "1001110"; -- c
			when "1101" => sevenSegment(6 downto 0) <= not "0111101"; -- d
			when "1110" => sevenSegment(6 downto 0) <= not "1001111"; -- e
			when "1111" => sevenSegment(6 downto 0) <= not "1000111"; -- f
			when others => sevenSegment(6 downto 0) <= not "0000000"; --
		end case;
		
		case binary(7 downto 4) is
			when "0000" => sevenSegment(13 downto 7) <= not "1111110"; -- 0
			when "0001" => sevenSegment(13 downto 7)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(13 downto 7) <= not "1101101"; -- 2
			when "0011" => sevenSegment(13 downto 7) <= not "1111001"; -- 3
			when "0100" => sevenSegment(13 downto 7) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(13 downto 7) <= not "1011011"; -- 5
			when "0110" => sevenSegment(13 downto 7) <= not "1011111"; -- 6
			when "0111" => sevenSegment(13 downto 7) <= not "1110000"; -- 7
			when "1000" => sevenSegment(13 downto 7) <= not "1111111"; -- 8
			when "1001" => sevenSegment(13 downto 7) <= not "1110011"; -- 9
			when "1010" => sevenSegment(13 downto 7) <= not "1110111"; -- a
			when "1011" => sevenSegment(13 downto 7) <= not "0011111"; -- b
			when "1100" => sevenSegment(13 downto 7) <= not "1001110"; -- c
			when "1101" => sevenSegment(13 downto 7) <= not "0111101"; -- d
			when "1110" => sevenSegment(13 downto 7) <= not "1001111"; -- e
			when "1111" => sevenSegment(13 downto 7) <= not "1000111"; -- f
			when others => sevenSegment(13 downto 7) <= not "0000000"; --
		end case;
		
		case binary(11 downto 8) is
			when "0000" => sevenSegment(20 downto 14) <= not "1111110"; -- 0
			when "0001" => sevenSegment(20 downto 14)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(20 downto 14) <= not "1101101"; -- 2
			when "0011" => sevenSegment(20 downto 14) <= not "1111001"; -- 3
			when "0100" => sevenSegment(20 downto 14) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(20 downto 14) <= not "1011011"; -- 5
			when "0110" => sevenSegment(20 downto 14) <= not "1011111"; -- 6
			when "0111" => sevenSegment(20 downto 14) <= not "1110000"; -- 7
			when "1000" => sevenSegment(20 downto 14) <= not "1111111"; -- 8
			when "1001" => sevenSegment(20 downto 14) <= not "1110011"; -- 9
			when "1010" => sevenSegment(20 downto 14) <= not "1110111"; -- a
			when "1011" => sevenSegment(20 downto 14) <= not "0011111"; -- b
			when "1100" => sevenSegment(20 downto 14) <= not "1001110"; -- c
			when "1101" => sevenSegment(20 downto 14) <= not "0111101"; -- d
			when "1110" => sevenSegment(20 downto 14) <= not "1001111"; -- e
			when "1111" => sevenSegment(20 downto 14) <= not "1000111"; -- f
			when others => sevenSegment(20 downto 14) <= not "0000000"; --
		end case;
		
		case binary(15 downto 12) is
			when "0000" => sevenSegment(27 downto 21) <= not "1111110"; -- 0
			when "0001" => sevenSegment(27 downto 21)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(27 downto 21) <= not "1101101"; -- 2
			when "0011" => sevenSegment(27 downto 21) <= not "1111001"; -- 3
			when "0100" => sevenSegment(27 downto 21) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(27 downto 21) <= not "1011011"; -- 5
			when "0110" => sevenSegment(27 downto 21) <= not "1011111"; -- 6
			when "0111" => sevenSegment(27 downto 21) <= not "1110000"; -- 7
			when "1000" => sevenSegment(27 downto 21) <= not "1111111"; -- 8
			when "1001" => sevenSegment(27 downto 21) <= not "1110011"; -- 9
			when "1010" => sevenSegment(27 downto 21) <= not "1110111"; -- a
			when "1011" => sevenSegment(27 downto 21) <= not "0011111"; -- b
			when "1100" => sevenSegment(27 downto 21) <= not "1001110"; -- c
			when "1101" => sevenSegment(27 downto 21) <= not "0111101"; -- d
			when "1110" => sevenSegment(27 downto 21) <= not"1001111"; -- e
			when "1111" => sevenSegment(27 downto 21) <= not "1000111"; -- f
			when others => sevenSegment(27 downto 21) <= not "0000000"; --
		end case;
		
		case binary(19 downto 16) is
			when "0000" => sevenSegment(34 downto 28) <= not "1111110"; -- 0
			when "0001" => sevenSegment(34 downto 28)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(34 downto 28) <= not "1101101"; -- 2
			when "0011" => sevenSegment(34 downto 28) <= not "1111001"; -- 3
			when "0100" => sevenSegment(34 downto 28) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(34 downto 28) <= not "1011011"; -- 5
			when "0110" => sevenSegment(34 downto 28) <= not "1011111"; -- 6
			when "0111" => sevenSegment(34 downto 28) <= not "1110000"; -- 7
			when "1000" => sevenSegment(34 downto 28) <= not "1111111"; -- 8
			when "1001" => sevenSegment(34 downto 28) <= not "1110011"; -- 9
			when "1010" => sevenSegment(34 downto 28) <= not "1110111"; -- a
			when "1011" => sevenSegment(34 downto 28) <= not "0011111"; -- b
			when "1100" => sevenSegment(34 downto 28) <= not "1001110"; -- c
			when "1101" => sevenSegment(34 downto 28) <= not "0111101"; -- d
			when "1110" => sevenSegment(34 downto 28) <= not "1001111"; -- e
			when "1111" => sevenSegment(34 downto 28) <= not "1000111"; -- f
			when others => sevenSegment(34 downto 28) <= not "0000000"; --
		end case;
		
		case binary(23 downto 20) is
			when "0000" => sevenSegment(41 downto 35) <= not "1111110"; -- 0
			when "0001" => sevenSegment(41 downto 35)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(41 downto 35) <= not "1101101"; -- 2
			when "0011" => sevenSegment(41 downto 35) <= not "1111001"; -- 3
			when "0100" => sevenSegment(41 downto 35) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(41 downto 35) <= not "1011011"; -- 5
			when "0110" => sevenSegment(41 downto 35) <= not "1011111"; -- 6
			when "0111" => sevenSegment(41 downto 35) <= not "1110000"; -- 7
			when "1000" => sevenSegment(41 downto 35) <= not "1111111"; -- 8
			when "1001" => sevenSegment(41 downto 35) <= not "1110011"; -- 9
			when "1010" => sevenSegment(41 downto 35) <= not "1110111"; -- a
			when "1011" => sevenSegment(41 downto 35) <= not "0011111"; -- b
			when "1100" => sevenSegment(41 downto 35) <= not "1001110"; -- c
			when "1101" => sevenSegment(41 downto 35) <= not "0111101"; -- d
			when "1110" => sevenSegment(41 downto 35) <= not "1001111"; -- e
			when "1111" => sevenSegment(41 downto 35) <= not "1000111"; -- f
			when others => sevenSegment(41 downto 35) <= not "0000000"; --
		end case;
		
		case binary(27 downto 24) is
			when "0000" => sevenSegment(48 downto 42) <= not "1111110"; -- 0
			when "0001" => sevenSegment(48 downto 42)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(48 downto 42) <= not "1101101"; -- 2
			when "0011" => sevenSegment(48 downto 42) <= not "1111001"; -- 3
			when "0100" => sevenSegment(48 downto 42) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(48 downto 42) <= not "1011011"; -- 5
			when "0110" => sevenSegment(48 downto 42) <= not "1011111"; -- 6
			when "0111" => sevenSegment(48 downto 42) <= not "1110000"; -- 7
			when "1000" => sevenSegment(48 downto 42) <= not "1111111"; -- 8
			when "1001" => sevenSegment(48 downto 42) <= not "1110011"; -- 9
			when "1010" => sevenSegment(48 downto 42) <= not "1110111"; -- a
			when "1011" => sevenSegment(48 downto 42) <= not "0011111"; -- b
			when "1100" => sevenSegment(48 downto 42) <= not "1001110"; -- c
			when "1101" => sevenSegment(48 downto 42) <= not "0111101"; -- d
			when "1110" => sevenSegment(48 downto 42) <= not "1001111"; -- e
			when "1111" => sevenSegment(48 downto 42) <= not "1000111"; -- f
			when others => sevenSegment(48 downto 42) <= not "0000000"; --
		end case;
		
		case binary(31 downto 28) is
			when "0000" => sevenSegment(55 downto 49) <= not "1111110"; -- 0
			when "0001" => sevenSegment(55 downto 49)  <= not "0110000"; -- 1
			when "0010" => sevenSegment(55 downto 49) <= not "1101101"; -- 2
			when "0011" => sevenSegment(55 downto 49) <= not "1111001"; -- 3
			when "0100" => sevenSegment(55 downto 49) <= not "0110011"; -- 4                
			when "0101" => sevenSegment(55 downto 49) <= not "1011011"; -- 5
			when "0110" => sevenSegment(55 downto 49) <= not "1011111"; -- 6
			when "0111" => sevenSegment(55 downto 49) <= not "1110000"; -- 7
			when "1000" => sevenSegment(55 downto 49) <= not "1111111"; -- 8
			when "1001" => sevenSegment(55 downto 49) <= not "1110011"; -- 9
			when "1010" => sevenSegment(55 downto 49) <= not "1110111"; -- a
			when "1011" => sevenSegment(55 downto 49) <= not "0011111"; -- b
			when "1100" => sevenSegment(55 downto 49) <= not "1001110"; -- c
			when "1101" => sevenSegment(55 downto 49) <= not "0111101"; -- d
			when "1110" => sevenSegment(55 downto 49) <= not "1001111"; -- e
			when "1111" => sevenSegment(55 downto 49) <= not "1000111"; -- f
			when others => sevenSegment(55 downto 49) <= not "0000000"; --
		end case;
	end process;
end arch;