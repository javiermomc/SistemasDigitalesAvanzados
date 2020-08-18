----------------------------------------------------------------------------------
-- Company:        ITESM
-- Engineer:       Rick 
-- 
-- Create Date:    18:16:28 08/30/2019 
-- Design Name: 
-- Module Name:    Mux4to1 - Mux4to1_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Several Multiplexor implementations
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1 is
    Port ( A   : in   STD_LOGIC_VECTOR (3 downto 0);
           B   : in   STD_LOGIC_VECTOR (3 downto 0);
           C   : in   STD_LOGIC_VECTOR (3 downto 0);
           D   : in   STD_LOGIC_VECTOR (3 downto 0);
           Sel : in   STD_LOGIC_VECTOR (1 downto 0);
           Y   : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux4to1;

architecture Mux4to1_Arch of Mux4to1 is

begin
  -- Concurrent Mux4to1 using select/when
--  with Sel select
--      Y <= A when "00",
--           B when "01",
--			  C when "10",
--           D when others;
			  
  -- Concurrent Mux4to1 using when/else
--  Y <= A when (Sel = "00") else
--       B when (Sel = "01") else
--	    C when (Sel = "10") else
--       D;
--		 
  -- Sequential Mux4to1 using Case
  Mux: process (Sel,A,B,C,D) -- Sensitivity list
  begin
    case (Sel) is 
      when "00" =>
         Y <= A;
      when "01" =>
         Y <= B;
      when "10" =>
         Y <= C;
      when "11" =>
         Y <= D;
      when others =>
         Y <= "0000";
    end case;
  end process Mux;

end Mux4to1_Arch;











