----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name:    Segundero
-- Module Name:    Top - Behavioral 
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

entity Top is
Port ( 
			Reset : in  STD_LOGIC;
			ClkinMHz : in STD_LOGIC;
			Segundos : in	 STD_LOGIC_VECTOR(7 downto 0);
			Load : in  STD_LOGIC;
			SelAn : out  STD_LOGIC_VECTOR (3 downto 0);
			Seg : out  STD_LOGIC_VECTOR (7 downto 0);
			Fin : out  STD_LOGIC);
end Top;

architecture Behavioral of Top is

	-- Component declaration

	-- Derives a 1Hz Enable signal from Nexys3
	-- 100MHz clock.

	component Div1Hz
	port (
		Clk_100MHz : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk_1Hz : out STD_LOGIC);
	end component;
	
	-- Derives a 200Hz Enable signal from Nexys3
	-- 100MHz clock.
	
	component Div200Hz
	port (
		Clk_100MHz : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk_200Hz : out STD_LOGIC);
	end component;
	
	-- Counts the units in binary
	
	component ContUniBin
	port (
		Rst : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Error : in STD_LOGIC;
		En : in STD_LOGIC;
		Load : in STD_LOGIC;
		Seg : in STD_LOGIC_VECTOR (3 downto 0);
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		TC : out STD_LOGIC);
	end component;
	
	-- Counts the tens in binary
	
	component ContDecBin
	port (
		Load : in STD_LOGIC;
		Error : in STD_LOGIC;
		En : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk : in STD_LOGIC;
		Seg : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Gives the value synthesized
	
	component SelDisplay
	port (
		Uni : in STD_LOGIC_VECTOR (3 downto 0);
		Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Valor : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Value to the segment
	
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
	
	component Ended
	port (
		Uni : in STD_LOGIC_VECTOR (3 downto 0);
		Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Fin : out STD_LOGIC
	);
	end component;
	
	component Debounce_btn
		PORT(
		 clk     : IN  STD_LOGIC;    
		 button  : IN  STD_LOGIC;  
		 result  : OUT STD_LOGIC); 
	end component;
	
	component ErrorInput
		PORT(
			Segundos	: in STD_LOGIC_VECTOR(7 downto 0);
			Result	: out STD_LOGIC
		);
	end component;
	
	-- Signal declaration
	signal Clk1Hz 		: STD_LOGIC;
	signal Clk200Hz 	: STD_LOGIC;
	signal Enable 		: STD_LOGIC;
	signal Enable_bin	: STD_LOGIC;
	signal UniBin		: STD_LOGIC_VECTOR (3 downto 0);
	signal DecBin 		: STD_LOGIC_VECTOR (3 downto 0);
	signal ValorInt 	: STD_LOGIC_VECTOR (3 downto 0);
	signal Fin_Count	: STD_LOGIC;
	signal UniBin_En	: STD_LOGIC;
	signal DecBin_En	: STD_LOGIC;
	signal btn			: STD_LOGIC;
	signal Error		: STD_LOGIC;

begin
	
	DecBin_En<=Enable_Bin AND Clk1Hz;
	UniBin_En<=Clk1Hz AND NOT Fin_Count;
	
	U1 : Div1Hz
	port map (
		Clk_100MHz => ClkinMHz,
		Rst => Reset,
		Clk_1Hz => Clk1Hz
	);
	
	U2 : Div200Hz
	port map (
		Clk_100MHz => ClkinMHz,
		Rst => Reset,
		Clk_200Hz => Clk200Hz
	);
	U5 : ContUniBin
	port map (
		Rst => Reset,
		Clk => ClkinMHz,
		En => UniBin_En,
		Seg => Segundos(3 downto 0),
		Load => btn,
		TC => Enable_Bin,
		Uni_Seg=>UniBin,
		Error=>Error
	);
	U6 : ContDecBin
	port map (
		Load => btn,
		En => DecBin_En,
		Rst => Reset,
		Clk => ClkinMHz,
		Seg => Segundos(7 downto 4),
		Dec_Seg => DecBin,
		Error=>Error
	);
	U7 : SelDisplay
	port map (
		Uni => UniBin,
		Dec => DecBin,
		Sel => Clk200Hz,
		Valor => ValorInt
	);
	U8 : DecBin7Seg
	port map (
		Valor => ValorInt,
		Seg_out => Seg
	);
	U9 : SelAnodo
	port map (
		Sel => Clk200Hz,
		Anodo_out => SelAn
	);
	U10 : Ended
	port map (
		Uni => UniBin,
		Dec => DecBin,
		Fin => Fin_Count
	);
	
	U11 : Debounce_btn
	port map (
		clk => ClkinMHz,
		button  => Load,
		result  => btn
	);
	
	U12 : ErrorInput
	port map (
		Segundos => Segundos,
		Result => Error
	);
	
	Fin <= Fin_Count;

end Behavioral;

