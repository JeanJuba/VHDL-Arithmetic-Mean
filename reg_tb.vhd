--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:43 05/28/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/calc_media_arit/reg_tb.vhd
-- Project Name:  calc_media_arit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg
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
 
ENTITY reg_tb IS
END reg_tb;
 
ARCHITECTURE behavior OF reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    --COMPONENT reg
    --PORT(
         --clk : IN  std_logic;
         --reset : IN  std_logic;
         --set : IN  std_logic;
         --input : IN  std_logic_vector(7 downto 0);
         --valor : OUT  std_logic_vector(7 downto 0)
        --);
    --END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal set : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal valor : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.reg PORT MAP (
          clk => clk,
          reset => reset,
          set => set,
          input => input,
          valor => valor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	
	reset <= '1', '0' after 20 ns;--, '1' after 60 ns, '0' after 80 ns;
	set <= '0', '1' after 20 ns;
	input <= "00010000", "11111111" after 80 ns;
 
 

END;
