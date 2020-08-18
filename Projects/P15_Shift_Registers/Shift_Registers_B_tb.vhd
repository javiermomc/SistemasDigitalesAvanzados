--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:07 10/15/2019
-- Design Name:   
-- Module Name:   C:/SisDigAva/P17_Shift_Registers/Shift_Registers_B_tb.vhd
-- Project Name:  P17_Shift_Registers
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Shift_Registers
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
 
ENTITY Shift_Registers_B_tb IS
END Shift_Registers_B_tb;
 
ARCHITECTURE behavior OF Shift_Registers_B_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shift_Registers
    PORT(
         Clr : IN  std_logic;
         Clk : IN  std_logic;
         Load : IN  std_logic;
         Din : IN  std_logic_vector(7 downto 0);
         Sin : IN  std_logic;
         Sout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clr : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Load : std_logic := '0';
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Sin : std_logic := '0';

 	--Outputs
   signal Sout : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift_Registers PORT MAP (
          Clr => Clr,
          Clk => Clk,
          Load => Load,
          Din => Din,
          Sin => Sin,
          Sout => Sout
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

      

      -- insert stimulus here
		-- Check Clear
		Clr <= '1';
      wait for Clk_period;

      -- Parallel Load Shift Register with ASCII "A"
      Clr <= '0';
      Load <= '1';
      Din <= x"41";
		wait for Clk_period;

      -- Right Shift "A"
      Clr <= '0';
		Sin <= '0';
      Load <= '0';			

      wait;
   end process;

END;
