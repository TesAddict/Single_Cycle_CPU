library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
	port	(	INPUT_A	: in std_logic_vector(31 downto 0);
				INPUT_B	: in std_logic_Vector(31 downto 0);
				ALUop		: in std_logic_vector(3 downto 0);
				RESULT	: out std_logic_vector(31 downto 0);
				ZERO		: out std_logic := '0'
			);
end alu;

architecture arch of alu is 
signal out_tmp : std_logic_vector(31 downto 0);
begin
	ALU:process(INPUT_A, INPUT_B, ALUop) is
	begin
		case ALUop is
			when "0000" =>
				out_tmp <= INPUT_A and INPUT_B;
			when "0001" =>
				out_tmp <= INPUT_A or INPUT_B;
			when "0010" =>
				out_tmp <= INPUT_A xor INPUT_B;
			when "0011" =>
				out_tmp <= not INPUT_A;
			when "0100" =>
				out_tmp <= to_stdlogicvector(to_bitvector(INPUT_A) sll 1);
			when "0101" =>
				out_tmp <= to_stdlogicvector(to_bitvector(INPUT_A) srl 1);
			when "0110" =>
				out_tmp <= to_stdlogicvector(to_bitvector(INPUT_A) rol 1);
			when "0111" =>
				out_tmp <= to_stdlogicvector(to_bitvector(INPUT_A) ror 1);
			when "1000" =>
				out_tmp <= std_logic_vector(signed(INPUT_A) - signed(INPUT_B));
			when "1001" =>
				out_tmp <= std_logic_vector(signed(INPUT_A) + signed(INPUT_B));
			when "1010" =>
				out_tmp <= std_logic_Vector(signed(INPUT_A(15 downto 0)) * signed(INPUT_B(15 downto 0)));
			when "1011" =>
				out_tmp <= INPUT_B;
			when "1100" =>
				out_tmp <= INPUT_B;
			when "1101" =>
				if (to_integer(signed(INPUT_A) - signed(INPUT_B)) = 0) then
					ZERO <= '1';
				end if;
			when "1110" =>
				out_tmp <= INPUT_B;
			when others =>
				NULL;
		end case;
	end process;
	
RESULT <= out_tmp;
end arch;
			