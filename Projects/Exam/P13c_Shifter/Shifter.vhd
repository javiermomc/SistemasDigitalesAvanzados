----------------------------------------------------------------------------------
-- Company:        ITESM-CQ
-- Engineer:       Rick 
-- 
-- Create Date:    13:52:20 09/20/2019 
-- Design Name: 
-- Module Name:    Shifter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Roll-right the input Ent by Sel postions giving Sal
--                 Problem 3, First Term Exam
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;
--use IEEE.std_logic_unsigned.all;
--
--entity Shifter is
--    Port ( Ent : in  STD_LOGIC_VECTOR (7 downto 0);
--           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
--           Sal : out STD_LOGIC_VECTOR (7 downto 0));
--end Shifter;
--
--architecture Behavioral of Shifter is
--
--begin
--  -- Solution 1, Concurrent
--  with Sel select
--     Sal <= (Ent(7 downto 0)         )          when "000",
--				(Ent(6 downto 0) & Ent(7))          when "001",
--				(Ent(5 downto 0) & Ent(7 downto 6)) when "010",
--				(Ent(4 downto 0) & Ent(7 downto 5)) when "011",
--				(Ent(3 downto 0) & Ent(7 downto 4)) when "100",
--				(Ent(2 downto 0) & Ent(7 downto 3)) when "101",
--				(Ent(1 downto 0) & Ent(7 downto 2)) when "110",
--            (Ent(0)          & Ent(7 downto 1)) when others;
--
--end Behavioral;


-- Solution 2, full code
----------------------------------------------------------------------------------
-- Company:        ITESM-CQ
-- Engineer:       Rick 
-- 
-- Create Date:    13:52:20 09/20/2019 
-- Design Name: 
-- Module Name:    Shifter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Roll-right the input Ent by Sel postions giving Sal
--                 Problem 3, First Term Exam
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

entity Shifter is
    Port ( Ent : in  BIT_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Sal : out BIT_VECTOR (7 downto 0));
end Shifter;

architecture Behavioral of Shifter is

begin
  -- Solution 1, Concurrent
  with Sel select
     Sal <= (Ent)          when "000",
				(Ent rol 1)          when "001",
				(Ent rol 2) when "010",
				(Ent rol 3) when "011",
				(Ent rol 4) when "100",
				(Ent rol 5) when "101",
				(Ent rol 6) when "110",
            (Ent rol 7) when others;

end Behavioral;
