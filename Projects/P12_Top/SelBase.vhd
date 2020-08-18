----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:56 10/04/2019 
-- Design Name: 
-- Module Name:    SelBase - Behavioral 
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

entity SelBase is
port (
		Uni_Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Uni_Bin : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Bin : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
end SelBase;

architecture Behavioral of SelBase is

begin

process(Sel, Uni_Bin, Dec_Bin, Uni_Dec, Dec_Dec)
begin
	if(Sel='1') then
		Uni_Seg <= Uni_Bin;
		Dec_Seg <= Dec_Bin;
	else
		Uni_Seg <= Uni_Dec;
		Dec_Seg <= Dec_Dec;
	end if;
end process;

end Behavioral;

