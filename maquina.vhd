----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:45 05/21/2018 
-- Design Name: 
-- Module Name:    maquina - Behavioral 
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

entity maquina is
    Port ( clock, reset : in  STD_LOGIC;
			  buffer_a_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  buffer_b_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  buffer_contador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
           result : out  STD_LOGIC_VECTOR(7 downto 0) --the value of the division
			  );
end maquina;

architecture Behavioral of maquina is

	component memoria
    Port ( clock, reset :in STD_LOGIC;
			  valor : out  STD_LOGIC_VECTOR(7 downto 0);
           vazia : out  STD_LOGIC);
	end component;
	
	
	component bo
    Port ( clk, reset, set_a, set_b, set_contador, control_sum: in STD_LOGIC;
			  option_ula_a, option_ula_b, option_contador : in  STD_LOGIC_VECTOR(1 downto 0); 
			  valor_mem: in STD_LOGIC_VECTOR(7 downto 0);   
			  buffer_a_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  buffer_b_ula : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  buffer_contador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			  menor: out STD_LOGIC
			  );
	 end component;
	
	 component bc
    Port ( clk, reset : in STD_LOGIC; -- reset que inicia setado para colocar o estado em INICIO
			  mem_vazia : in  STD_LOGIC; -- 0 - memória ainda contem dados 1 - memória vazia
			  menor : in  STD_LOGIC;     -- ao chegar no estado  continua no estado em 1 e vai para o FIM em 0. Sinaliza se o resto da divisao ainda eh maior que o divisor
			  set_a, set_b, set_contador : out STD_LOGIC; 
			  control_sum : out STD_LOGIC; --0 para valor memória 1 para o valor do contador
			  option_ula_a, option_ula_b, option_contador : out STD_LOGIC_VECTOR(1 downto 0)); --00 - soma 01 - subtrai
	end component;
	
	
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0); --The value read from ROM
	signal empty, set_a, set_b, set_contador, control_sum, less_than : STD_LOGIC;
	signal option_ula_a, option_ula_b, option_contador : STD_LOGIC_VECTOR(1 downto 0);  --Control signal for the ALU in the Operational Block 
	
begin

	memory     : memoria port map (clock, reset, mem_value, empty); --ROM 
	op_block   : bo port map (clock, reset, set_a, set_b, set_contador, control_sum, option_ula_a, option_ula_b, option_contador, mem_value, buffer_a_ula, buffer_b_ula, buffer_contador, less_than); --Operational block
	ctrl_block : bc port map(clock, reset, empty, less_than, set_a, set_b, set_contador, control_sum, option_ula_a, option_ula_b, option_contador); --Control block

end Behavioral;

