library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           opt : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Behavioral of alu is
	signal temp : STD_LOGIC_VECTOR(7 downto 0);
begin
process(opt, a, b)
begin
	case opt is
	
	when '1' =>     --sum
		temp <=  a + b;
	
	when '0' =>     --sub
		temp <= a - b;
	
	when others => 
		temp <= a + b;
	
	end case;

end process;

s <= temp;

end Behavioral;

