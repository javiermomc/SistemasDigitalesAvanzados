----------------------------------------------------------------------------------
-- Company:        Tec-Qro
-- Engineer:       Rick
-- 
-- Create Date:    18:15:35 08/27/2019 
-- Design Name: 
-- Module Name:    XOR2 - XOR2_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Different alternatives to describe an 2-input
--                 XOR gate
-- Dependencies:   None
--
-- Revision:       1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_2 is
    Port ( A : in   STD_LOGIC;
           B : in   STD_LOGIC;
           Y : out  STD_LOGIC);
end XOR_2;

architecture XOR2_Arch of XOR_2 is
  -- Declare an embedded signal to join A and B
  signal Sel : STD_LOGIC_VECTOR(1 downto 0);
  
begin
  -- Declaration 1
  -- Using Dataflow with Concurrent Statements
  -- Option 1
  -- Y <= A xor B;
  -- Option 2
  -- Y <= (A and not B) or (not A and B);
  
  -- Declaration 2
  -- Using a Truth Table with Concurrent Statements
  -- using the with/select statement
  -- Concatenate A and B inputs to become a bus
     Sel <= A & B;
     with Sel select
       Y <= '0' when "00",
            '1' when "01",
				'1' when "10",
				'0' when others;
  
  

end XOR2_Arch;












