----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.GLOBAL.ALL;

entity plu is port 
		(
			CLK: 	in 	std_logic;
			DOUT:	out 	std_logic_vector( (data_bus_width - 1) downto 0 );
		); 
end counter;