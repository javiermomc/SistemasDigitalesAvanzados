----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:50 11/20/2019 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is

	Generic (
		n : integer := 3;
		m : integer := 8
	);
	Port	(
	Addr : in STD_LOGIC_VECTOR(n-1 downto 0);
	Output : out STD_LOGIC_VECTOR(m-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

	type ROM_type is array (2**n-1) of STD_LOGIC_VECTOR(m-1 downto 0);
	constant ROM : ROM_type := (x"5", x"8", x"F", x"C", 
										 x"B", x"1", x"0", x"6");

begin

	Output <= ROM(unsigned(Addr));

end Behavioral;

