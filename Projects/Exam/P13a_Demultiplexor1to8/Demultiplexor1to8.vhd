----------------------------------------------------------------------------------
-- Company:        ITESM
-- Engineer:       Rick 
-- 
-- Create Date:    12:08:01 09/20/2019 
-- Design Name: 
-- Module Name:    Demultiplexor1to8 - Demultiplexor1to8_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Solution for Problem 1 of the First Term Exam
--                 Implementation of a 1-to-8 Demultiplexor
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

entity Demultiplexor1to8 is
    Port ( A   : in   STD_LOGIC;
           Sel : in   STD_LOGIC_VECTOR (2 downto 0);
           F   : out  STD_LOGIC_VECTOR (7 downto 0));
end Demultiplexor1to8;

architecture Demultiplexor1to8_Arch of Demultiplexor1to8 is

begin
  -- Concurrent Solution 1
  with Sel select
      F <= ("0000000" & A            ) when "000",
		     ( "000000" & A & "0"      ) when "001",
			  (  "00000" & A & "00"     ) when "010",
			  (   "0000" & A & "000"    ) when "011",
			  (    "000" & A & "0000"   ) when "100",
			  (     "00" & A & "00000"  ) when "101",
			  (      "0" & A & "000000" ) when "110",
           (            A & "0000000") when others;
			  
  -- Concurrent Solution 2
--  F <= ("0000000" & A            ) when (Sel = "000") else
--       ( "000000" & A & "0"      ) when (Sel = "001") else 
--		 (  "00000" & A & "00"     ) when (Sel = "010") else
--		 (   "0000" & A & "000"    ) when (Sel = "011") else
--		 (    "000" & A & "0000"   ) when (Sel = "100") else
--		 (     "00" & A & "00000"  ) when (Sel = "101") else
--		 (      "0" & A & "000000" ) when (Sel = "110") else
--       (            A & "0000000");
		 
  -- Sequential Solution 3
--  process (Sel,A)
--  begin
--    case (Sel) is 
--      when "000"  => F <= ("0000000" & A            );
--      when "001"  => F <= ( "000000" & A & "0"      );
--      when "010"  => F <= (  "00000" & A & "00"     );
--      when "011"  => F <= (   "0000" & A & "000"    );
--      when "100"  => F <= (    "000" & A & "0000"   );
--      when "101"  => F <= (     "00" & A & "00000"  );
--      when "110"  => F <= (      "0" & A & "000000" );
--      when others => F <= (            A & "0000000");
--    end case;
--  end process;
  
  -- Sequetial Solution 4
--  process (A,Sel)
--    variable Aux : STD_LOGIC_VECTOR (7 downto 0);
--  begin
--    Aux := (others => '0');
--	 Aux(conv_integer(Sel)) := A;
--	 F <= Aux;
--  end process;

  -- Sequential Solution 5
--  process (Sel,A)
--  begin
--    for i in 7 downto 0 loop
--      if i = conv_integer(Sel) then
--		  F(i) <= A;
--		else
--		  F(i) <= '0';
--		end if;
--   end loop;
--  end process;
--  
--			
end Demultiplexor1to8_Arch;

