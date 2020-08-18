----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- 
-- Create Date:    16:00:11 09/10/2019 
-- Design Name: 
-- Module Name:    Operators - Behavioral 
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

entity Operators is
	 Generic (n : integer := 7);
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           NOUT : out  STD_LOGIC_VECTOR (2 downto 0);
           SUM : out  STD_LOGIC_VECTOR (7 downto 0);
           CIN : inout  STD_LOGIC_VECTOR (7 downto 0);
			  COUT : inout  STD_LOGIC_VECTOR (7 downto 0);
			  SELECTOR : in STD_LOGIC_VECTOR (1 downto 0)
			  );
end Operators;

architecture Behavioral of Operators is

begin

process(A, B, SEL, CIN, COUT, SELECTOR)
begin
	-- Use selector for type operator
	-- "00" for comparator - Problem 5.8
	-- "01" for priority encoder - Problem 5.2
	-- "10" for adder - Problem 5.4
	if SELECTOR = "00" then -- Comparator
		-- Use SEL as 1 to compare A and B signed
		-- A>B = "100"
		-- A=B = "010"
		-- A<B = "001"
		if SEL = '1' then
			if signed(A) > signed(B) then	NOUT <= "100";
			elsif signed(A) < signed(B) then	NOUT <= "001";
			else NOUT <= "010";
			end if;
		else
			if A > B then	NOUT <= "100";
			elsif A < B then	NOUT <= "001";
			else NOUT <= "010";
			end if;
		end if;
		CIN 	<= "00000000";
		COUT 	<= "00000000";
		SUM 	<= "00000000";
	elsif SELECTOR = "01" then -- Priority encoder
		if 	A(6) = '1' then NOUT<="111";
		elsif A(5) = '1' then NOUT<="110";
		elsif A(4) = '1' then NOUT<="101";
		elsif A(3) = '1' then NOUT<="100";
		elsif A(2) = '1' then NOUT<="011";
		elsif A(1) = '1' then NOUT<="010";
		elsif A(0) = '1' then NOUT<="001";
		else NOUT<="000";
		end if;
		CIN 	<= "00000000";
		COUT 	<= "00000000";
		SUM 	<= "00000000";
	elsif SELECTOR = "10" then -- Adder
		CIN(0) <= '0';
		SUM(0) <= A(0) XOR B(0) XOR CIN(0);
		COUT(0) <= (A(0) AND B(0)) OR (CIN(0) AND B(0)) OR (A(0) AND CIN(0));
		for i in 1 to n loop
			CIN(i) <= COUT(i-1);
			SUM(i) <= A(i) XOR B(i) XOR CIN(i);
			COUT(i) <= (A(i) AND B(i)) OR (CIN(i) AND B(i)) OR (A(i) AND CIN(i));
		end loop;
		NOUT <= "000";
	else
		CIN 	<= "00000000";
		COUT 	<= "00000000";
		SUM 	<= "00000000";
		NOUT 	<= "000";
	end if;
		
end process;




end Behavioral;

