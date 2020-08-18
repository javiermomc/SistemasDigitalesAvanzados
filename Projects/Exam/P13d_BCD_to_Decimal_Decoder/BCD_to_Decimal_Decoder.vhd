----------------------------------------------------------------------------------
-- Company:        ITESM
-- Engineer:       Rick
-- 
-- Create Date:    17:24:50 09/20/2019 
-- Design Name: 
-- Module Name:    BCD_to_Decimal_Decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    BCD to Decimal Encoder based on the SN74LS42 IC
--                 Problem 4, First Term Exam
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

entity BCD_to_Decimal_Decoder is
    Port ( D      : in   STD_LOGIC;
           C      : in   STD_LOGIC;
           B      : in   STD_LOGIC;
           A      : in   STD_LOGIC;
           DecOut : out  STD_LOGIC_VECTOR (9 downto 0));
end BCD_to_Decimal_Decoder;

architecture Behavioral of BCD_to_Decimal_Decoder is

begin


end Behavioral;

