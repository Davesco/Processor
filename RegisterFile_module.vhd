library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
use IEEE.numeric_bit.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RegisterFile_module is
    Port ( clkFPGA : in STD_LOGIC;
			  reset : in STD_LOGIC; 
			  nRS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           nRS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           nRSD : in  STD_LOGIC_VECTOR (4 downto 0);
           DATATOREG : in  STD_LOGIC_VECTOR (31 downto 0);
           wren : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRSD : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile_module;

architecture Behavioral of RegisterFile_module is

type ram_type is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal registers : ram_type := (others => x"00000000");

begin

process(clkFPGA, reset, wren)

begin

	if(rising_edge(clkFPGA))then
		if(reset = '1')then
		CRS1 <= (others => '0');
		CRS2 <= (others => '0');
		CRSD <= (others => '0');
		else 
			CRS1 <= registers(conv_integer(nRS1));
			CRS2 <= registers(conv_integer(nRS2));
			CRSD <= registers(conv_integer(nRSD));
				if(wren = '1' and nRSD /= "00000")then
					registers(conv_integer(nRSD)) <= DATATOREG;  
				end if;
		end if;
	end if;

end process; 
end Behavioral;

