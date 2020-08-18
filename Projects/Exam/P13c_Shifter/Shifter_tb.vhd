--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:10:45 09/20/2019
-- Design Name:   
-- Module Name:   D:/ProySisDigAva/P13c_Shifter/Shifter_tb.vhd
-- Project Name:  P13c_Shifter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Shifter
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
 
ENTITY Shifter_tb IS
END Shifter_tb;
 
ARCHITECTURE behavior OF Shifter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shifter
    PORT(
         --Ent : IN  std_logic_vector(7 downto 0);
			Ent : IN  bit_vector(7 downto 0);
         Sel : IN  std_logic_vector(2 downto 0);
         --Sal : OUT  std_logic_vector(7 downto 0)
			Sal : OUT  bit_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   --signal Ent : std_logic_vector(7 downto 0) := (others => '0');
	signal Ent : bit_vector(7 downto 0) := (others => '0');
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   -- signal Sal : std_logic_vector(7 downto 0);
	signal Sal : bit_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shifter PORT MAP (
          Ent => Ent,
          Sel => Sel,
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

--      wait for <clock>_period*10;

      -- insert stimulus here 
		Sel <= "000"; Ent <= "01001001"; wait for 100 ns;
		Sel <= "001"; Ent <= "10110100"; wait for 100 ns;
		Sel <= "010"; Ent <= "11001100"; wait for 100 ns;
		Sel <= "011"; Ent <= "00111100"; wait for 100 ns;
		Sel <= "100"; Ent <= "11011011"; wait for 100 ns;
		Sel <= "101"; Ent <= "01000010"; wait for 100 ns;
		Sel <= "110"; Ent <= "10101010"; wait for 100 ns;
		Sel <= "111"; Ent <= "01101011"; wait for 100 ns;

      wait;
   end process;

END;
