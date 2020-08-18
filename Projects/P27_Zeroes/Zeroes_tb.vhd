--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:18:03 12/02/2019
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P27_Zeroes/Zeroes_tb.vhd
-- Project Name:  P27_Zeroes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Zeroes
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
 
ENTITY Zeroes_tb IS
END Zeroes_tb;
 
ARCHITECTURE behavior OF Zeroes_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Zeroes
    PORT(
         data : IN  std_logic_vector(7 downto 0);
         zeroes : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal zeroes : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Zeroes PORT MAP (
          data => data,
          zeroes => zeroes
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     

      -- insert stimulus here 

      wait;
   end process;

END;
