--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:09 09/04/2019
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P05_Priority_Encoder/Priority_Encoder_tb.vhd
-- Project Name:  P05_Priority_Encoder
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
         INPUT : IN  std_logic_vector(7 downto 1);
         OUTPUT : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic_vector(7 downto 1) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Priority_Encoder PORT MAP (
          INPUT => INPUT,
          OUTPUT => OUTPUT
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
		INPUT <= "0100110";
		wait for 100 ns;
		INPUT <= "0000000";
		wait for 100 ns;
		INPUT <= "0011100";
		wait for 100 ns;
		INPUT <= "1111111";
		
		
      wait;
   end process;

END;
