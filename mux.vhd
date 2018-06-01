library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( --clk : in STD_LOGIC;
			  a, b	: in  STD_LOGIC_VECTOR(7 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(7 downto 0));
end mux;

architecture Behavioral of mux is

signal temp : STD_LOGIC_VECTOR(7 downto 0);
begin

	s <= a when opt = '0' else b;
	
end Behavioral;

