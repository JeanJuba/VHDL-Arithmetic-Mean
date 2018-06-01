-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY bo_tb IS
  END bo_tb;

  ARCHITECTURE behavior OF bo_tb IS 

		signal clk : STD_LOGIC := '0';
		signal reset, set_acumulador, mem_read: STD_LOGIC; 
		signal valor_mem:  STD_LOGIC_VECTOR(7 downto 0);   
		signal buffer_acumulador : STD_LOGIC_VECTOR(7 downto 0);
		signal buffer_counter :  STD_LOGIC_VECTOR(7 downto 0);
		signal buffer_result :  STD_LOGIC_VECTOR(7 downto 0); 
		signal result_ready:  STD_LOGIC;
		signal resultado:  STD_LOGIC_VECTOR(7 downto 0);
		
		constant clk_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: entity work.bo PORT MAP(
			clk => clk,
			reset => reset,
 			set_acumulador => set_acumulador,
			mem_read => mem_read,
		   valor_mem => valor_mem,
		   buffer_acumulador => buffer_acumulador,
		   buffer_counter => buffer_counter,
		   buffer_result => buffer_result,
	      result_ready => result_ready,
	   	resultado => resultado
          );

	clk_process :process
   begin
		clk <= not clk;
		wait for clk_period/2;
   end process;
	
	reset <= '1', '0' after 5 ns;
	set_acumulador <= '1';
	mem_read <= '1', '0' after 70 ns;
	valor_mem <= "00000001", "00000010" after 10 ns ;-- after 10 ns "00000001";

  END;
