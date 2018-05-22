-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

		signal clk, reset, set :  STD_LOGIC := '0';
		signal option_sum_sub, option_counter :  STD_LOGIC_VECTOR(1 downto 0); 
		signal acum :  STD_LOGIC_VECTOR(7 downto 0); --o valor atual
		signal val:  STD_LOGIC_VECTOR(7 downto 0);   --o valor a ser retirado de 'acum' a cada ciclo
		signal acum_sum_sub :  STD_LOGIC_VECTOR(7 downto 0);
		signal acum_counter :  STD_LOGIC_VECTOR(7 downto 0);
		signal menor:  STD_LOGIC;

  BEGIN

  -- Component Instantiation
          uut: entity work.bo PORT MAP(
                  clk => clk,
						reset => reset,
						set => set,
						option_sum_sub => option_sum_sub,
						option_counter => option_counter, 
						acum => acum,
						val => val,
						acum_sum_sub => acum_sum_sub,
						acum_counter => acum_counter,
						menor => menor
          );

	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	reset <= '0';
	set <= '1';
	acum <= "00000000";
	val  <= "00000001";
	acum_sum_sub <= "00000000";
	acum_counter <= "00000000";
	
	

  END;
