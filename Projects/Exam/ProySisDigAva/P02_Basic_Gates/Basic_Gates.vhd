----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:       Elmer Homero
-- 
-- Create Date:    11:07:51 08/21/2019 
-- Design Name:    Basic Gates
-- Module Name:    Basic_Gates - Basic_Gates_Arch 
-- Project Name:   P01_Basic_Gates 
-- Target Devices: Spartan 6 - Nexys3 board
-- Tool versions:  ISE v14.7
-- Description:    Define the basic gates concurrently
--
-- Dependencies:   None
--
-- Revision: 		 v1.0
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
           Y : out  STD_LOGIC);
end Basic_Gates;

architecture Basic_Gates_Arch of Basic_Gates is

begin
--  -- Buffer gate
--  Y <= A;
--  
--  -- Inverter gate
--  Y <= not A;
--  
--  -- 2-input AND gate
--  Y <= A and B;
--  
--  -- 2-input NAND gate
--  Y <= A nand B;
--  Y <= not(A and B);
--  
--  -- 2-input OR gate
--  Y <= A or B;
--
--  -- 2-input NOR gate
--  Y <= A nor B;
--  Y <= not(A or B);
--  
--  -- 2-input XOR gate
--  Y <= A xor B;
--  Y <= (A and not(B)) or (not(A) and B);
--  Y <= (A and not B) or (not A and B);
--  
--  -- 2-input XNOR gate
--  Y <= A xnor B;
--  Y <= (A and B) or (not(A) and not(B));
--  
--  -- 4-input NAND gate
--  Y <= A nand B nand C nand D;
  
  -- Mayority detector
  Y <= (A and B) or (A and C) or (B and C);
  


end Basic_Gates_Arch;







