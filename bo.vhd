library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bo is
    Port (clk, reset, set_acumulador, reset_acumulador, set_counter, reset_counter, set_resultado, reset_resultado, memoria_lida: in STD_LOGIC;
		    valor_memoria: in STD_LOGIC_VECTOR(7 downto 0);   
		    buffer_acumulador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		    buffer_counter : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		    buffer_result : BUFFER STD_LOGIC_VECTOR(7 downto 0);
	       result_ready : out STD_LOGIC;
	   	 resultado : out STD_LOGIC_VECTOR(7 downto 0)
			  );
end bo;

architecture Behavioral of bo is

	component reg 
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --the stored value
	end component;
	
	component alu 
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC; 
           s : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component mux 
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component comparator
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC);
	end component;
	
	component comparator_zero
	port (
		input	: in STD_LOGIC_VECTOR(7 downto 0);
		zero: out STD_LOGIC
	);
	end component;
	
	component comparator_or 
	port (
		a, b: in STD_LOGIC;
		s: out STD_LOGIC
	);
	end component;
	
	component adder
	port ( a: in STD_LOGIC_VECTOR(7 downto 0);
			 s : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component not_logic
    Port ( a : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;

	
	signal signal_acumulador, mux_counter_mem_out, mux_result_counter_out, adder_out_c, adder_out_r : STD_LOGIC_VECTOR(7 downto 0) :=  "00000000";
	signal not_memoria_lida, compare_zero_out, compare_out, compare_or_out : STD_LOGIC;
begin
		
	registrador_acumulador : reg port map (clk, set_acumulador,  reset_acumulador, signal_acumulador , buffer_acumulador);  --Registrador responsável pelo valor acumulado da soma e subtração
	registrador_counter   :  reg port map (clk,  set_counter,     reset_counter, adder_out_c, buffer_counter);  --Registrador que conta os itens
	registrador_result    :  reg port map (clk,  set_resultado,   reset_resultado, adder_out_r, buffer_result);   --Registra o número de divisões bem sucedidas
	 
	mux_counter_mem    : mux port map (buffer_counter, valor_memoria, memoria_lida, mux_counter_mem_out); 
		
	alu_acumulador     : alu port map (buffer_acumulador, mux_counter_mem_out, memoria_lida, signal_acumulador); --deverá fazer acum + valor mem ou acum - counter
	add_counter        : adder port map (buffer_counter, adder_out_c); --Adiciona 1 ao valor do counter de valores ou de divisões sendo isso definido pelo mux
	add_result         : adder port map (buffer_result, adder_out_r);  --Adiciona 1 ao valor do counter de divisões possíveis
	
	--compare_zero : comparator_zero port map (buffer_counter   , compare_zero_out);
	compare      : comparator 	   port map (buffer_acumulador, buffer_counter   , result_ready);
	--compare_or   : comparator_or   port map (compare_out      , compare_zero_out , result_ready);
	
	resultado <= buffer_result;
	
end Behavioral;

