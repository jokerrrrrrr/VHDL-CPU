----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.GLOBAL.ALL;

entity main is port 
		(
			CLOCK: in std_logic
		); 
end main;

architecture computer of main is
	signal memory_request: std_logic;
	signal read_write: std_logic;
	signal addr_bus: std_logic_vector( (addr_bus_width - 1) downto 0 );
	signal data_bus: std_logic_vector( (data_bus_width - 1) downto 0 );
	signal control_bus: std_logic_vector( (control_bus_width - 1) downto 0 );	
	signal instruction_register: std_logic_vector( (control_bus_width - 1) downto 0 );
	signal memory_address_register: std_logic_vector( (addr_bus_width - 1) downto 0 );
	signal memory_data_register: std_logic_vector( (data_bus_width - 1) downto 0 );
	
	component memory_block port 
	(
		ADDR: in 	std_logic_vector( (addr_bus_width - 1) downto 0 );
		DIN:	in		std_logic_vector( (data_bus_width - 1) downto 0 );
		DOUT: out 	std_logic_vector( (data_bus_width - 1) downto 0 );	
		CLK:	in		std_logic;
		RW:	in		std_logic; 
		CS0:	in 	std_logic;
		CS1:	in 	std_logic
	);
	end component;
	
	component control_unit port 
	(
		CLOCK: 			in 	std_logic;
		DATA_BUS: 		in 	std_logic_vector( (data_bus_width - 1) downto 0 );
		CONTROL_BUS:	out 	std_logic_vector( (control_bus_width - 1) downto 0 );
		IR: 				inout std_logic_vector( (control_bus_width - 1) downto 0 );
		MAR: 				inout std_logic_vector( (addr_bus_width - 1) downto 0 );
		MDR: 				inout	std_logic_vector( (data_bus_width - 1) downto 0 )
	); 
	end component;
	
	begin
	M1: memory_block port map 
	(
		ADDR => addr_bus,
		DIN => data_bus,
		DOUT => data_bus,
		CLK => CLOCK,
		RW => read_write,
		CS0 => memory_request,
		CS1 => NOT addr_bus(3)
	);

	M2: memory_block port map
	(
		ADDR => addr_bus,
		DIN => data_bus,
		DOUT =>  data_bus,
		CLK => CLOCK,
		RW => read_write,
		CS0 => memory_request,
		CS1 => addr_bus(3)
	);
	
	CU: control_unit port map 
	(
		CLOCK => CLOCK,
		DATA_BUS => data_bus,
		CONTROL_BUS => control_bus,
		IR => instruction_register,
		MAR => memory_address_register,
		MDR => memory_data_register
	);
	
end computer;