----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:31 10/03/2019 
-- Design Name: 
-- Module Name:    ContUniSeg - Behavioral 
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity ContUniBin is
		port (
			Rst 	  : in  STD_LOGIC;
			Clk_1Hz : in  STD_LOGIC;
			Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
			TC      : out STD_LOGIC);
end ContUniBin;

architecture Behavioral of ContUniBin is

	--Embedded signals used in Counter
	signal Count      : STD_LOGIC_VECTOR (3 downto 0);


begin
	--Unit Counter
	Counter: process(Rst,Clk_1Hz,Count)
	begin
		if (Rst='1') then
			Count <= (others => '0');
		elsif (rising_edge(Clk_1Hz)) then
			if(Count = "1111")then
				Count <=(others => '0');
			else
				Count <= Count + 1;
			end if;
		end if;
		end process Counter;

	--Assign to Output 
	Uni_Seg <= Count;
	
	--Terminal Count
	TC <= '1' when Count = "1001" else
	      '0';
  

end Behavioral;