----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:55 12/02/2019 
-- Design Name: 
-- Module Name:    Zeroes - Behavioral 
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

entity Zeroes is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           zeroes : out  STD_LOGIC_VECTOR (8 downto 0));
end Zeroes;
architecture Behavioral of Zeroes is
signal flag : STD_LOGIC;
signal zeroCount : STD_LOGIC_VECTOR(8 downto 0);
begin

	process(data, zeroCount, flag)
	begin
		flag <= '0';
		zeroCount <= "000000000";
		for i in 0 to 7 loop
			if data(i)='0' and flag = '0' then
				zeroCount <= zeroCount+1;
			else
				flag <= '1';
			end if;
		end loop;
		zeroes <= zeroCount;
		
	end process;



end Behavioral;

