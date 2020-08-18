----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    SelDisplay - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SelDisplay is

port (
		Uni : in STD_LOGIC_VECTOR (3 downto 0);
		Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Valor : out STD_LOGIC_VECTOR (3 downto 0));

end SelDisplay;

architecture Behavioral of SelDisplay is

begin

	process(Sel, Uni, Dec)
	begin
		if Sel='1' then
			Valor <= Dec;
		else
			Valor <= Uni;
		end if;
	end process;

end Behavioral;

