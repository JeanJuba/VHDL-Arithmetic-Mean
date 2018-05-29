----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:24:44 05/22/2018 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC_VECTOR(1 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Behavioral of alu is
	signal temp : STD_LOGIC_VECTOR(7 downto 0);
begin
process(opt, a, b)
begin 
	case opt is
	
	when "00" =>     --soma
		temp <=  a + b;
	
	when "01" =>     --subtrai
		temp <= a - b;
	
	when others =>   --faz nada
		temp <= a;
	
	end case;

end process;

s <= temp;
end Behavioral;

