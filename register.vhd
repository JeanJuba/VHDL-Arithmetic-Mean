library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port (	clk 	: in  STD_LOGIC;
			reset 	: in  STD_LOGIC;
			set 	: in  STD_LOGIC;   --allow the register value to change
			input 	: in STD_LOGIC_VECTOR(7 downto 0 ); --the new value to be stored
			stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --the stored value
end reg;

architecture Behavioral of reg is
	
	signal temp : STD_LOGIC_VECTOR(7  downto 0);
	
begin
process(clk, reset, set, input, stored)
begin

	if reset = '1' then
		temp <= "00000000";
		
	elsif clk'EVENT and set = '1' then-- and clk = '1'
			temp <= input;		
	end if;
end process;
	stored <= temp;

end Behavioral;

