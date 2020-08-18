----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- ID: A01365137
-- Create Date:    10:15:35 09/18/2019 
-- Design Name: 	Demux 1 to 8
-- Module Name:    Problem1 - Behavioral 
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

entity Problem1 is
    Port ( A : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           F : out  STD_LOGIC_VECTOR (7 downto 0));
end Problem1;

architecture Behavioral of Problem1 is

begin

process(Sel, A)
begin
	case(Sel) is
		when "000" => F <="0000000"&A;
		when "001" => F <="000000"&A&'0';
		when "010" => F <="00000"&A&"00";
		when "011" => F <="0000"&A&"000";
		when "100" => F <="000"&A&"0000";
		when "101" => F <="00"&A&"00000";
		when "110" => F <='0'&A&"000000";
		when others => F <=A&"0000000";
	end case;
			
end process;
end Behavioral;

