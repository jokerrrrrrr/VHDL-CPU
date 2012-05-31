----------------------------------------------------------------------------------
-- Digitalteknik portefølje 2
-- VHDL-CPU
-- Af Kent Stark Olsen og Leon Bonde Larsen
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.Numeric_Std.all;
use WORK.GLOBAL.ALL;

entity memory_block is
	port	(	
				ADDR: in 	std_logic_vector( (addr_bus_width - 1) downto 0 );
				DIN:	in		std_logic_vector( (data_bus_width - 1) downto 0 );
				DOUT: out 	std_logic_vector( (data_bus_width - 1) downto 0 );	
				CLK:	in		std_logic;
				RW:	in		std_logic; -- 0 = read, 1 = write
				CS0:	in 	std_logic;
				CS1:	in 	std_logic
			);
end memory_block;

Architecture cell of memory_block is
	signal ram : ram_type;
begin

memory_process: process( CLK , DIN , ADDR , RW , CS0 , CS1) is
  begin
    if rising_edge( CLK ) AND CS0 = '1' AND CS1 = '1' then
		case RW is
			when '0' =>
				DOUT <= ram( conv_integer( ADDR ) );
			when '1' =>
				ram( conv_integer( ADDR ) ) <= DIN;
				DOUT <= "ZZZZZZZZ"; -- TODO: tri-state is hardcoded, should be generic	
			when others =>
				DOUT <= "ZZZZZZZZ"; -- TODO: tri-state is hardcoded, should be generic
		end case;
    end if;
 end process memory_process;
end cell;

