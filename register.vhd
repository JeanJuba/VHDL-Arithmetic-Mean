----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:56:05 05/15/2018 
-- Design Name: 
-- Module Name:    register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( clk : in  STD_LOGIC;   --clock
           reset : in  STD_LOGIC; --reset o valor do buffer
           set : in  STD_LOGIC;   --seta o valor do buffer com o valor do mux
			  input : in STD_LOGIC_VECTOR(7 downto 0 ); --a entrada que será somada ou subtraída ao valor
           valor : BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --o valor armazenado
end reg;

architecture Behavioral of reg is
	
	signal temp : STD_LOGIC_VECTOR(7  downto 0);
	
begin
process(clk, reset, set, input, valor)
begin

	if reset = '1' then
		temp <= "00000000";
		
	elsif clk'EVENT and clk = '1' and set = '1' then
			temp <= input;		
	end if;
end process;
	valor <= temp;

end Behavioral;

