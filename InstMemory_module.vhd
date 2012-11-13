
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
use IEEE.numeric_bit.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstMemory_module is
    Port ( clkFPGA : in STD_LOGIC;
		     reset : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (4 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end InstMemory_module;

architecture Behavioral of InstMemory_module is

type rom_type is array (0 to 14) of STD_LOGIC_VECTOR (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return rom_type is

FILE RomFile : text open read_mode is RomFileName;

variable RomFileLine : line; 
variable temp_bv : BIT_VECTOR (31 downto 0);
variable temp_mem : rom_type;

begin

	for i in rom_type'range loop 

	readline(RomFile, RomFileLine);
	read(RomFileLine, temp_bv);
	temp_mem(i) := to_stdlogicvector(temp_bv);

	end loop;

return temp_mem;
end function;

signal instruction : rom_type := InitRomFromFile("program2.data");

begin 

process(clkFPGA, reset, address)

begin

	if(rising_edge(clkFPGA))then
		if(reset = '1')then 
			dataOut <= (others => '0');
			else
			dataOut <= instruction(conv_integer(address));
		end if;
	end if;

end process;
end Behavioral;

