----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:38 10/04/2019 
-- Design Name: 
-- Module Name:    Counter_BinDec - Behavioral 
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

entity Counter_BinDec is
    Port ( Clk : in   STD_LOGIC;
           Clr : in   STD_LOGIC;
			  BinDec : in STD_LOGIC;
			  Anode : out STD_LOGIC_VECTOR(3 downto 0);
           Q   : out  STD_LOGIC_VECTOR (7 downto 0));
end Counter_BinDec;

architecture Behavioral of Counter_BinDec is

signal Count_Dec : STD_LOGIC_VECTOR (3 downto 0);
signal Count_Bin : STD_LOGIC_VECTOR (3 downto 0);
  signal En1Hz : STD_LOGIC;
  -- Embedded signals used by the Frequency_Divider
  constant MaxCountM : integer := 99_999_999;
  signal Count100M : integer range 0 to MaxCountM;
  signal Q_Dec : STD_LOGIC_VECTOR (3 downto 0);
  signal Q_Bin : STD_LOGIC_VECTOR (3 downto 0);

begin
	
  Anode<="1110";
  Frequency_Divider: process(Clr,Clk)
  begin
    if (Clr = '1') then
	   Count100M <= 0;
    elsif (rising_edge(Clk)) then
	   if (Count100M = MaxCountM) then
		  En1Hz     <= '1';
		  Count100M <= 0;
		else
		  En1Hz     <= '0';
		  Count100M <= Count100M + 1;
		end if;
	 end if;	  
  end process Frequency_Divider;
  
  -- Implementation of a 4-bit Binary Counter
  -- with Asynchronous Clear (Clr)
  Counter_Dec: process(Clr,Clk,Count_Dec)
  begin
    if (Clr = '1') then
		Count_Dec <= (others => '0');
	 elsif (rising_edge(Clk)) then
	   if (En1Hz = '1') then
	     Count_Dec <= Count_Dec + 1;
		  if Count_Dec = "1001" then
			Count_Dec <= "0000";
		  end if;
	   end if;
    end if;
	 Q_Dec <= Count_Dec;
  end process Counter_Dec;
  
  Counter_Bin: process(Clr,Clk,Count_Bin)
  begin
    if (Clr = '1') then
		Count_Bin <= (others => '0');
	 elsif (rising_edge(Clk)) then
	   if (En1Hz = '1') then
	     Count_Bin <= Count_Bin + 1;
		  if Count_Bin = "1111" then
			Count_Bin <= "0000";
		  end if;
	   end if;
    end if;
	 Q_Bin <= Count_Bin;
  end process Counter_Bin;
  
  SelBase: process(BinDec, Q_Bin, Q_Dec)
  begin
	if BinDec='1' then
		case Q_Bin is
				when "0000" => Q <= "11000000";
				when "0001" => Q <= "11111001";
				when "0010" => Q <= "10100100";
				when "0011" => Q <= "10110000";
				when "0100" => Q <= "10011001";
				when "0101" => Q <= "10010010";
				when "0110" => Q <= "10000010";
				when "0111" => Q <= "11111000";
				when "1000" => Q <= "10000000";
				when "1001" => Q <= "10010000";
				when "1010" => Q <= "10001000";
				when "1011" => Q <= "10000011";
				when "1100" => Q <= "11000110";
				when "1101" => Q <= "10100001";
				when "1110" => Q <= "10000110";
				when others => Q <= "10001110";
		end case;
	else
		case Q_Dec is
				when "0000" => Q <= "11000000";
				when "0001" => Q <= "11111001";
				when "0010" => Q <= "10100100";
				when "0011" => Q <= "10110000";
				when "0100" => Q <= "10011001";
				when "0101" => Q <= "10010010";
				when "0110" => Q <= "10000010";
				when "0111" => Q <= "11111000";
				when "1000" => Q <= "10000000";
				when "1001" => Q <= "10010000";
				when "1010" => Q <= "10001000";
				when "1011" => Q <= "10000011";
				when "1100" => Q <= "11000110";
				when "1101" => Q <= "10100001";
				when "1110" => Q <= "10000110";
				when others => Q <= "10001110";
		end case;
	end if;
  end process SelBase;
  

end Behavioral;

