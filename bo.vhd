----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:53 05/15/2018 
-- Design Name: 
-- Module Name:    bo - Behavioral 
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

entity bo is
    Port ( clk, reset, set_a, set_b, control_sul: in STD_LOGIC;
			  option_ula_a, option_ula_b : in  STD_LOGIC_VECTOR(1 downto 0); 
			  acum : in  STD_LOGIC_VECTOR(7 downto 0); --o valor atual
			  valor_mem: in STD_LOGIC_VECTOR(7 downto 0);   --o valor a ser retirado de 'acum' a cada ciclo
			  buffer_a_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  buffer_b_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  menor: out STD_LOGIC
			  );
end bo;

architecture Behavioral of bo is
		
	--signal temp_mux, signal_ula_a, signal_ula_b, temp_sub : STD_LOGIC_VECTOR(7 downto 0);

	component reg 
    Port ( clk : in  STD_LOGIC;   --clock
           reset : in  STD_LOGIC; --reset o valor do buffer
           set : in  STD_LOGIC;   --seta o valor do buffer com o valor do mux
		   input : in STD_LOGIC_VECTOR(7 downto 0 ); --a entrada que será somada ou subtraída ao valor
           valor : BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --o valor armazenado
	end component;
	
	component mux 
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
		   c : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC_VECTOR(1 downto 0); -- 0 soma 1 subtracao 
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end component;
	
	component check_menor 
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC);
end component;
	
	signal signal_ula_a, signal_ula_b, mux_out : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	registrador_a : reg port map (clk, reset, set_a, signal_ula_a, buffer_a_ula);  --Registrador responsável pela soma e subtração
	registrador_b : reg port map (clk, reset, set_b, signal_ula_b, buffer_b_ula);  --Registrador que conta os itens, ele recebe set '1' até que a memória esteja vazia
	--falta registrador que conta número de divisões
	
	mux_mem_b : mux port map (valor_mem, buffer_b_ula, control_sum, mux_out);
	
	alu_a : alu port map (buffer_a_ula,    mux_out, option_ula_a, signal_ula_a); --deverá fazer acum + valor mem ou acum - counter
	alu_b : alu port map (buffer_b_ula, "00000001", option_ula_b, signal_ula_b); --só soma o counter signal_ula_a com +1
	
	compare : comparator port map (signal_ula_a, signal_ula_b, menor); --checa se valor_mem é maior que o signal_ula_a se for então menor '1'

end Behavioral;

