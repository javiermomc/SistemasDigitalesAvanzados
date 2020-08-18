----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Rick
-- 
-- Create Date:    13:22:15 09/20/2019 
-- Design Name: 
-- Module Name:    Even_Parity_Detector - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Even Partity Detector 
--                 Problem 2, First term exam
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Even_Parity_Detector is
    Port ( Ent    : in  STD_LOGIC_VECTOR (7 downto 0);
           Parity : out STD_LOGIC);
end Even_Parity_Detector;

architecture Behavioral of Even_Parity_Detector is
  type Arr is array (0 to 7) of STD_LOGIC;
  signal Tmp : Arr;
begin
  -- Solution 1, Concurrent
  Tmp(7) <= Ent(7);
  Solution1:
   for i in 6 downto 0 generate
   begin
     Tmp(i) <= Tmp(i+1) xor Ent(i);
   end generate;
	Parity <= not Tmp(0);
	
	-- Solution 2, Sequential
--	process (Ent)
--	  variable Aux : STD_LOGIC;
--	begin
--	  Aux := Ent(7);
--	  for i in 6 downto 0 loop
--       Aux := Aux xor Ent(i);
--     end loop;
--	  Parity <= not Aux;
--	end process;
	
   -- Solution 3, Sequential
--	process (Ent)
--	  variable Aux : STD_LOGIC;
--	  variable i : integer;
--	begin
--	  Aux := Ent(7);
--	  i   := 6;
--     while (i >= 0) loop      
--	    Aux := Aux xor Ent(i);
--       i   := i - 1;
--     end loop;
--	  Parity <= not Aux;
--	end process;

end Behavioral;

