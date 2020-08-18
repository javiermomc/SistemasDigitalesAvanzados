----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:51 10/03/2019 
-- Design Name: 
-- Module Name:    SelAnodo - Behavioral 
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

entity SelAnodo is
port (
	Sel : in STD_LOGIC;
	Anodo_out : out STD_LOGIC_VECTOR (3 downto 0));
end SelAnodo;

architecture Behavioral of SelAnodo is

begin

	process(Sel)
		begin
		if Sel='1' then
			Anodo_out <= "1101";
		else
			Anodo_out <= "1110";
		end if;
	end process;

end Behavioral;

