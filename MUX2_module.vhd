library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_module is
    Port ( CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEUin : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           OP2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX2_module;

architecture Behavioral of MUX2_module is

begin

process(CRS2, SEUin,i)

begin

if(i = '0')then
	OP2 <= CRS2;
else
		OP2 <= SEUin;
end if;		

end process;
end Behavioral;

