----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use WORK.GLOBAL.ALL;

entity memory_block is
	port(	ADDR: in std_logic_vector(3 downto 0);
			RW:	in	std_logic;
			CS0:	in std_logic;
			CS1:	in std_logic			);
end memory_block;

Architecture M1 of memory_block is
begin

end M1;