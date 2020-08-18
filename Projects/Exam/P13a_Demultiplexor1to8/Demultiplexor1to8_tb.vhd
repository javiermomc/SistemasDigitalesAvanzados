--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:31:50 09/20/2019
-- Design Name:   
-- Module Name:   D:/ProySisDigAva/P13a_Demultiplexor1to8/Demultiplexor1to8_tb.vhd
-- Project Name:  P13a_Demultiplexor1to8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Demultiplexor1to8
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
 
ENTITY Demultiplexor1to8_tb IS
END Demultiplexor1to8_tb;
 
ARCHITECTURE behavior OF Demultiplexor1to8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Demultiplexor1to8
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
   uut: Demultiplexor1to8 PORT MAP (
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here
      A <= '1';
      Sel <= "000"; wait for 100 ns;
		Sel <= "001"; wait for 100 ns;
		Sel <= "010"; wait for 100 ns;
		Sel <= "011"; wait for 100 ns;
		Sel <= "100"; wait for 100 ns;
		Sel <= "101"; wait for 100 ns;
		Sel <= "110"; wait for 100 ns;
		Sel <= "111"; wait for 100 ns;		

      wait;
   end process;

END;
