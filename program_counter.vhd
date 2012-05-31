----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.GLOBAL.ALL;

entity counter is port 
		(
			CLK: 	in 	std_logic;
			CS:	in		std_logic;
			DOUT:	out 	std_logic_vector( (data_bus_width - 1) downto 0 );
		); 
end counter;

architecture counter_core of counter is
	counter_variable: std_logic_vector( (addr_bus_width - 1) downto 0 )
	
	process: counting ( CLK , CS )
	begin
		if rising_edge( CLK ) AND CS = '1' then
			DOUT <= counter_variable;
			counter_variable <= counter_variable + 1;
		end if;
		
end counter_core;