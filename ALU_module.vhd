library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_module is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (7 downto 0);
           Carry : in  STD_LOGIC;
           OP1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR(31 downto 0));
end ALU_module;

architecture Behavioral of ALU_module is

begin

process(ALUOP)

begin

	case ALUOP is
		when "0000000" =>
			dataOut <= OP1 + OP2;
		when "0000001" =>
			dataOut <= OP1 + OP2;
		when "0000010"	=>
			dataOut <= OP1 + OP2 + Carry;
		when "0000011"	=>
			dataOut <= OP1 - OP2;
		when "0000100"	=>
			dataOut <= OP1 - OP2;
		when "0000101"	=>
			dataOut <= OP1 - OP2 + Carry;	
		when others =>
			dataOut <= OP1;
	end case;	

end process;
end Behavioral;

