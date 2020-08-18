----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:39 10/25/2019 
-- Design Name: 
-- Module Name:    ErrorInput - Behavioral 
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

entity ErrorInput is
    Port ( Segundos : in  STD_LOGIC_VECTOR (7 downto 0);
           Result : out  STD_LOGIC);
end ErrorInput;

architecture Behavioral of ErrorInput is

begin

process(Segundos)
begin
	if(Segundos(7 downto 4)>"1001" OR Segundos(3 downto 0)>"1001") then
		Result <= '1';
	else
		Result <= '0';
	end if;
end process;


end Behavioral;

