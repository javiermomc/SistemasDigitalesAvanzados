----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- 
-- Create Date:    11:18:21 10/16/2019 
-- Design Name: 	 Serial_Comm_Nexys3_To_PC
-- Module Name:    Serial_Comm_Nexys3_To_PC - Serial_Comm_Nexys3_To_PC_Arch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	 Serial communication from Nexys 3 board to PC
--						 Every time the center Pushbutton is pressed
--						 the ASCII character given by the switches
--						 will be transmitted serially to a PC
--						 Settings:
--							Baud Rate: 9600 bits per second (bps)
--							Data Size: 8 bits
--							Paritry: None
--							Stop bits: 1 bit
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

entity Serial_Comm_Nexys3_To_PC is
    Port ( ASCII  : in  STD_LOGIC_VECTOR (7 downto 0);
           Rst 	: in  STD_LOGIC;
           Clk 	: in  STD_LOGIC;
           Load 	: in  STD_LOGIC;
           Tx 		: out  STD_LOGIC);
end Serial_Comm_Nexys3_To_PC;

architecture Serial_Comm_Nexys3_To_PC_Arch of Serial_Comm_Nexys3_To_PC is

-- Embedded Signal used for the Shift Register
  signal ClkOut : STD_LOGIC; 
  signal ShiftReg : STD_LOGIC_VECTOR (10 downto 0); 
constant StartBit : STD_LOGIC := '0';  
constant StopBit : STD_LOGIC := '1'; 
constant IdleBit : STD_LOGIC := '1'; 
constant SecurityBit : STD_LOGIC := '1'; 

-- Embedded Signal used for the Frequency divider
constant BoardFreq    : integer := 100_000_000;
constant Baud   : integer := 9600;
constant MaxCountM    : integer := BoardFreq/Baud;
signal Count    : integer range 0 to MaxCountM;

begin

--Enables a 9600Hz signal
	Frequency_Divider: process(Rst, Clk)
		begin
			if (Rst = '1') then
				Count <= 0;
			elsif (rising_edge(Clk)) then
				if (Count = MaxCountM) then
					Count <= 0;
					ClkOut <= '1';
				else
					Count <= Count + 1;
					ClkOut <= '0';
				end if;
			end if;
		end process Frequency_Divider;

-- Parallel to Serial Right Shift Register
  process(Rst,Clk,ShiftReg)
  begin
    if (Rst = '1') then
	   ShiftReg <= (others => '1');
	 elsif (rising_edge(Clk)) then
		if ClkOut = '1' then
			if (Load = '1') then
			  ShiftReg <= Stopbit & ASCII & StartBit & SecurityBit;
			else
			  ShiftReg <= IdleBit & ShiftReg(10 downto 1);
			end if;
		end if;
	 end if;
	 Tx <= ShiftReg(0);
  end process;

end Serial_Comm_Nexys3_To_PC_Arch;

