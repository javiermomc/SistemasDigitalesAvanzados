----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:11 09/04/2019 
-- Design Name: 
-- Module Name:    Grey_Decoder - Behavioral 
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

entity Grey_Decoder is
    Port ( SEG : out  STD_LOGIC_VECTOR (7 downto 0);
			  LED : out  STD_LOGIC_VECTOR (3 downto 0);
			  ANODE : out  STD_LOGIC_VECTOR (3 downto 0);
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC
           );
end Grey_Decoder;

architecture Behavioral of Grey_Decoder is

signal BIN: STD_LOGIC_VECTOR(3 downto 0);

begin
	BIN <= D&C&B&A;
	ANODE <= "1110";
	process(BIN, E)
	begin
		if (E = '0') then
			case BIN is
				when "0000" => Seg <= "11000000";
				when "0001" => Seg <= "11111001";
				when "0010" => Seg <= "10100100";
				when "0011" => Seg <= "10110000";
				when "0100" => Seg <= "10011001";
				when "0101" => Seg <= "10010010";
				when "0110" => Seg <= "10000010";
				when "0111" => Seg <= "11111000";
				when "1000" => Seg <= "10000000";
				when "1001" => Seg <= "10010000";
				when "1010" => Seg <= "10001000";
				when "1011" => Seg <= "10000011";
				when "1100" => Seg <= "11000110";
				when "1101" => Seg <= "10100001";
				when "1110" => Seg <= "10000110";
				when "1111" => Seg <= "10001110";
				when others => Seg <= "01111111";
			end case;
			case BIN is
				when "0000" => LED <= "0000";
				when "0001" => LED <= "0001";
				when "0010" => LED <= "0011";
				when "0011" => LED <= "0010";
				when "0100" => LED <= "0110";
				when "0101" => LED <= "0111";
				when "0110" => LED <= "0101";
				when "0111" => LED <= "0100";
				when "1000" => LED <= "1100";
				when "1001" => LED <= "1101";
				when "1010" => LED <= "1111";
				when "1011" => LED <= "1110";
				when "1100" => LED <= "1010";
				when "1101" => LED <= "1011";
				when "1110" => LED <= "1001";
				when "1111" => LED <= "1000";
				when others => LED <= "0000";
			end case;
		else
			case BIN is
				when "0000" => Seg <= "11000000";
				when "0001" => Seg <= "11111001";
				when "0011" => Seg <= "10100100";
				when "0010" => Seg <= "10110000";
				when "0110" => Seg <= "10011001";
				when "0111" => Seg <= "10010010";
				when "0101" => Seg <= "10000010";
				when "0100" => Seg <= "11111000";
				when "1100" => Seg <= "10000000";
				when "1101" => Seg <= "10010000";
				when "1111" => Seg <= "10001000";
				when "1110" => Seg <= "10000011";
				when "1010" => Seg <= "11000110";
				when "1011" => Seg <= "10100001";
				when "1001" => Seg <= "10000110";
				when "1000" => Seg <= "10001110";
				when others => Seg <= "01111111";
			end case;
			case BIN is
				when "0000" => LED <= "0000";
				when "0001" => LED <= "0001";
				when "0011" => LED <= "0010";
				when "0010" => LED <= "0011";
				when "0110" => LED <= "0100";
				when "0111" => LED <= "0101";
				when "0101" => LED <= "0110";
				when "0100" => LED <= "0111";
				when "1100" => LED <= "1000";
				when "1101" => LED <= "1001";
				when "1111" => LED <= "1010";
				when "1110" => LED <= "1011";
				when "1010" => LED <= "1100";
				when "1011" => LED <= "1101";
				when "1001" => LED <= "1110";
				when "1000" => LED <= "1111";
				when others => LED <= "0000";
			end case;
		end if;
	end process;
	
	
	for i in 2 downto 0 generate
		begin
			LED(i) <= BIN(i+1) XOR BIN(i);
		end generate;

end Behavioral;

