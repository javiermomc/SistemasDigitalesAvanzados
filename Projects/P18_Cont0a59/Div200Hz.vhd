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

entity Div200Hz is
port (
		Clk_100MHz : in STD_LOGIC;
		Clk_200Hz : out STD_LOGIC);
end Div200Hz;

architecture Div200Hz_Arch of Div200Hz is
	constant BoardFreq : integer := 100_000_000;
	constant DesiredFreq : integer := 200;
	constant MaxCountM : integer := BoardFreq/DesiredFreq;
	constant HalfMaxCount : integer := MaxCountM/2;
	signal Count100M : integer range 0 to MaxCountM;
	signal Toggle : STD_Logic;
begin

	Frequency_Divider: process(Clk_100MHz, Toggle)
	  begin
		 if (rising_edge(Clk_100MHz)) then
			if (Count100M = HalfMaxCount) then
			  Toggle <= not Toggle;
			  count100M <= 0;
			else
			  Clk_200Hz <= '0';
			  Count100M <= Count100M +1;
			end if;
		 end if;	
		 Clk_200Hz <= Toggle;
	  end process Frequency_Divider;
	  
--	  Frequency_Divider: process(Rst,Clk_100MHz)
--	  begin
--		 if (Rst = '1') then
--			Count100M <= 0;
--		 elsif (rising_edge(Clk_100MHz)) then
--			if (Count100M = HalfMaxCount) then
--			  count100M <= 0;
--			else
--			  Count100M <= Count100M +1;
--			end if;
--		 end if;	
--	  end process Frequency_Divider;
--	  
--	  Clk_200Hz <= '0' when Count100M < HalfMaxCount else
--						'1';

end Div200Hz_Arch;