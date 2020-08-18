----------------------------------------------------------------------------------
-- Company:			 ITESM - CQ 
-- Engineer: 	    Elher Homero
-- 
-- Create Date:    18:31:56 08/23/2019 
-- Design Name: 
-- Module Name:    Bin_7Seg_Decoder - Bin_7Seg_Decoder_Arch 
-- Project Name: 
-- Target Devices: Nexys3 Board
-- Tool versions:  ISE Webpack v14.7
-- Description:    Binary to 7-Segment Decoder example
--
-- Dependencies:   None
--
-- Revision:       v1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bin_7Seg_Decoder is
    Port ( D     : in   STD_LOGIC;
           C     : in   STD_LOGIC;
           B     : in   STD_LOGIC;
           A     : in   STD_LOGIC;
           Seg   : out  STD_LOGIC_VECTOR (7 downto 0);
           Anode : out  STD_LOGIC_VECTOR (3 downto 0));
end Bin_7Seg_Decoder;

architecture Bin_7Seg_Decoder_Arch of Bin_7Seg_Decoder is 
  -- Embedded signals (within the FPGA) are declared here
  signal Bin : STD_LOGIC_VECTOR (3 downto 0);

begin
--  -- 1. Write a Boolean Equation for each Segment
--  Seg(7) <= '1'; -- Assign binary 1 '1' to Segment 7
--  Seg(6) <= (not D and not C and not B) or
--            (    D and     C and not B and not A) or
--				(not D and     C and     B and     A);
--  -- Your Homework
----  Seg(5) <= ;
----  Seg(4) <= ;
----  Seg(3) <= ;
----  Seg(2) <= ;
----  Seg(1) <= ;
----  Seg(0) <= ;
--
--  -- Select the display to show number
--  -- Approach 1 (Tercer mundista)
--  Anode(3) <= '1'; -- Turn display off
--  Anode(2) <= '1'; -- Turn display off
--  Anode(1) <= '1'; -- Turn display off
--  Anode(0) <= '0'; -- Turn display on
--  
--  -- Approach 2 (First World Countries)
--  Anode <= "1110";
--  
--  -- Approach 3 (Beauty in all its sense)
--  Anode <= x"E";  -- Hexadecimal E = 1110 in binary

  -- 2. Use concurrent Behavioral statements to implement the 7segment
  -- decoder using Truth Tables directly
  -- Using the concurrent with/select statement
  
  -- Group invidual signals into a bus using concatenation
  Bin <= D & C & B & A;
  
  -- Binary notation
--  with Bin select
--      Seg <= "11000000" when "0000",
--             "11111001" when "0001",
--				 "10100100" when "0010",
--				 "10110000" when "0011",
--				 "10011001" when "0100",
--				 "10010010" when "0101",
--				 "10000010" when "0110",
--				 "11111000" when "0111",
--				 "10000000" when "1000",
--				 "10010000" when "1001",
--				 "10001000" when "1010",
--				 "10000011" when "1011",
--				 "11000110" when "1100",
--				 "10100001" when "1101",
--				 "10000110" when "1110",
--				 "10001110" when "1111",
--             "01111111" when others;
				 
  -- Hexadecimal notation
--  with Bin select
--      Seg <= x"C0" when x"0",
--             x"F9" when x"1",
--				 x"A4" when x"2",
--				 x"B0" when x"3",
--				 x"99" when x"4",
--			    x"92" when x"5",
--			    x"82" when x"6",
--			    x"F8" when x"7",
--			    x"80" when x"8",
--			    x"90" when x"9",
--				 x"88" when x"A",
--				 x"83" when x"B",
--				 x"C6" when x"C",
--				 x"A1" when x"D",
--				 x"86" when x"E",
--				 x"8E" when x"F",
--             x"7F" when others;
				 
  -- 3. Use concurrent Behavioral statements to implement the 7segment
  -- decoder using Truth Tables directly
  -- Using the concurrent statement when/else
--   Seg <= x"C0"   when (Bin = x"0") else
--           x"F9"  when (Bin = x"1") else
--			  x"A4"  when (Bin = x"2") else
--			  x"B0"  when (Bin = x"3") else
--			  x"99"  when (Bin = x"4") else
--			  x"92"  when (Bin = x"5") else
--			  x"82"  when (Bin = x"6") else
--			  x"F8"  when (Bin = x"7") else
--			  x"80"  when (Bin = x"8") else
--			  x"90"  when (Bin = x"9") else
--			  x"88"  when (Bin = x"A") else
--			  x"83"  when (Bin = x"B") else
--			  x"C6"  when (Bin = x"C") else
--			  x"A1"  when (Bin = x"D") else
--			  x"86"  when (Bin = x"E") else
--			  x"8E"  when (Bin = x"F") else
--			  x"7F";			 
				 				 
  -- 4. Use sequential Behavioral statements to implement 
  -- the 7segment decoder using Truth Tables directly
  -- Using the sequential statement if/elsif/else
