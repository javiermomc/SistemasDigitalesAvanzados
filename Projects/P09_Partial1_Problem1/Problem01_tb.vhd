--------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer:Javier Mondragon Martin del Campo
-- ID: A01365137
-- Create Date:   10:48:22 09/18/2019
-- Design Name:   Demux 1 to 8
-- Module Name:   D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Projects/P09_Partial1_Problem1/Problem01_tb.vhd
-- Project Name:  P09_Partial1_Problem1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Problem1
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
 
ENTITY Problem01_tb IS
END Problem01_tb;
 
ARCHITECTURE behavior OF Problem01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Problem1
    PORT(
         A : IN  std_logic;
         Sel : IN  std_logic_vector(2 downto 0);
         F : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Problem1 PORT MAP (
          A => A,
          Sel => Sel,
          F => F
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
		A <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;
      -- insert stimulus here 
		Sel <= "000";
		wait for 100 ns;
		Sel <= "001";
		wait for 100 ns;
		Sel <= "010";
		wait for 100 ns;
		Sel <= "011";
		wait for 100 ns;
		Sel <= "100";
		wait for 100 ns;
		Sel <= "101";
		wait for 100 ns;
		Sel <= "110";
		wait for 100 ns;
		Sel <= "111";
      wait;
   end process;

END;
