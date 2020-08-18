--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:24:46 10/29/2019
-- Design Name:   
-- Module Name:   C:/Xilinx/AdvancedDigitalSystems_Projects/P19a_UniversalAsynchronousReceiver/UAR_TB.vhd
-- Project Name:  P19a_UniversalAsynchronousReceiver
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UAR
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY UAR_TB IS
END UAR_TB;
 
ARCHITECTURE behavior OF UAR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UAR
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Din : IN  std_logic;
         Anode : OUT  std_logic_vector(3 downto 0);
         Seg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Din : std_logic := '0';

 	--Outputs
   signal Anode : std_logic_vector(3 downto 0);
   signal Seg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UAR PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Din => Din,
          Anode => Anode,
          Seg => Seg
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
