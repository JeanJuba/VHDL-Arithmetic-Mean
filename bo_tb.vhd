-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY bo_tb IS
  END bo_tb;

  ARCHITECTURE behavior OF bo_tb IS 

		signal clk, reset, set_a, set_b, set_contador, control_sum: STD_LOGIC := '0';
		signal option_ula_a, option_ula_b, option_contador :   STD_LOGIC_VECTOR(1 downto 0); 
		signal valor_mem:  STD_LOGIC_VECTOR(7 downto 0);   
		signal buffer_a_ula : STD_LOGIC_VECTOR(7 downto 0);
		signal buffer_b_ula :  STD_LOGIC_VECTOR(7 downto 0);
		signal buffer_contador :  STD_LOGIC_VECTOR(7 downto 0);
		signal menor:  STD_LOGIC;
		
		constant clk_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: entity work.bo PORT MAP(
                  clk => clk,
						reset => reset,
						set_a => set_a, 
						set_b => set_b,
						set_contador => set_contador,
						valor_mem => valor_mem,
						control_sum => control_sum,
						option_ula_a => option_ula_a,
						option_ula_b => option_ula_b,
						option_contador => option_contador,
						buffer_a_ula => buffer_a_ula,
						buffer_b_ula => buffer_b_ula,
						buffer_contador => buffer_contador,
						menor => menor
          );

	clk_process :process
   begin
		clk <= not clk;
		wait for clk_period/2;
   end process;
	
	valor_mem <= "00000000", "00000001" after 10ns, "00000001" after 20ns, "00000010" after 40ns;
	reset <= '1', '0' after 10 ns;
	set_a <= '0', '1' after 10 ns;
	set_b <= '0', '1' after 10 ns;
	set_contador <= '0';
	control_sum  <= '0';
	option_ula_a <= "00";
	option_ula_b <= "00";
	option_contador <= "00";

  END;
