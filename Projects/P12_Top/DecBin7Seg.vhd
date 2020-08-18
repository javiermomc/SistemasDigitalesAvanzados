----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:00 10/03/2019 
-- Design Name: 
-- Module Name:    DecBin7Seg - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DecBin7Seg is
	port (
			Valor : in STD_LOGIC_VECTOR (3 downto 0);
			Seg_out : out STD_LOGIC_VECTOR (7 downto 0));
end DecBin7Seg;

architecture Behavioral of DecBin7Seg is

begin

	with Valor select
      Seg_out <= x"C0" when x"0",
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

end Behavioral;

