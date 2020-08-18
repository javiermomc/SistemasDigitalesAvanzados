----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:23:55 10/29/2019 
-- Design Name: 
-- Module Name:    UAR - UAR_Architecture 
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

entity UAR is
    Port ( Clk     : in   STD_LOGIC;
           Rst     : in   STD_LOGIC;
           Din     : in   STD_LOGIC;
			  Anode   : out  STD_LOGIC_VECTOR(3 downto 0);
			  Seg     : out  STD_LOGIC_VECTOR(7 downto 0));
end UAR;

architecture UAR_Architecture of UAR is

-- Embedded Singal 1bit
	signal ClkOut    : STD_LOGIC;

-- Embedded Signal +1 bit
	signal Dout : STD_LOGIC_VECTOR(7 downto 0);
	signal ShiftReg : STD_LOGIC_VECTOR (19 downto 0);
	
-- Integer constants
	constant BoardFreq    : integer := 100_000_000;
	constant DesiredFreq   : integer := 9600*2;
	constant MaxCountM    : integer := BoardFreq/DesiredFreq;
	signal Count100M    : integer range 0 to MaxCountM;
	
begin

--Frequency Divider 19,200 Hz Module
	Frequency_Divider: process(Rst, Clk)
		begin
			if (Rst = '1') then
				Count100M <= 0;
			elsif (rising_edge(Clk)) then
				if (Count100M = MaxCountM) then
					Count100M <= 0;
					ClkOut <= '1';
				else
					Count100M <= Count100M + 1;
					ClkOut <= '0';
				end if;
			end if;
		end process Frequency_Divider;
		
--Data Receiver and Catcher Module

	process (Rst,Clk)
	begin
	if (Rst = '1') then
		ShiftReg <= (others => '1');
	elsif (rising_edge(Clk)) then
		if (ClkOut = '1') then
			if (ShiftReg(0)='0') then
				Dout <= ShiftReg(16)&ShiftReg(14)&ShiftReg(12)&ShiftReg(10)&ShiftReg(8)&ShiftReg(6)&ShiftReg(4)&ShiftReg(2);
				ShiftReg <= (others => '1');
			else 
				ShiftReg <= Din & ShiftReg (19 downto 1);
			end if;
		end if;
	end if;
	end process;

-- ASCII - 7 Seg Decoder Module
 process (Dout)
  begin
    case (Dout) is 
      when x"30" => Seg <= x"C0";
      when x"31" => Seg <= x"F9";
      when x"32" => Seg <= x"A4";
      when x"33" => Seg <= x"B0";
      when x"34" => Seg <= x"99";
      when x"35" => Seg <= x"92";
      when x"36" => Seg <= x"82";
      when x"37" => Seg <= x"F8";
      when x"38" => Seg <= x"80";
      when x"39" => Seg <= x"90";
      when x"41" => Seg <= x"88";
      when x"42" => Seg <= x"83";
      when x"43" => Seg <= x"C6";
      when x"44" => Seg <= x"A1";
      when x"45" => Seg <= x"86";
      when x"46" => Seg <= x"8E";
      when others => Seg <= x"00";
    end case;
  end process;
  
 -- Anode Selector Module
  Anode <= "1110";

end UAR_Architecture;



