library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU_module is
    Port ( OP  : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3  : in  STD_LOGIC_VECTOR (5 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
           Cond : in  STD_LOGIC_VECTOR (3 downto 0);
           wren : out  STD_LOGIC;
           PCsource : out  STD_LOGIC_VECTOR (1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (7 downto 0);
           RdEnMem : out  STD_LOGIC;
           WrEnMem : out  STD_LOGIC;
           RFsource : out  STD_LOGIC_VECTOR (1 downto 0);
           RFdest : out  STD_LOGIC;
           clkFPGA : in  STD_LOGIC);
end CU_module;

architecture Behavioral of CU_module is

begin

process(clkFPGA, icc, Cond)

begin

	if(rising_edge(clkFPGA))then 
		if(OP = "10")then
			case OP3 is
			
				when "000000" => ALUOP <= x"00"; --INICION ADDERs
				when "010000" => ALUOP <= x"01"; --ADDcc
				when "001000" => ALUOP <= x"02";	--ADDx
				when "011000" => ALUOP <= x"03"; -- FIN ADDERS
				
				when "000100" => ALUOP <= x"04"; --INICIO SUBs
				when "010100" => ALUOP <= x"05"; --SUBcc
				when "001100" => ALUOP <= x"06";	--SUBx
				when "011100" => ALUOP <= x"07"; --FIN SUBs
				
				when "000001" => ALUOP <= x"08"; --INICIO ANDs 
				when "010001" => ALUOP <= x"09"; --ANDcc
				when "000101" => ALUOP <= x"0A";	--ANDn
				when "010101" => ALUOP <= x"0B"; --FIN ANDs	
				
				when "000010" => ALUOP <= x"0C"; --INICIO ORs
				when "010010" => ALUOP <= x"0D"; --ORcc
				when "000110" => ALUOP <= x"0E";	--ORn
				when "010110" => ALUOP <= x"0F"; --FIN ORs
				
				when "000011" => ALUOP <= x"10"; --INICIO XORs
				when "010011" => ALUOP <= x"11"; --XORcc
				when "000111" => ALUOP <= x"12";	--NXOR
				when "010111" => ALUOP <= x"13"; --FIN XORs
				
				when "100101" => ALUOP <= x"14"; --SLL
				when "100110" => ALUOP <= x"15";	--SRL
				when "100111" => ALUOP <= x"16"; --SRA
					
				when others => ALUOP <= x"00";
			end case;
		else	
			if(OP = "11")then
				case OP3 is
					
					when "001001" => ALUOP <= x"17"; --LDSB
					when "001010" => ALUOP <= x"18"; --LDSH
					when "000001" => ALUOP <= x"19";	--LDUB
					when "000010" => ALUOP <= x"1A";	--LDUH
					when "000000" => ALUOP <= x"1B"; --LD
					when "000011" => ALUOP <= x"1C"; --LDD
					
					when "100000" => ALUOP <= x"1D"; --LDF
					when "100011" => ALUOP <= x"1E"; --LDDF
					when "100001" => ALUOP <= x"1F";	--LDFSR
					
					when "000101" => ALUOP <= x"20";	--STB
					when "000110" => ALUOP <= x"21";	--STH
					when "000100" => ALUOP <= x"22"; --ST
					when "000111" => ALUOP <= x"23"; --STD
					
					when "100100" => ALUOP <= x"24";	--STF
					when "100111" => ALUOP <= x"25";	--STDF
					when "100101" => ALUOP <= x"26"; --STFSR
					
					when "110100" => ALUOP <= x"27";	--STC
					when "110111" => ALUOP <= x"28";	--STDC
					when "110101" => ALUOP <= x"29"; --STCSR
					
					when others => ALUOP <= x"00";
				end case;
			else
					if(OP = "00")then
					end if;
			end if;		
		end if;
	end if;
	
					

end process;
end Behavioral;

