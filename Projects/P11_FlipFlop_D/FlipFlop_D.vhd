----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- 
-- Create Date:    10:47:59 10/02/2019 
-- Design Name: FF Variants
-- Module Name:    FlipFlop_D - Behavioral 
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

entity FlipFlop_D is
    Port ( Clk : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0);
           Set : in  STD_LOGIC;
			  EN : in  STD_LOGIC;
           Reset : in  STD_LOGIC);
end FlipFlop_D;

architecture Behavioral of FlipFlop_D is

begin
	
	process (clk)
   begin
      if (falling_edge(clk)) then  
         if (Reset='1') then   
            Q(1) <= '0';
         elsif (Set='1') then
            Q(1) <= '1';
         elsif D='1' then
             Q(1) <= '1';
			elsif D='0' then
             Q(1) <= '0';
         end if;
      end if;
   end process;
	
	process(Clk)
	begin
		if(falling_edge(Clk)) then
			if(Reset='1') then
				Q(0)<='0';
			elsif(Set='1') then
				Q(0)<='1';
			elsif(EN='1') then
				if D='1' then
             Q(0) <= '1';
				else
             Q(0) <= '0';
				end if;
			end if;
		end if;
	end process;
	
	process (clk) 
   begin
      if (falling_edge(clk)) then  
         if (Set='1') then
            Q(2) <= '1';
         elsif (EN='1') then
            if D='1' then
             Q(2) <= '1';
				else
             Q(2) <= '0';
				end if;
			end if;
      end if;
   end process;
	
	process (clk) 
	begin
      if (falling_edge(clk)) then  
         if (Reset='1') then   
            Q(3) <= '0';
         elsif (EN='1') then
            Q(3) <= D;
         end if;
      end if;
   end process;
	
	


end Behavioral;

