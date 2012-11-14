library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.numeric_bit.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
		when x"01" =>
			dataOut <= OP1 + OP2;
		when x"02" =>
			dataOut <= OP1 + OP2;
		when x"03"	=>
			dataOut <= OP1 + OP2 + Carry;
		when x"04"	=>
			dataOut <= OP1 - OP2;
		when x"05"	=>
			dataOut <= OP1 - OP2;
		when x"06"	=>
			dataOut <= OP1 - OP2 + Carry;	
		when others =>
			dataOut <= OP1;
	end case;	

end process;
end Behavioral;

