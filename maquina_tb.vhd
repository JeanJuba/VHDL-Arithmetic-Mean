--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:06:11 05/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/calc_media_arit/maquina_tb.vhd
-- Project Name:  calc_media_arit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: maquina
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
 
ENTITY maquina_tb IS
END maquina_tb;
 
ARCHITECTURE behavior OF maquina_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    --COMPONENT maquina
    --PORT(
         --clock : IN  std_logic;
         --reset : IN  std_logic;
         --buffer_a_ula : OUT  std_logic_vector(7 downto 0);
         --buffer_b_ula : OUT  std_logic_vector(7 downto 0);
         --buffer_contador : OUT  std_logic_vector(7 downto 0);
         --result : OUT  std_logic_vector(7 downto 0)
        --);
    --END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal buffer_a_ula : std_logic_vector(7 downto 0);
   signal buffer_b_ula : std_logic_vector(7 downto 0);
   signal buffer_contador : std_logic_vector(7 downto 0);
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.maquina PORT MAP (
          clock => clock,
          reset => reset,
          buffer_a_ula => buffer_a_ula,
          buffer_b_ula => buffer_b_ula,
          buffer_contador => buffer_contador,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
	reset <= '1', '0' after 20 ns;
 

END;
