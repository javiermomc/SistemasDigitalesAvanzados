----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:11 10/03/2019 
-- Design Name: 
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
		Uni_Seg : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Seg : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Valor : out STD_LOGIC_VECTOR (3 downto 0));

end SelDisplay;

architecture Behavioral of SelDisplay is

begin

	process(Sel, Uni_Seg, Dec_Seg)
	begin
		if Sel='1' then
			Valor <= Dec_Seg;
		else
			Valor <= Uni_Seg;
		end if;
	end process;

end Behavioral;

