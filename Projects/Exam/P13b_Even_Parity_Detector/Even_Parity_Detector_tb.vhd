--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:35:05 09/20/2019
-- Design Name:   
-- Module Name:   D:/ProySisDigAva/P13b_Even_Parity_Detector/Even_Parity_Detector_tb.vhd
-- Project Name:  P13b_Even_Parity_Detector
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Even_Parity_Detector
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
 
ENTITY Even_Parity_Detector_tb IS
END Even_Parity_Detector_tb;
 
ARCHITECTURE behavior OF Even_Parity_Detector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Even_Parity_Detector
    PORT(
         Ent : IN  std_logic_vector(7 downto 0);
         Parity : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ent : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Parity : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Even_Parity_Detector PORT MAP (
          Ent => Ent,
          Parity => Parity
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		Ent <= "00000000"; wait for 100 ns;
		Ent <= "01101000"; wait for 100 ns;
		Ent <= "00011110"; wait for 100 ns;
		Ent <= "10110110"; wait for 100 ns;
		Ent <= "11110111"; wait for 100 ns;
		Ent <= "11111111"; wait for 100 ns;
		Ent <= "01111101"; wait for 100 ns;
		Ent <= "10000000"; wait for 100 ns;
		
      wait;
   end process;

END;
