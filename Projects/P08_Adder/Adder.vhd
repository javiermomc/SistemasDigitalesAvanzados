
-- Not generic
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Adder is
	Generic (n : integer := 7);
    Port ( Cin  : in  STD_LOGIC;
           A    : in  STD_LOGIC_VECTOR (n downto 0);
           B    : in  STD_LOGIC_VECTOR (n downto 0);
           Sum  : out STD_LOGIC_VECTOR (n downto 0);
           Cout : out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
  -- Embedded signal
  signal SumEmb : STD_LOGIC_VECTOR (n+1 downto 0);
begin
  -- Implementation of a Parallel Adder
  SumEmb <= '0'&A + B + Cin;
  Sum    <= signed(SumEmb(n downto 0));
  Cout   <= SumEmb(n+1); 


end Behavioral;

