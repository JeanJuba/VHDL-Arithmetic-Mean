--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:23 05/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/calc_media_arit/bc_tb.vhd
-- Project Name:  calc_media_arit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bc_tb IS
END bc_tb;
 
ARCHITECTURE behavior OF bc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    --COMPONENT bc
    --PORT(
         --clk : IN  std_logic;
         --reset : IN  std_logic;
         --mem_vazia : IN  std_logic;
         --menor : IN  std_logic;
         --set_a : OUT  std_logic;
         --set_b : OUT  std_logic;
         --set_contador : OUT  std_logic;
         --control_sum : OUT  std_logic;
         --option_ula_a : OUT  std_logic_vector(1 downto 0);
         --option_ula_b : OUT  std_logic_vector(1 downto 0);
         --option_contador : OUT  std_logic_vector(1 downto 0)
        --);
    --END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal mem_vazia : std_logic := '0';
   signal result_ready : std_logic := '0';
	signal set_acumulador : std_logic := '0';

 	--Outputs
   signal mem_read : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.bc PORT MAP (
          clk => clk,
			 reset => reset, -- reset que inicia setado para colocar o estado em INICIO
			  mem_vazia => mem_vazia,
			  result_ready => result_ready,
			  set_acumulador => set_acumulador,
			  mem_read => mem_read
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

  

END;
