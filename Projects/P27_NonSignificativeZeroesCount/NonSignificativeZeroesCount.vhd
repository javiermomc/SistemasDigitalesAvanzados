----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:01 12/02/2019 
-- Design Name: 
-- Module Name:    NonSignificativeZeroesCount - Behavioral 
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

entity NonSignificativeZeroesCount is
	Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           zeroes : OUT  INTEGER RANGE 0 to 8);
end NonSignificativeZeroesCount;

architecture Behavior of NonSignificativeZeroesCount is
begin

	process(data)
	variable zeroCount : integer range 0 to 8;
	--variable flag : integer range 0 to 1;
	begin	
		zeroCount := 0;
		--flag :=0;
		for i in 7 to 0 loop
			if (data(i)='0') then
				zeroCount := zeroCount+1;
			else
				exit;
			end if;
			zeroes <= zeroCount;
		end loop;
	end process;

end Behavior;

