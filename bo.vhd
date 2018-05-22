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
    Port ( clk, reset, set_sum_sub, set_counter : in STD_LOGIC;
			  option_sum_sub, option_counter : in  STD_LOGIC_VECTOR(1 downto 0); 
           acum : in  STD_LOGIC_VECTOR(7 downto 0); --o valor atual
			  val: in STD_LOGIC_VECTOR(7 downto 0);   --o valor a ser retirado de 'acum' a cada ciclo
			  acum_sum_sub : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  acum_counter : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  menor: out STD_LOGIC
			  );
end bo;

architecture Behavioral of bo is
		
	--signal temp_mux, temp_sum_sub, temp_counter, temp_sub : STD_LOGIC_VECTOR(7 downto 0);

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
	
	signal temp_sum_sub, temp_counter : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	reg_sum_sub	: reg port map (clk, reset, set_sum_sub, temp_sum_sub, acum_sum_sub);  --Registrador responsável pela soma e subtração
	reg_counter : reg port map (clk, reset, set_counter, temp_counter, acum_counter);  --Registrador que conta os itens, ele recebe set '1' até que a memória esteja vazia
	
	mux_sum_sub : mux port map (acum_sum_sub, val, acum_counter, option_sum_sub, temp_sum_sub); --deverá fazer acum + valor mem ou acum - counter
	mux_counter : mux port map (acum_counter, "00000001", "00000000", option_counter, temp_counter); --só soma o counter acumulado com +1
	
	check_men : check_menor port map (temp_sum_sub, val, menor); --checa se val é maior que o acumulado se for então menor '1'

end Behavioral;

