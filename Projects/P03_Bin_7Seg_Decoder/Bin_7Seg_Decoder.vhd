----------------------------------------------------------------------------------
-- Company: ITESM - CQ
-- Engineer: Javier Mondragon
-- 
-- Create Date:    18:31:54 08/23/2019 
-- Design Name: 
-- Module Name:    Bin_7Seg_Decoder - Bin_7Seg_Decoder 
-- Project Name: 	 
-- Target Devices: Nexys3 Board
-- Tool versions: ISE Webpack v14.7
-- Description: Binary to 7-Segment Decoder example
--
-- Dependencies: 
--
-- Revision: v1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bin_7Seg_Decoder is
    Port ( A 		: in  		STD_LOGIC;
           B 		: in  		STD_LOGIC;
           C 		: in  		STD_LOGIC;
           D 		: in  		STD_LOGIC;
           SEG 	: out  		STD_LOGIC_VECTOR (7 downto 0);
           ANODE 	: out  		STD_LOGIC_VECTOR (3 downto 0));
end Bin_7Seg_Decoder;

architecture Bin_7Seg_Decoder of Bin_7Seg_Decoder is

signal BIN: STD_LOGIC_VECTOR(3 downto 0);
	
begin

--	Option #1
		-- Write a boolean equation for each segment
--	SEG(7) <= '1'; -- Assign binary 1 '1' to Segmment 7
--	SEG(6) <= (not D and not C and not B) or 
--				 (not D and C and B and A) or 
--				 (D and C and not B and not A);
--	SEG(5) <= (not D and not C and A) or 
--				 (not D and not C and B) or 
--				 (not D and B and A) or 
--				 (D and C and not B and A);
--	SEG(4) <= (not D and A) or 
--				 (not C and not B and A) or 
--				 (not D and C and not B);
--	SEG(3) <= (C and B and A) or 
--				 (not D and not C and not B and A) or 
--				 (not D and C and not B and not A) or 
--				 (D and not C and B and not A);
--	SEG(2) <= (D and C and not A) or 
--				 (D and C and B) or 
--				 (not D and not C and B and not A);
--	SEG(1) <= (C and B and not A) or 
--				 (D and B and A) or 
--				 (D and C and not A) or 
--				 (not D and C and not B and A);
--	SEG(0) <= (not D and not C and not B and A) or 
--				 (not D and C and not B and not A) or 
--				 (D and not C and B and A) or 
--				 (D and C and not B and A);
--	
	-- Select the display to show number
	-- Approach 1
--	ANODE(3) <= '1'; -- Turn display off
--	ANODE(2) <= '1'; -- Turn display off
--	ANODE(1) <= '1'; -- Turn display off
--	ANODE(0) <= '0'; -- Turn display on
--	
--	-- Approach 2
	ANODE <= "1110";
	
	-- Approach 3
--	ANODE <= x"E";
	
--	Option #2
--	Use concurrent Behavbioral statement the 7segment decode
--	Binary notation
--	BIN <= D&C&B&A;
--	with BIN select
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
--	 
--	Hexadecimal notation
	BIN <= D&C&B&A;
	with BIN select
      Seg <= x"C0" when x"0",
             x"F9" when x"1",
				 x"A4" when x"2",
				 x"B0" when x"3",
				 x"99" when x"4",
				 x"92" when x"5",
				 x"82" when x"6",
				 x"F8" when x"7",
				 x"80" when x"8",
				 x"90" when x"9",
				 x"88" when x"A",
				 x"83" when x"B",
				 x"C6" when x"C",
				 x"A1" when x"D",
				 x"86" when x"E",
				 x"8E" when x"F",
             x"7F" when others;
				 
		


end Bin_7Seg_Decoder;