--  process (Bin) -- () is called sensitivity list
--                -- contains any signal that is read
--  begin
--    if    (Bin = x"0") then
--      Seg <= x"C0";
--    elsif (Bin = x"1") then
--      Seg <= x"F9";
--	 elsif (Bin = x"2") then
--	   Seg <= x"A4";
--	 elsif (Bin = x"3") then
--	   Seg <= x"B0";
--	 elsif (Bin = x"4") then
--	   Seg <= x"99";
--	 elsif (Bin = x"5") then
--	   Seg <= x"92";
--	 elsif (Bin = x"6") then
--	   Seg <= x"82";
--	 elsif (Bin = x"7") then
--	   Seg <= x"F8";
--	 elsif (Bin = x"8") then
--	   Seg <= x"80";
--	 elsif (Bin = x"9") then
--	   Seg <= x"90";
--	 elsif (Bin = x"A") then
--	   Seg <= x"88";
--	 elsif (Bin = x"B") then
--	   Seg <= x"83";
--	 elsif (Bin = x"C") then
--	   Seg <= x"C6";
--	 elsif (Bin = x"D") then
--	   Seg <= x"A1";
--	 elsif (Bin = x"E") then
--	   Seg <= x"86";
--	 elsif (Bin = x"F") then
--	   Seg <= x"8E";
--    else
--      Seg <= x"7F";	
--    end if;
--  end process;

  -- 4a. Use sequential Behavioral statements to implement 
  -- the 7segment decoder using Truth Tables directly
  -- Using the sequential statement if/elsif/else
  -- Looks more elegant
--  process (Bin) -- () is called sensitivity list
--                -- contains any signal that is read
--  begin
--    if    (Bin = x"0") then Seg <= x"C0";
--    elsif (Bin = x"1") then Seg <= x"F9";
--	 elsif (Bin = x"2") then Seg <= x"A4";
--	 elsif (Bin = x"3") then Seg <= x"B0";
--	 elsif (Bin = x"4") then Seg <= x"99";
--	 elsif (Bin = x"5") then Seg <= x"92";
--	 elsif (Bin = x"6") then Seg <= x"82";
--	 elsif (Bin = x"7") then Seg <= x"F8";
--	 elsif (Bin = x"8") then Seg <= x"80";
--	 elsif (Bin = x"9") then Seg <= x"90";
--	 elsif (Bin = x"A") then Seg <= x"88";
--	 elsif (Bin = x"B") then Seg <= x"83";
--	 elsif (Bin = x"C") then Seg <= x"C6";
--	 elsif (Bin = x"D") then Seg <= x"A1";
--	 elsif (Bin = x"E") then Seg <= x"86";
--	 elsif (Bin = x"F") then Seg <= x"8E";
--    else                    Seg <= x"7F";	
--    end if;
--  end process; 

  -- 5. Use sequential Behavioral statements to implement 
  -- the 7segment decoder using Truth Tables directly
  -- Using the sequential statement case
--  process (Bin)
--  begin
--    case (Bin) is 
--      when "0000" =>
--         Seg <= x"C0";
--      when "0001" =>
--         Seg <= x"F9";
--      when "0010" =>
--         Seg <= x"A4";
--      when "0011" =>
--         Seg <= x"B0";
--      when "0100" =>
--         Seg <= x"99";
--      when "0101" =>
--         Seg <= x"92";
--      when "0110" =>
--         Seg <= x"82";
--      when "0111" =>
--         Seg <= x"F8";
--      when "1000" =>
--         Seg <= x"80";
--      when "1001" =>
--         Seg <= x"90";
--      when "1010" =>
--         Seg <= x"88";
--      when "1011" =>
--         Seg <= x"83";
--      when "1100" =>
--         Seg <= x"C6";
--      when "1101" =>
--         Seg <= x"A1";
--      when "1110" =>
--         Seg <= x"86";
--      when "1111" =>
--         Seg <= x"8E";
--      when others =>
--         Seg <= x"7F";
--    end case;
--  end process;
  
  -- 5a. Use sequential Behavioral statements to implement 
  -- the 7segment decoder using Truth Tables directly
  -- Using the sequential statement case
  -- More elegant
  process (Bin)
  begin
    case (Bin) is 
      when "0000" => Seg <= x"C0";
      when "0001" => Seg <= x"F9";
      when "0010" => Seg <= x"A4";
      when "0011" => Seg <= x"B0";
      when "0100" => Seg <= x"99";
      when "0101" => Seg <= x"92";
      when "0110" => Seg <= x"82";
      when "0111" => Seg <= x"F8";
      when "1000" => Seg <= x"80";
      when "1001" => Seg <= x"90";
      when "1010" => Seg <= x"88";
      when "1011" => Seg <= x"83";
      when "1100" => Seg <= x"C6";
      when "1101" => Seg <= x"A1";
      when "1110" => Seg <= x"86";
      when "1111" => Seg <= x"8E";
      when others => Seg <= x"7F";
    end case;
  end process;
  
  
  Anode <= "1110";
			


end Bin_7Seg_Decoder_Arch;











