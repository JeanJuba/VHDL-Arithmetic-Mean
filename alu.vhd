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

s <= a + b when opt = '1' else a - b;

end Behavioral;

