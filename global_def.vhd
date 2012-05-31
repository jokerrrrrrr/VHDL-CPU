----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package GLOBAL is
	constant data_bus_width: 		integer := 8;
	constant addr_bus_width: 		integer := 4;
	constant control_bus_width: 	integer := 6;
	constant register_adr_width: 	integer := 2;
	constant register_addr_width: integer := 2;	
	
	type instruction is ( LOAD , STORE , ADDR , ADDM );
	ATTRIBUTE enum_encoding: STRING;
	ATTRIBUTE enum_encoding OF instruction: TYPE IS "sequential";
	
	type register_block is array (0 to (register_addr_width - 1) ) of std_logic_vector( (data_bus_width - 1) downto 0 );
	
	type ram_type is array (0 to (addr_bus_width - 1) ) of std_logic_vector( (data_bus_width - 1) downto 0 );
	
end GLOBAL;

-- Control bus:
-- 0 = increment PC and load into MAR
-- 1 = ALU IN1
-- 2 = ALU IN2
-- 3 = ALU D0
-- 4 = ALU D1
-- 5 = ALU CS
