----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.GLOBAL.ALL;

entity control_unit is port 
		(
			CLOCK: 			in 	std_logic;
			DATA_BUS: 		inout std_logic_vector( (data_bus_width - 1) downto 0 );
			CONTROL_BUS:	inout std_logic_vector( (control_bus_width - 1) downto 0 );
			IR: 				inout std_logic_vector( (control_bus_width - 1) downto 0 );
			MAR: 				inout std_logic_vector( (addr_bus_width - 1) downto 0 );
			MDR: 				inout	std_logic_vector( (data_bus_width - 1) downto 0 )
		); 
end control_unit;

architecture control_core of control_unit is
	
	component counter is port 
	(
		CLK: 	in 	std_logic;
		CS:	in		std_logic;
		DOUT:	out 	std_logic_vector( (addr_bus_width - 1) downto 0 )
	);
	end component;
		
	component data_path is port	
	(	
		CS: 			in 	std_logic;
		OPERAND:		in		std_logic_vector( (register_addr_width - 1) downto 0 );
		DIN: 			in 	std_logic_vector( (addr_bus_width - 1) downto 0 );	
		DOUT: 		out 	std_logic_vector( (data_bus_width - 1) downto 0 );
		CLK:			in		std_logic;
		INSTRUCTION:in		std_logic_vector( 1 downto 0)
	);
	end component;
	
	begin
	
	program_counter: counter port map 
	(
		CLK => CLOCK,
		CS => CONTROL_BUS(0),
		DOUT => MAR
	);

	alu: data_path port map
	(
		CLK => CLOCK,
		INSTRUCTION => CONTROL_BUS(2 downto 1), 
		OPERAND => CONTROL_BUS(4 downto 3),
		CS =>  CONTROL_BUS(5),
		DIN => MAR,
		DOUT => MDR
	);

end control_core;