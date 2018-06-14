library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria is
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(7 downto 0);
           memoria_vazia : out  STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
	
	type ROM is array (0 to 5) of STD_LOGIC_VECTOR(7 downto 0); --Read only memory
	
	constant mem : ROM := ("00000010", "00000011", "11111111", "00000110", "00000010", "11111111"); --"11111111" is the stop value
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0);
	signal empty : STD_LOGIC := '0';
	
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
	
		if reset = '1' then
			empty <= '0';
			
		elsif rising_edge(clock) and enviar = '1' then 
			 mem_value <= mem(counter);	
		    counter := counter + 1; --increases counter by one			 
		end if;
		
		if mem_value = "11111111" then --checks if the value read is the stop one
			empty <= '1';
			
		else
			empty <= '0';
		end if;
	end process;
	
	valor <= mem_value; 			--sends the memory value read to the output
	memoria_vazia <= empty;

end Behavioral;

