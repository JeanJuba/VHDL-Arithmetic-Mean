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
    Port ( reset : in STD_LOGIC; -- reset que inicia setado para colocar o estado em INICIO
			  mem_vazia : in  STD_LOGIC; -- 0 - memória ainda contem dados 1 - memória vazia
           menor : in  STD_LOGIC;  -- ao chegar no estado  continua no estado em 1 e vai para o FIM em 0. Sinaliza se o resto da divisao ainda eh maior que o divisor
           opt_sum_sub : out  STD_LOGIC_VECTOR(1 downto 0);
			  opt_counter : out  STD_LOGIC_VECTOR(1 downto 0); -- '1' para somar '0' para subtrair
			  set_reg : out STD_LOGIC);
			  
end bc;

architecture Behavioral of bc is
	type state is (INICIO, SOMA, SUBTRAI, FIM);
	
	signal estado : state;
	
	begin

	process(clk, reset) 
	begin
		if(reset = '1') then
			estado <= INICIO;
		elsif(clk'EVENT and clk ='1') then
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
					if(menor = '0') then
						estado <= SUBTRAI;
					else
						estado <= FIM;
					END IF;
				when FIM =>
					estado <= INICIO;
				
				end case;
		
		end if;
	end process;
	
	process(estado)
	begin
		case estado is
		
			when INICIO =>
				reset <= '1';
				opt_sum_sub <= "00";
				opt_counter <= "00";
				
			when SOMA =>
				reset <= '0';
				opt_sum_sub <= "01";
				opt_counter <= "01";
			when SUBTRAI =>
				reset <= '0';
				opt_sum_sub <= "10";
				opt_counter <= "11";
			
			when FIM =>
		
		end case;
		
		
	end process;



end Behavioral;

