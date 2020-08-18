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

entity DivHz is
port (
		Clk : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Freq : in STD_LOGIC_VECTOR(1 downto 0);
		En : out STD_LOGIC);
end DivHz;

architecture DivHz_Arch of DivHz is
	constant BoardFreq : integer := 100_000_000;
	constant DesiredFreq : integer := 105;
	constant MaxCount : integer := BoardFreq/DesiredFreq;
	signal Count : integer range 0 to MaxCount;
begin

	Frequency_Divider: process(Clk, Rst, Freq)
	  begin
		 if Rst = '1' then
			Count <= 0;
		 elsif (rising_edge(Clk)) then
			case (Freq) is 
				when "00" =>
					if (Count = MaxCount*15) then
					  En <= '1';
					  Count <= 0;
					else
					  En <= '0';
					  Count <= Count +1;
					end if;
				when "01" =>
					if (Count = MaxCount*35) then
					  En <= '1';
					  Count <= 0;
					else
					  En <= '0';
					  Count <= Count +1;
					end if;
				when "10" =>
					if (Count = MaxCount*7) then
					  En <= '1';
					  Count <= 0;
					else
					  En <= '0';
					  Count <= Count +1;
					end if;
				when others =>
					if (Count = MaxCount*35) then
					  En <= '1';
					  Count <= 0;
					else
					  En <= '0';
					  Count <= Count +1;
					end if;
			end case;
		 end if;	
	  end process Frequency_Divider;

end DivHz_Arch;

