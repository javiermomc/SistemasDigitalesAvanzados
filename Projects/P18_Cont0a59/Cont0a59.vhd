----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:45:17 10/22/2019 
-- Design Name: 
-- Module Name:    Cont0a59 - Behavioral 
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

entity Cont0a59 is
	Port (
				  Clk : in  STD_LOGIC;
				  Seg: out STD_LOGIC_Vector(7 downto 0);
				  SelAn: out STD_LOGIC_Vector(3 downto 0)
				  );
end Cont0a59;

architecture Behavioral of Cont0a59 is

	component Div1Hz
	port (
		Clk_100MHz : in STD_LOGIC;
		Clk_1Hz : out STD_LOGIC);
	end component;
	
	-- Derives a 200Hz Enable signal from Nexys3
	-- 100MHz clock.
	
	component Div200Hz
	port (
		Clk_100MHz : in STD_LOGIC;
		Clk_200Hz : out STD_LOGIC);
	end component;
	
	component ContUniBin
	port (
		Clk : in STD_LOGIC;
		En : in STD_LOGIC;
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		TC : out STD_LOGIC);
	end component;
	
	-- Counts the tens in binary
	
	component ContDecBin
	port (
		En : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component SelDisplay
	port (
		Uni : in STD_LOGIC_VECTOR (3 downto 0);
		Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Valor : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component DecBin7Seg
	port (
		Valor : in STD_LOGIC_VECTOR (3 downto 0);
		Seg_out : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	-- Select the desired display
	
	component SelAnodo
	port (
		Sel : in STD_LOGIC;
		Anodo_out : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal ValorInt 	: STD_LOGIC_VECTOR (3 downto 0);
	signal Clk1Hz 		: STD_LOGIC;
	signal Clk200Hz 	: STD_LOGIC;
	signal TC		 	: STD_LOGIC;
	signal En_Dec	 	: STD_LOGIC;
	signal UniBin	 	: STD_LOGIC_VECTOR (3 downto 0);
	signal DecBin	 	: STD_LOGIC_VECTOR (3 downto 0);
	

begin

	En_Dec<=TC AND Clk1Hz;
	
	U1 : Div1Hz
	port map (
		Clk_100MHz => Clk,
		Clk_1Hz => Clk1Hz
	);
	
	U2 : Div200Hz
	port map (
		Clk_100MHz => Clk,
		Clk_200Hz => Clk200Hz
	);
	U3 : ContUniBin
	port map (
		Clk => Clk,
		En => Clk1Hz,
		TC => TC,
		Uni_Seg=>UniBin
	);
	U4 : ContDecBin
	port map (
		En => En_Dec,
		Clk => Clk,
		Dec_Seg => DecBin
	);
	U5 : SelDisplay
	port map (
		Uni => UniBin,
		Dec => DecBin,
		Sel => Clk200Hz,
		Valor => ValorInt
	);
	U6 : DecBin7Seg
	port map (
		Valor => ValorInt,
		Seg_out => Seg
	);
	U7 : SelAnodo
	port map (
		Sel => Clk200Hz,
		Anodo_out => SelAn
	);

end Behavioral;

