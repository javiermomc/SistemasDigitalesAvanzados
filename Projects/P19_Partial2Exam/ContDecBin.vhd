----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    ContDecBin - Behavioral 
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

entity ContDecBin is
port (
    Load 		: in  STD_LOGIC;
	 Error 		: in STD_LOGIC;
	 Rst   		: in  STD_LOGIC;
	 Clk 			: in STD_LOGIC;
	 En     : in STD_LOGIC;
	 Seg	: in STD_LOGIC_VECTOR(3 downto 0);
    Dec_Seg  	: out STD_LOGIC_VECTOR(3 downto 0));
end ContDecBin;

architecture ContDecBin_Arch of ContDecBin is
signal CountIzq : STD_LOGIC_VECTOR (3 downto 0);
begin

 process (Rst,Clk,En, Load, Error)
  begin
    if (Rst = '1') then
	   CountIzq <= "0000";
	 elsif (rising_edge(Clk)) then
	   if (Load = '1') then
			if (Seg > "1001" OR Error='1') then
				CountIzq <= "1110"; 
			else 	
				CountIzq <= Seg;
			end if;
		elsif (En = '1') then
		  if (CountIzq > "0000" AND CountIzq<="1001") then
		    CountIzq <= CountIzq-'1';
		  end if;
		end if;
    end if; 

end process;

	 Dec_Seg <= CountIzq;

end ContDecBin_Arch;

