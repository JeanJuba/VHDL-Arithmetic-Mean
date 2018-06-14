LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY maquina_tb IS
END maquina_tb;
 
ARCHITECTURE behavior OF maquina_tb IS 

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic;

 	--Outputs
	--signal valor_memoria : std_logic_vector(7 downto 0);
	--signal memoria_vazia, enviar : std_logic;
   --signal buffer_acumulador : std_logic_vector(7 downto 0);
   --signal buffer_counter : std_logic_vector(7 downto 0);
   --signal buffer_resultado : std_logic_vector(7 downto 0);
	signal resultado_pronto : std_logic;
	--signal set_acumulador,   set_counter,   set_resultado : std_logic := '0';
	--signal reset_acumulador, reset_counter, reset_resultado : std_logic := '1';
	signal resultado : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.maquina PORT MAP (
          clock => clock,
          reset => reset,
			 --valor_memoria => valor_memoria,
			 --memoria_vazia => memoria_vazia,
          --buffer_acumulador => buffer_acumulador,
          --buffer_counter    => buffer_counter,
          --buffer_resultado  => buffer_resultado,
			 resultado_pronto => resultado_pronto,
			 --set_acumulador => set_acumulador,
			 --reset_acumulador => reset_acumulador,
			 --set_counter => set_counter,
			 --reset_counter => reset_counter,
			 --set_resultado => set_resultado,
			 --reset_resultado => reset_resultado,
			 --enviar => enviar,
          resultado => resultado
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
	reset <= '1', '0' after 5 ns;
 

END;
