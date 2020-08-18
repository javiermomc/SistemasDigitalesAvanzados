----------------------------------------------------------------------------------
-- Company:        ITESM - CQ
-- Engineer:       Pollo Inc.
-- 
-- Create Date:    17:52:20 10/15/2019 
-- Design Name: 
-- Module Name:    Shift_Registers - Shift_Registers_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Several Shift Register impplementations
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

entity Shift_Registers is
    Port ( Clr  : in   STD_LOGIC;
           Clk  : in   STD_LOGIC;
			  Load : in   STD_LOGIC;
			  Din  : in   STD_LOGIC_VECTOR (7 downto 0);
           Sin  : in   STD_LOGIC;
           --Dout : out  STD_LOGIC_VECTOR (7 downto 0));
           Sout : out  STD_LOGIC);
end Shift_Registers;

architecture Shift_Registers_Arch of Shift_Registers is
  -- Embedded Signal used for the Shift Register
  signal ShiftReg : STD_LOGIC_VECTOR (7 downto 0);  
begin
  -- Implementation of a Logic Right Shift Register
--  process (Clr,Clk,ShiftReg)
--  begin
--    if (Clr = '1') then
--	   ShiftReg <= (others => '0');
--	 elsif (rising_edge(Clk)) then
--	   ShiftReg <= Sin & ShiftReg(7 downto 1);
--	 end if;
--	 Dout <= ShiftReg;
--  end process;
  
  -- Implementation of a Logic Left Shift Register
--  process (Clr,Clk,ShiftReg)
--  begin
--    if (Clr = '1') then
--	   ShiftReg <= (others => '0');
--	 elsif (rising_edge(Clk)) then
--	   ShiftReg <= ShiftReg(6 downto 0) & Sin;
--	 end if;
--	 Dout <= ShiftReg;
--  end process;
  
  -- Parallel to Serial Right Shift Register
  process(Clr,Clk,ShiftReg)
  begin
    if (Clr = '1') then
	   ShiftReg <= (others => '0');
	 elsif (rising_edge(Clk)) then
	   if (Load = '1') then
		  ShiftReg <= Din;
		else
		  ShiftReg <= Sin & ShiftReg(7 downto 1);
		end if;
	 end if;
	 Sout <= ShiftReg(0);
  end process;

end Shift_Registers_Arch;









