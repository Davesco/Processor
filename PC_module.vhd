library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC_module is
    Port ( nextInstruction : in  STD_LOGIC_VECTOR (4 downto 0);
           reset : in  STD_LOGIC;
           clkFPGA : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (4 downto 0));
end PC_module;

architecture Behavioral of PC_module is

begin

process(nextInstruction, reset, clkFPGA)

begin

if(reset = '1')then
	outInstruction <= (others => '0');
	else
		if(rising_edge(clkFPGA))then
		 outInstruction <= nextInstruction;
		end if;
end if;

end process;
end Behavioral;

