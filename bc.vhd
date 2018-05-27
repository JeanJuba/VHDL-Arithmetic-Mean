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
			  mem_vazia : in  STD_LOGIC; -- 0 - memória ainda contem dados 1 - memória vazia
			  menor : in  STD_LOGIC;     -- ao chegar no estado  continua no estado em 1 e vai para o FIM em 0. Sinaliza se o resto da divisao ainda eh maior que o divisor
			  set_a, set_b, set_contador : out STD_LOGIC; 
			  control_sum : out STD_LOGIC; --0 para valor memória 1 para o valor do contador
			  option_ula_a, option_ula_b, option_contador : out STD_LOGIC_VECTOR(1 downto 0)); --00 - soma 01 - subtrai
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
				set_a <= '0';
				set_b <= '0';
				set_contador <= '0';
				control_sum <= '0';
				option_ula_a <= "00";
				option_ula_b <= "00";
				option_contador <= "00";
			when SOMA =>
				set_a <= '1';
				set_b <= '1';
				set_contador <= '0';
				control_sum <= '0'; -- 0, pois é o sinal da memória que deve ir do mux_mem_b para a ula_a
				option_ula_a <= "00"; --00, pois a ula_a deve somar o valor atual com o valor vindo do mux_mem_b
				option_ula_b <= "00"; --00, pois a ula_b deve somar o número de dados lidos com +1
				option_contador <= "00"; --não está sendo usado já que o registrador de número de divisões não é usado na soma
			when SUBTRAI =>
				set_a <= '1';
				set_b <= '0';
				set_contador <= '1';
				control_sum <= '1';
				option_ula_a <= "00";
				option_ula_b <= "00";
				option_contador <= "00";
			
			when FIM =>
		
		end case;
		
		
	end process;



end Behavioral;

