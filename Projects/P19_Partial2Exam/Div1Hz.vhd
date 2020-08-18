----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    Div1Hz - Div1Hz_Arch 
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

entity Div1Hz is
port (
		Clk_100MHz : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk_1Hz : out STD_LOGIC);
end Div1Hz;

architecture Div1Hz_Arch of Div1Hz is
	constant MaxCountM : integer := 99_999_999;
	signal Count100M : integer range 0 to MaxCountM;
begin

	Frequency_Divider: process(Rst,Clk_100MHz)
	  begin
		 if (Rst = '1') then
			Count100M <= 0;
		 elsif (rising_edge(Clk_100MHz)) then
			if (Count100M = MaxCountM) then
			  Clk_1Hz <= '1';
			  Count100M <= 0;
			else
			  Clk_1Hz <= '0';
			  Count100M <= Count100M+1;
			end if;
		 end if;	  
	  end process Frequency_Divider;

end Div1Hz_Arch;

