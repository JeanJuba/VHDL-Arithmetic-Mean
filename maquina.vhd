library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina is
    Port ( clock, reset : in  STD_LOGIC;
			--valor_memoria : out std_logic_vector (7 downto 0);
			--memoria_vazia : out std_logic;
		   --buffer_acumulador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		   --buffer_counter : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		   --buffer_resultado : BUFFER STD_LOGIC_VECTOR(7 downto 0);
			resultado_pronto : out std_logic;
			--set_acumulador : out STD_LOGIC;
			--reset_acumulador : out STD_LOGIC;
			--set_counter : out STD_LOGIC;
			--reset_counter : out STD_LOGIC;
			--set_resultado : out STD_LOGIC;
			--reset_resultado : out STD_LOGIC;
			--enviar : out STD_LOGIC;
         resultado : out  STD_LOGIC_VECTOR(7 downto 0));--the value of the division
end maquina;

architecture Behavioral of maquina is

	component memoria
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(7 downto 0);
           memoria_vazia : out  STD_LOGIC);
	end component;
	
	component bo
    Port (clk, reset, set_acumulador, reset_acumulador, set_counter, reset_counter, set_resultado, reset_resultado, memoria_lida: in STD_LOGIC;
		    valor_memoria: in STD_LOGIC_VECTOR(7 downto 0);   
		    buffer_acumulador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		    buffer_counter : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		    buffer_result : BUFFER STD_LOGIC_VECTOR(7 downto 0);
	       result_ready : out STD_LOGIC;
	   	 resultado : out STD_LOGIC_VECTOR(7 downto 0));
	 end component;
	
	 component bc
    Port ( clock, reset : in STD_LOGIC; 
			  memoria_vazia : in STD_LOGIC;
			  resultado_pronto : in  STD_LOGIC; 
			  set_acumulador : out STD_LOGIC;
			  reset_acumulador : out STD_LOGIC;
			  set_counter : out STD_LOGIC;
			  reset_counter : out STD_LOGIC;
			  set_resultado : out STD_LOGIC;
			  reset_resultado : out STD_LOGIC;
			  enviar : out STD_LOGIC;
			  memoria_lida : out  STD_LOGIC ); 
	end component;
	
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0); 
	signal enviar_valor, empty, memoria_lida : STD_LOGIC := '0'; 
	signal set_acumulador_s,   set_counter_s,   set_resultado_s : std_logic := '0';
	signal reset_acumulador_s, reset_counter_s, reset_resultado_s : std_logic := '1';
	signal less_than : STD_LOGIC := '0';
	signal b1, b2, b3 : std_logic_vector (7 downto 0);
	
begin

	memory     : memoria port map (clock, reset, enviar_valor, mem_value, empty); --ROM 
	
	ctrl_block : bc port map(clock, reset, empty, less_than, set_acumulador_s, reset_acumulador_s, set_counter_s, reset_counter_s, set_resultado_s, reset_resultado_s, enviar_valor, memoria_lida); --Control block
	
	op_block   : bo port map (clock, reset, set_acumulador_s, reset_acumulador_s, set_counter_s, reset_counter_s, set_resultado_s, reset_resultado_s,
					 memoria_lida, mem_value, b1, b2, b3, less_than, resultado); --Operational block
	 
	
	--valor_memoria <= mem_value;
	--memoria_vazia <= empty;
	--set_acumulador <= set_acumulador_s;
	--reset_acumulador <= reset_acumulador_s;
	--set_counter <= set_counter_s;
	--reset_counter <= reset_counter_s;
	--set_resultado <= set_resultado_s;
	--reset_resultado <= set_resultado_s;
	--enviar <= enviar_valor;
	resultado_pronto <= less_than;
end Behavioral;

