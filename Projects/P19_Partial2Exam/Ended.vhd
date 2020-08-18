----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    Ended - Behavioral 
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

entity Ended is
    Port ( Uni : in  STD_LOGIC_VECTOR (3 downto 0);
           Dec : in  STD_LOGIC_VECTOR (3 downto 0);
           Fin : out  STD_LOGIC);
end Ended;

architecture Ended_Arch of Ended is

begin

process (Dec, Uni)
begin
	if (Dec = "0000" AND Uni = "0000") then
		Fin <= '1';
	else 
		Fin <= '0';
	end if;
end process;

end Ended_Arch;

