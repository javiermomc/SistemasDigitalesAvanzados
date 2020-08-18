----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    ContUniBin - Behavioral 
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

entity ContUniBin is
port (
	 Clk 			: in STD_LOGIC;
	 En    		: in STD_LOGIC;
    Uni_Seg  	: out STD_LOGIC_VECTOR(3 downto 0);
	 TC			: out STD_LOGIC);
end ContUniBin;

architecture ContUniBin_Arch of ContUniBin is
signal CountDer : STD_LOGIC_VECTOR (3 downto 0);
begin


 process (Clk,En)
  begin
    if (rising_edge(Clk)) then
	   if (En = '1') then
		  if (CountDer = "1001") then
		    CountDer <= "0000";
		  elsif(CountDer <= "1001") then
		    CountDer <= CountDer+1;
		  end if;
		end if;
    end if;

	if (falling_edge(Clk)) then
		if(En='1') then
			if (CountDer = "1001") then
				TC<='1';
			else
				TC<='0';
			end if;
		end if;
	end if;
	
end process;

 Uni_Seg <= CountDer;

end ContUniBin_Arch;