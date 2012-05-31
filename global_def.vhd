----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package GLOBAL is
	constant data_bus_width: integer := 4;
	constant addr_bus_width: integer := 4;
	type sequencer is (fetch,decode,execute);
end GLOBAL;