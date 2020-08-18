----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:04 09/04/2019 
-- Design Name: 
-- Module Name:    Priority_Encoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Priority_Encoder is
    Port ( INPUT : in  STD_LOGIC_VECTOR (7 downto 1);
           OUTPUT : out  STD_LOGIC_VECTOR (2 downto 0));
end Priority_Encoder;

architecture Behavioral of Priority_Encoder is

begin

	process(INPUT)
	begin
		if(INPUT(7) = '1') then
			OUTPUT <= "111";
		elsif(INPUT(6) = '1') then
			OUTPUT <= "110";
		elsif(INPUT(5) = '1') then
			OUTPUT <= "101";
		elsif(INPUT(4) = '1') then
			OUTPUT <= "100";
		elsif(INPUT(3) = '1') then
			OUTPUT <= "011";
		elsif(INPUT(2) = '1') then
			OUTPUT <= "010";
		elsif(INPUT(1) = '1') then
			OUTPUT <= "001";
		else
			OUTPUT <= "000";
		end if;
	end process;
	


end Behavioral;

