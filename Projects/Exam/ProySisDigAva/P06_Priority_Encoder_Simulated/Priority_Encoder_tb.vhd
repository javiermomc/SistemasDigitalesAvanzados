--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:52:13 09/04/2019
-- Design Name:   
-- Module Name:   D:/ProySisDigAva/P06_Priority_Encoder_Simulated/Priority_Encoder_tb.vhd
-- Project Name:  P06_Priority_Encoder_Simulated
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Priority_Encoder
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
 
ENTITY Priority_Encoder_tb IS
END Priority_Encoder_tb;
 
ARCHITECTURE behavior OF Priority_Encoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Priority_Encoder
    PORT(
         Ent : IN  std_logic_vector(7 downto 1);
         Sal : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ent : std_logic_vector(7 downto 1) := (others => '0');

 	--Outputs
   signal Sal : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Priority_Encoder PORT MAP (
          Ent => Ent,
          Sal => Sal
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

      -- wait for <clock>_period*10;

      -- insert stimulus here 
		Ent <= "0100110"; -- Case 1
		wait for 100 ns;  -- Give simulator time to process
		Ent <= "0000000"; -- Case 2
		wait for 100 ns;  -- Give simulator time to process
		Ent <= "0011100"; -- Case 3
		wait for 100 ns;  -- Give simulator time to process
		Ent <= "1111111"; -- Case 4
		wait for 100 ns;  -- Give simulator time to process

      wait;
   end process;

END;
