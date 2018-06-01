library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bo is
    Port ( clk, reset, set_acumulador, mem_read: in STD_LOGIC;
		   valor_mem: in STD_LOGIC_VECTOR(7 downto 0);   
		   buffer_acumulador : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		   buffer_counter : BUFFER STD_LOGIC_VECTOR(7 downto 0);
		   buffer_result : BUFFER STD_LOGIC_VECTOR(7 downto 0);
	      result_ready : out STD_LOGIC;
	   	resultado : out STD_LOGIC_VECTOR(7 downto 0)
			  );
end bo;

architecture Behavioral of bo is
		
	--signal temp_mux, signal_acumulador, signal_ula_b, temp_sub : STD_LOGIC_VECTOR(7 downto 0);

	component reg 
    Port ( clk : in  STD_LOGIC;   --clock
           reset : in  STD_LOGIC; --reset o valor do buffer
           set : in  STD_LOGIC;   --seta o valor do buffer com o valor do mux
		     input : in STD_LOGIC_VECTOR(7 downto 0 ); --a entrada que será somada ou subtraída ao valor
           stored : BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --o valor armazenado
	end component;
	
	component alu 
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC; -- 0 subtracao  1 soma para poder usar o mem_read
           s : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component mux 
    Port ( 
			  a : in  STD_LOGIC_VECTOR(7 downto 0);
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
	signal not_mem_read, compare_zero_out, compare_out, compare_or_out : STD_LOGIC;
begin
	
	negador : not_logic port map (mem_read, not_mem_read);
	
	registrador_acumulador: reg port map (clk, reset , set_acumulador, signal_acumulador , buffer_acumulador);  --Registrador responsável pelo valor acumulado da soma e subtração
	registrador_counter   : reg port map (clk, reset, mem_read     , adder_out_c, buffer_counter);  --Registrador que conta os itens
	registrador_result    : reg port map (clk, reset, not_mem_read , adder_out_r, buffer_result);   --Registra o número de divisões bem sucedidas
	
	mux_counter_mem    : mux port map (buffer_counter, valor_mem      , mem_read, mux_counter_mem_out);    --mem_read = 0 counter mem_read = 1 memory value
	--mux_result_counter : mux port map (buffer_result , buffer_counter , mem_read, mux_result_counter_out); --mem_read = 0 envia contador de divisoes, mem_read = 1 envia contador de valores de memoria
	
	alu_acumulador : alu port map (buffer_acumulador, mux_counter_mem_out, mem_read, signal_acumulador); --deverá fazer acum + valor mem ou acum - counter
	add_counter        : adder port map (buffer_counter, adder_out_c); --Adiciona 1 ao valor do counter de valores ou de divisões sendo isso definido pelo mux
	add_result         : adder port map (buffer_result, adder_out_r);
	
	compare_zero : comparator_zero port map (buffer_counter   , compare_zero_out);
	compare      : comparator 	   port map (buffer_acumulador, buffer_counter   , compare_out);
	compare_or   : comparator_or   port map (compare_out      , compare_zero_out , result_ready);
	
	resultado <= buffer_result;
end Behavioral;

