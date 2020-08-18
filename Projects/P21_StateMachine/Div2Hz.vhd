----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- 
-- Create Date:    23/10/2019
-- Module Name:    Frequency divider 
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

entity Div2Hz is
port (
		Clk : in STD_LOGIC;
		Rst : in STD_LOGIC;
		En : out STD_LOGIC);
end Div2Hz;

architecture DivHz_Arch of Div2Hz is
	constant BoardFreq : integer := 100_000_000;
	constant DesiredFreq : integer := 2;
	constant MaxCount : integer := BoardFreq/DesiredFreq;
	signal Count : integer range 0 to MaxCount;
begin

	Frequency_Divider: process(Clk, Rst)
	  begin
		 if Rst = '1' then
			Count <= 0;
		 elsif (rising_edge(Clk)) then
			if (Count = MaxCount) then
			  En <= '1';
			  Count <= 0;
			else
			  En <= '0';
			  Count <= Count +1;
			end if;
		 end if;	
	  end process Frequency_Divider;

end DivHz_Arch;

