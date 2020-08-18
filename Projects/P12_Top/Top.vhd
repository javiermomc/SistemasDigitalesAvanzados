----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:26 10/02/2019 
-- Design Name: 
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
    Port ( Reset : in  STD_LOGIC;
			  Clk100MHz : in STD_LOGIC;
			  SelBinDec : in	 STD_LOGIC;
           Seg : out  STD_LOGIC_VECTOR (7 downto 0);
           SelAn : out  STD_LOGIC_VECTOR (3 downto 0));
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
	
	-- Counts the units
	
	component ContUniSeg
	port (
		Rst : in STD_LOGIC;
		Clk_1Hz : in STD_LOGIC;
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		TC : out STD_LOGIC);
	end component;
	
	-- Counts the tens
	
	component ContDecSeg
	port (
		En : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk_1Hz : in STD_LOGIC;
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Counts the units in binary
	
	component ContUniBin
	port (
		Rst : in STD_LOGIC;
		Clk_1Hz : in STD_LOGIC;
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		TC : out STD_LOGIC);
	end component;
	
	-- Counts the tens in binary
	
	component ContDecBin
	port (
		En : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Clk_1Hz : in STD_LOGIC;
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Gives select between decimal and binary
	
	component SelBase
	port (
		Uni_Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Dec : in STD_LOGIC_VECTOR (3 downto 0);
		Uni_Bin : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Bin : in STD_LOGIC_VECTOR (3 downto 0);
		Sel : in STD_LOGIC;
		Uni_Seg : out STD_LOGIC_VECTOR (3 downto 0);
		Dec_Seg : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Gives the value synthesized
	
	component SelDisplay
	port (
		Uni_Seg : in STD_LOGIC_VECTOR (3 downto 0);
		Dec_Seg : in STD_LOGIC_VECTOR (3 downto 0);
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
	
	-- Signal declaration
	signal Clk1Hz 		: STD_LOGIC;
	signal Clk200Hz 	: STD_LOGIC;
	signal Enable 		: STD_LOGIC;
	signal Enable_Bin	: STD_LOGIC;
	signal UniDec 		: STD_LOGIC_VECTOR (3 downto 0);
	signal DecDec 		: STD_LOGIC_VECTOR (3 downto 0);
	signal UniBin		: STD_LOGIC_VECTOR (3 downto 0);
	signal DecBin 		: STD_LOGIC_VECTOR (3 downto 0);
	signal UniSeg 		: STD_LOGIC_VECTOR (3 downto 0);
	signal DecSeg 		: STD_LOGIC_VECTOR (3 downto 0);
	signal ValorInt 	: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Component Instantiation
	U1 : Div1Hz
	port map (
		Clk_100MHz => Clk100MHz,
		Rst => Reset,
		Clk_1Hz => Clk1Hz
	);
	U2 : Div200Hz
	port map (
		Clk_100MHz => Clk100MHz,
		Rst => Reset,
		Clk_200Hz => Clk200Hz
	);
	U3 : ContUniSeg
	port map (
		Rst => Reset,
		Clk_1Hz => Clk1Hz,
		Uni_Seg => UniDec,
		TC => Enable
	);
	U4 : ContDecSeg
	port map (
		En => Enable,
		Rst => Reset,
		Clk_1Hz => Clk1Hz,
		Dec_Seg => DecDec
	);
	U5 : ContUniBin
	port map (
		Rst => Reset,
		Clk_1Hz => Clk1Hz,
		Uni_Seg => UniBin,
		TC => Enable_Bin
	);
	U6 : ContDecBin
	port map (
		En => Enable_Bin,
		Rst => Reset,
		Clk_1Hz => Clk1Hz,
		Dec_Seg => DecBin
	);
	U7 : SelDisplay
	port map (
		Uni_Seg => UniSeg,
		Dec_Seg => DecSeg,
		Sel => Clk200Hz,
		Valor => ValorInt
	);
	U8 : SelBase
	port map (
		Uni_Dec => UniDec,
		Dec_Dec => DecDec,
		Uni_Bin => UniBin,
		Dec_Bin => DecBin,
		Sel => SelBinDec,
		Uni_Seg => UniSeg,
		Dec_Seg => DecSeg
	);
	U9 : DecBin7Seg
	port map (
		Valor => ValorInt,
		Seg_out => Seg
	);
	U10 : SelAnodo
	port map (
		Sel => Clk200Hz,
		Anodo_out => SelAn
	);
	
end Behavioral;

