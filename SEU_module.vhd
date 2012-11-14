----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:34 11/14/2012 
-- Design Name: 
-- Module Name:    SEU_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU_module is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           seuOut : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_module;

architecture Behavioral of SEU_module is

begin
seuOut(12 downto 0) <= simm13;

process(simm13) begin
	if(simm13(12)='0') then
		seuOut(31 downto 13) <= (others => '0');
	else
		seuOut(31 downto 13) <= (others=>'1');
	
	end if;
end process;
end Behavioral;

