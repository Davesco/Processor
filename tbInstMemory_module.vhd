LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tbInstMemory_module IS
END tbInstMemory_module;
 
ARCHITECTURE behavior OF tbInstMemory_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstMemory_module
    PORT(
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         address : IN  std_logic_vector(4 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clkFPGA : std_logic := '0';
   signal reset : std_logic := '0';
   signal address : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkFPGA_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstMemory_module PORT MAP (
          clkFPGA => clkFPGA,
          reset => reset,
          address => address,
          dataOut => dataOut
        );

   -- Clock process definitions
   clkFPGA_process :process
   begin
		clkFPGA <= '0';
		wait for clkFPGA_period/2;
		clkFPGA <= '1';
		wait for clkFPGA_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
		address <= "00000";
     
	   wait for 100 ns;	
		reset <= '0';
		address <= "11100";
      wait for clkFPGA_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
