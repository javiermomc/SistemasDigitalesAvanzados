--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:22:24 12/02/2019
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic19/SistemasDigitalesAvanzados/Projects/P27_NonSignificativeZeroesCount/NonSignificativeZeroesCount_tb.vhd
-- Project Name:  P27_NonSignificativeZeroesCount
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NonSignificativeZeroesCount
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NonSignificativeZeroesCount_tb IS
END NonSignificativeZeroesCount_tb;
 
ARCHITECTURE behavior OF NonSignificativeZeroesCount_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NonSignificativeZeroesCount
    PORT(
         data : IN  std_logic_vector(7 downto 0);
         zeroes : OUT  INTEGER RANGE 0 to 8
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal zeroes : INTEGER RANGE 0 to 8;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NonSignificativeZeroesCount PORT MAP (
          data => data,
          zeroes => zeroes
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      data<="00001111";
		wait for 100 ns;	
      data<="10001001";
		wait for 100 ns;	
      data<="00110011";
		wait for 100 ns;	
      data<="00000000";
		wait for 100 ns;	
      data<="00000110";
		wait for 100 ns;	
      data<="00000001";

      -- insert stimulus here 

      wait;
   end process;

END;
