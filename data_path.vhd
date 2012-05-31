----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.GLOBAL.ALL;

entity data_path is
	port	(	
				CS: 			in 	std_logic;
				OPERAND:		in		std_logic_vector( (register_addr_width - 1) downto 0 );
				DIN: 			in 	std_logic_vector( (addr_bus_width - 1) downto 0 );	
				DOUT: 		out 	std_logic_vector( (data_bus_width - 1) downto 0 );
				CLK:			in		std_logic;
				INSTRUCTION:in		std_logic_vector( 1 downto 0)
			);
end data_path;

Architecture implement of data_path is
		signal latched_operand: std_logic_vector( (data_bus_width - 1) downto 0 );
		signal registers : register_block;
	
begin

alu: process( CLK , CS , OPERAND , INSTRUCTION , DIN ) is
  begin
    if rising_edge( CLK ) AND CS = '1' then
      case INSTRUCTION is
			when "00" =>
			   -- latch OPERAND
				latched_operand <= registers( conv_integer( OPERAND ) ); 
			when "01" =>
			   --add latched operand to OPERAND
				latched_operand <= latched_operand + registers( conv_integer( OPERAND ) );
			when "10" =>
				--put OPERAND on DOUT
				DOUT <= registers( conv_integer( OPERAND ) );
			when "11" =>
				--set OPERAND to DIN
				registers( conv_integer( OPERAND ) )(7 downto 4) <= DIN;
			when others =>
      end case;
    end if;
 end process alu;
end implement;

			
		