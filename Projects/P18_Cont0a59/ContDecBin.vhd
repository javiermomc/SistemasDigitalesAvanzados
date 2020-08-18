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
	 Clk 			: in STD_LOGIC;
	 En     : in STD_LOGIC;
    Dec_Seg  	: out STD_LOGIC_VECTOR(3 downto 0));
end ContDecBin;

architecture ContDecBin_Arch of ContDecBin is
signal CountIzq : STD_LOGIC_VECTOR (3 downto 0);
begin

 process (Clk,En)
  begin
    if (rising_edge(Clk)) then
	   if (En = '1') then
		  if (CountIzq = "0101") then
		    CountIzq <= "0000";
		  elsif (CountIzq<="0100") then
		    CountIzq <= CountIzq+'1';
		  end if;
		end if;
    end if; 

end process;

	 Dec_Seg <= CountIzq;

end ContDecBin_Arch;

