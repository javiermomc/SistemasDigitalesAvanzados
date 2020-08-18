----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:25 11/06/2019 
-- Design Name: 
-- Module Name:    Traffic_lights - Behavioral 
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

entity Traffic_lights is
    Port ( Clk : in STD_LOGIC;
			  Rst : in STD_LOGIC;
			  Red : out  STD_LOGIC;
           Yellow : out  STD_LOGIC;
           Green : out  STD_LOGIC);
end Traffic_lights;

architecture Behavioral of Traffic_lights is
-- Frequency divider 4Hz module
	component DivHz
	port (
		Clk : in STD_LOGIC;
		Rst : in STD_LOGIC;
		Freq : in STD_LOGIC_VECTOR(1 downto 0);
		En : out STD_LOGIC
	);
	end component;

	signal EnHz : STD_LOGIC;
	
	-- Definition of states
	-- Declare statte as an enum type
	type state_values is (G, Y, R, RY);
	-- Embedded signal that will be holding the present and next state
	signal pres_state, next_state : state_values;
	signal Freq : STD_LOGIC_VECTOR(1 downto 0);
	
begin

	U1 : DivHz
	port map (
		Clk => Clk,
		Rst => Rst,
		Freq => Freq,
		En => EnHz
	);
	
	-- Holds the current state and changes when required
	statereg : process(Rst, Clk)
	begin
		if Rst = '1' then
			pres_state <= R;
		elsif rising_edge(Clk) then
			if EnHz = '1' then
				pres_state <= next_state;
			end if;
		end if;
	end process stateReg;
	
	-- Describes the next state logic
	-- Bubble diagram is described in VHDL here
	fsm : process(pres_state)
	begin
		case (pres_state) is 
      when R		 =>	next_state <= RY;
      when RY		 =>	next_state <= G;
      when G  		 =>	next_state <= Y;
      when others  =>	next_state <= R;
   end case;
	end process fsm;
	
	output : process(pres_state)
	begin
		case (pres_state) is 
      when R  		 =>	Red <= '1'; Yellow <= '0'; Green <= '0'; Freq<="00";
      when RY 		 =>	Red <= '1'; Yellow <= '1'; Green <= '0'; Freq<="01";
      when G  		 =>	Red <= '0'; Yellow <= '0'; Green <= '1'; Freq<="10";
      when others  =>	Red <= '0'; Yellow <= '1'; Green <= '0'; Freq<="11";
   end case;
	end process output;


end Behavioral;

