----------------------------------------------------------------------------------
-- Company: ITESM - Campus Qro
-- Engineer: Javier Mondragon
-- 
-- Create Date:    11:07:45 08/21/2019 
-- Design Name: 	 Basic Gates
-- Module Name:    Basic_Gates - Behavioral 
-- Project Name: 	 P02_Basic_Gates
-- Target Devices: Spartan 6 - Nexys3 board
-- Tool versions:  ISE v14.7
-- Description: 	 Define the basic gates currently
--
-- Dependencies: 	 None
--
-- Revision: 0
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

entity Basic_Gates is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  C : in  STD_LOGIC;
			  --D : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end Basic_Gates;

architecture Behavioral of Basic_Gates is

begin
--	-- Buffer
--	y <= a;
--	-- Inverter
--	y <= not a;
--	-- AND
--	y <= a and b;
--	-- NAND
--	y <= not(a and b);
--	y <= a nand b;
--	-- OR
--	y <= a or b;
--	-- NOR
--	y <= a nor b;
--	-- XOR
--	y <= a xor b;
--	y <= (a and not b) or (not a and b);
--	-- XNOR
--	y <= a xnor b;
--	y <= (a and b) or (not a and not b);
--	-- NAND 4 inputs
--	y <= a nand b nand c nand d;
	
	-- Mayority detector
	y <= (a and b) or (a and c) or (b and c);

end Behavioral;

