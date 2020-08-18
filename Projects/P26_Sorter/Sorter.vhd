----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- ID: A01365137
--
-- Create Date:    10:21:00 12/02/2019 
-- Design Name: 	 Sorter
-- Module Name:    Sorter - Behavioral 
-- Project Name: 	 Sorter
-- Target Devices: 
-- Tool versions: 
-- Description: 	Select min, medium and max value from A, B and C
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

entity Sorter is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Min : out  STD_LOGIC_VECTOR (7 downto 0);
           Med : out  STD_LOGIC_VECTOR (7 downto 0);
           Max : out  STD_LOGIC_VECTOR (7 downto 0));
end Sorter;

architecture Behavioral of Sorter is

begin

	-- Selects which is greater
	process(A, B, C)
	begin
		if A>=B AND A>=C then	-- If A is greater
			Max <= A;
			if B>=C then
				Med <= B;
				Min <= C;
			else
				Med <= C;
				Min <= B;
			end if;
		elsif B>=A AND B>=C then -- If B is greater
			Max <= B;
			if A>=C then
				Med <= A;
				Min <= C;
			else
				Med <= C;
				Min <= A;
			end if;
		elsif C>=A AND C>=B then -- If C is greater
			Max <= C;
			if A>=B then
				Med <= A;
				Min <= B;
			else
				Med <= B;
				Min <= A;
			end if;
		else
			Max <= A;
			Med <= B;
			Min <= C;
		end if;
		end process;

end Behavioral;

