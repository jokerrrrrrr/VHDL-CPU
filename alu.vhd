----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use WORK.GLOBAL.ALL;

package ALU is
	function ADD(signal a,b:in std_logic_vector)return ;
	constant bus_width: integer := 4;
	type sequencer is (fetch,decode,execute);
end ALU;

package body ALU is

	function ADD(signal a,b:in std_logic_vector)return std_logic_vector is
	begin
		return a+b
		-- TODO: skal laves så den tager højde for overflow
	end ADD;
	
end ALU;
			
		