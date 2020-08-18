----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- ID: A01365137
-- Create Date:    10:58:10 09/18/2019 
-- Design Name: Even parity detector 8bit
-- Module Name:    Problem2 - Behavioral 
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

entity Problem2 is
    Port ( Ent : in  STD_LOGIC_VECTOR (7 downto 0);
           Parity : out  STD_LOGIC);
end Problem2;

architecture Behavioral of Problem2 is

begin

	process(Ent)
   variable Cont : STD_LOGIC_VECTOR (3 downto 0);
	begin
    Cont := "0000";
    for i in 7 downto 0 loop
        Cont := Cont + Ent(i);
    end loop;
	 Parity <= NOT Cont(0);
  end process;

end Behavioral;

