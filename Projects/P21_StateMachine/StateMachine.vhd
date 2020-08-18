----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo
-- 
-- Create Date:    10:39:52 11/06/2019 
-- Design Name: 	 Mustang lights
-- Module Name:    StateMachine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Replicate sequential lights from the video https://youtu.be/jIjY7mERBrw
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

entity StateMachine is
    Port ( Clk 		 : in  STD_LOGIC;
           Rst 		 : in  STD_LOGIC;
           Left 		 : in  STD_LOGIC;
           Right 		 : in  STD_LOGIC;
           Hazard 	 : in  STD_LOGIC;
           LeftLight  : out  STD_LOGIC_VECTOR (2 downto 0);
			  RightLight : out  STD_LOGIC_VECTOR (0 	 to 2));
end StateMachine;

architecture Behavioral of StateMachine is

	-- Frequency divider 4Hz module
	component Div2Hz
	port (
		Clk : in STD_LOGIC;
		Rst : in STD_LOGIC;
		En : out STD_LOGIC
	);
	end component;

	signal En2Hz : STD_LOGIC;
	
	-- Definition of states
	-- Declare statte as an enum type
	type state_values is (All_Off, All_On, 
								 LeftA, LeftB, LeftC, 
								 RightA, RightB, RightC);
	-- Embedded signal that will be holding the present and next state
	signal pres_state, next_state : state_values;
	signal LRH : STD_LOGIC_VECTOR(2 downto 0);
	
begin

	U1 : Div2Hz
	port map (
		Clk => Clk,
		Rst => Rst,
		En => En2Hz
	);
	
	-- Holds the current state and changes when required
	statereg : process(Rst, Clk)
	begin
		if Rst = '1' then
			pres_state <= All_Off;
		elsif rising_edge(Clk) then
			if En2Hz = '1' then
				pres_state <= next_state;
			end if;
		end if;
	end process stateReg;
	
	-- Describes the next state logic
	-- Bubble diagram is described in VHDL here
	fsm : process(LRH, pres_state, Left, Right, Hazard)
	begin
		LRH <= Left & Right & Hazard;
		case (pres_state) is 
      when All_Off =>
         if 	LRH = "000" OR LRH = "110" then next_state<=All_Off;
			elsif 					LRH = "010" then next_state<=RightA;
			elsif 					LRH = "100" then next_state<=LeftA;
			else 											  next_state <= All_On;
			end if;
      when All_On =>	next_state <= All_Off;
      when LeftA =>	next_state <= LeftB;
      when LeftB =>	next_state <= LeftC;
      when LeftC =>	next_state <= All_Off;
      when RightA =>	next_state <= RightB;
      when RightB =>	next_state <= RightC;
      when RightC =>	next_state <= All_Off;
   end case;
	end process fsm;
	
	output : process(pres_state)
	begin
		case (pres_state) is 
      when All_Off =>	LeftLight  <= "000"; RightLight <= "000";
      when All_On =>		LeftLight  <= "111"; RightLight <= "111";
      when LeftA =>		LeftLight  <= "001"; RightLight <= "000";
      when LeftB =>		LeftLight  <= "011"; RightLight <= "000";
      when LeftC =>		LeftLight  <= "111"; RightLight <= "000";
      when RightA =>		RightLight <= "100"; LeftLight  <= "000";
      when RightB =>		RightLight <= "110"; LeftLight  <= "000";
      when RightC =>		RightLight <= "111"; LeftLight  <= "000";
   end case;
	end process output;
	
	
	
	

end Behavioral;

