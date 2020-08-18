--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:08:20 09/11/2019
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/Escuela/AgoDic19/SistemasDigitalesAvanzados/Proyects/P06_Operators/Operators_tb.vhd
-- Project Name:  P06_Operators
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Operators
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
 
ENTITY Operators_tb IS
END Operators_tb;
 
ARCHITECTURE behavior OF Operators_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Operators
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic;
         NOUT : OUT  std_logic_vector(2 downto 0);
         SUM : OUT  std_logic_vector(7 downto 0);
         CIN : INOUT  std_logic_vector(7 downto 0);
         COUT : INOUT  std_logic_vector(7 downto 0);
         SELECTOR : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL : std_logic := '0';
   signal SELECTOR : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal CIN : std_logic_vector(7 downto 0);
   signal COUT : std_logic_vector(7 downto 0);

 	--Outputs
   signal NOUT : std_logic_vector(2 downto 0);
   signal SUM : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Operators PORT MAP (
          A => A,
          B => B,
          SEL => SEL,
          NOUT => NOUT,
          SUM => SUM,
          CIN => CIN,
          COUT => COUT,
          SELECTOR => SELECTOR
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
--
--      wait for <clock>_period*10;

      -- insert stimulus here 
		wait for 100 ns;	
		SELECTOR <= "00";
		SEL <= '0';
		A <= "10010001";
		B <= "00010001";
		wait for 100 ns;	
		SELECTOR <= "00";
		SEL <= '1';
		A <= "10010001";
		B <= "00010001";
		wait for 100 ns;	
		SELECTOR <= "00";
		SEL <= '1';
		A <= "10010001";
		B <= "10010001";
		wait for 100 ns;	
		SELECTOR <= "01";
		SEL <= '0';
		A <= "00000001";
		B <= "00000000";
		wait for 100 ns;	
		SELECTOR <= "01";
		SEL <= '0';
		A <= "10100100";
		B <= "00000000";
		wait for 100 ns;	
		SELECTOR <= "10";
		SEL <= '0';
		A <= "00001000";
		B <= "00000001";
		wait for 100 ns;	
		SELECTOR <= "10";
		SEL <= '0';
		A <= "00001101";
		B <= "00001001";
		wait for 100 ns;	
		SELECTOR <= "10";
		SEL <= '0';
		A <= "11111111";
		B <= "11111111";
   end process;

END;
