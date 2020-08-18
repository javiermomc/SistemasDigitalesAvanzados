----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:50 10/03/2019 
-- Design Name: 
-- Module Name:    ContDecSeg - Behavioral 
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

entity ContDecSeg is
		port (
			En 	  : in  STD_LOGIC;
			Rst 	  : in  STD_LOGIC;
			Clk_1Hz : in  STD_LOGIC;
			Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
end ContDecSeg;

architecture Behavioral of ContDecSeg is
	signal Count : STD_LOGIC_VECTOR (3 downto 0);

begin

	--Unit Counter
	Counter: process(Rst,Clk_1Hz,Count)
	begin
		if (Rst='1') then
			Count <= (others => '0');
		elsif (rising_edge(Clk_1Hz)) then
			if(En = '1')then
				if(count="0101") then
					Count <="0000";
				else
					Count <= Count + 1;
				end if;
			end if;
		end if;
		end process Counter;

	--Assign to Output 
	Dec_Seg <= Count;

end Behavioral;