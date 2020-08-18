----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:22 09/04/2019 
-- Design Name: 
-- Module Name:    Priority_Encoder - Priority_Encoder_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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


entity Priority_Encoder is
    Port ( Ent : in  STD_LOGIC_VECTOR (7 downto 1);
           Sal : out  STD_LOGIC_VECTOR (2 downto 0));
end Priority_Encoder;

architecture Priority_Encoder_Arch of Priority_Encoder is

begin
  -- Sequential statement if-elsif-else
  process (Ent)
  begin
    if     Ent(7) = '1' then
       Sal <= "111";
     elsif Ent(6) = '1' then
       Sal <= "110";
	  elsif Ent(5) = '1' then
       Sal <= "101";
	  elsif Ent(4) = '1' then
       Sal <= "100";
	  elsif Ent(3) = '1' then
       Sal <= "011";
	  elsif Ent(2) = '1' then
       Sal <= "010";
	  elsif Ent(1) = '1' then
       Sal <= "001";
     else
       Sal <= "000";
    end if;
		
  end process;


end Priority_Encoder_Arch;








