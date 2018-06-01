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
    Port ( clk, reset : in STD_LOGIC; -- reset que inicia setado para colocar o estado em INICIO
			  mem_vazia : in STD_LOGIC;
			  result_ready : in  STD_LOGIC; 
			  set_acumulador : out STD_LOGIC;
			  mem_read : out  STD_LOGIC -- 0 - faz nada 1 - memória lida
			  ); 
end bc;

architecture Behavioral of bc is
	type state is (INICIO, SOMA, SUBTRAI);
	
	signal estado : state;
	
	begin

	process(clk, reset, mem_vazia) 
	begin
		if(reset = '1') then
			estado <= INICIO;
		elsif clk'EVENT and clk ='1' then
			case estado is
			
				when INICIO =>
					estado <= SOMA;
						
				when SOMA =>
					if(mem_vazia = '0') then
						estado <= SOMA;
					else 
						estado <= SUBTRAI;
					end if;
	
				when SUBTRAI =>
					if(result_ready = '0') then
						estado <= SUBTRAI;
					else
						estado <= INICIO;
					END IF;
				end case;
		end if;
	end process;
	
	process(estado)
	begin
		case estado is
		
			when INICIO =>
				set_acumulador <= '0';
				
			when SOMA =>
				set_acumulador <= '1';
				mem_read <= '1';
				
			when SUBTRAI =>
				mem_read <= '0';				
				
		end case;
		
		
	end process;



end Behavioral;

