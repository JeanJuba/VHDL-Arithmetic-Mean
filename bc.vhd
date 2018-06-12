----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:56:53 05/16/2018 
-- Design Name: 
-- Module Name:    bc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bc is
    Port ( clock, reset : in STD_LOGIC; -- reset que inicia setado para colocar o estado em START
			  memoria_vazia : in STD_LOGIC;
			  resultado_pronto : in  STD_LOGIC; 
			  set_acumulador : out STD_LOGIC;
			  reset_acumulador : out STD_LOGIC;
			  set_counter : out STD_LOGIC;
			  reset_counter : out STD_LOGIC;
			  set_resultado : out STD_LOGIC;
			  reset_resultado : out STD_LOGIC;
			  enviar : out STD_LOGIC;
			  memoria_lida : out  STD_LOGIC -- 0 - faz nada 1 - memória lida
			  ); 
end bc;

architecture Behavioral of bc is
	type state is (START, REQUEST, CHECK_MEMORY, SUM, CHECK_MEMORY_RESULT, SUBTRACT);
	
	signal estado : state;
	
	begin

	process(clock, reset) 
	begin
		if(reset = '1') then
			estado <= START;
		elsif rising_edge(clock) then
			case estado is
			
				when START =>
					estado <= REQUEST;
					
				when REQUEST =>
					estado <= CHECK_MEMORY;

				when CHECK_MEMORY =>
					if memoria_vazia = '0' then
						estado <= SUM;
					else
						estado <= CHECK_MEMORY_RESULT;
					end if;
				
				when SUM =>
					estado <= REQUEST;	
				
				when CHECK_MEMORY_RESULT =>
					if resultado_pronto = '1' then
						estado <= START;
					else
						estado <= SUBTRACT;
					end if;
			
				when SUBTRACT =>
						estado <= CHECK_MEMORY_RESULT;
						
				end case;
		end if;
	end process;
	
	process(estado)
	begin
		case estado is
		
			when START =>
				set_acumulador <= '0';
				reset_acumulador <= '1';
				set_counter <= '0';
				reset_counter <= '1';
				set_resultado <= '0';
				reset_resultado <= '1';
				enviar <= '0';
				memoria_lida <= '0';
			
			when REQUEST =>
				set_acumulador <= '0';
				reset_acumulador <= '0';
				set_counter <= '0';
				reset_counter <= '0';
				set_resultado <= '0';
				reset_resultado <= '0';
				enviar <= '1';
				memoria_lida <= '0';

			when CHECK_MEMORY =>
				set_acumulador <= '0';
				reset_acumulador <= '0';
				set_counter <= '0';
				reset_counter <= '0';
				set_resultado <= '0';
				reset_resultado <= '0';
				enviar <= '0';
				memoria_lida <= '0';

			when SUM =>
				set_acumulador <= '1';
				reset_acumulador <= '0';
				set_counter <= '1';
				reset_counter <= '0';
				set_resultado <= '0';
				reset_resultado <= '1';
				enviar <= '0';
				memoria_lida <= '1';
				
				
			when CHECK_MEMORY_RESULT =>
				set_acumulador <= '0';
				reset_acumulador <= '0';
				set_counter <= '0';
				reset_counter <= '0';
				set_resultado <= '0';
				reset_resultado <= '0';
				enviar <= '0';
				memoria_lida <= '0';
			
			when SUBTRACT =>
				set_acumulador <= '1';
				reset_acumulador <= '0';
				set_counter <= '0';
				reset_counter <= '0';
				set_resultado <= '1';
				reset_resultado <= '0';
				enviar <= '0';
				memoria_lida <= '0';			
				
		end case;
	end process;



end Behavioral;

