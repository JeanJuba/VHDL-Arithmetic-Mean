library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria is
    Port ( clock, reset :in STD_LOGIC;
			  valor : out  STD_LOGIC_VECTOR(7 downto 0);
           vazia : out  STD_LOGIC;
			  test  : out  STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
	
	type ROM is array (0 to 4) of STD_LOGIC_VECTOR(7 downto 0); --Read only memory
	
	constant mem : ROM := (b"00000010", b"00000110", b"00000011", b"00000000", b"11111111"); --"11111111" is the stop value
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0);
	signal empty : STD_LOGIC := '0';
	--signal waiting_to_read : STD_LOGIC := '0';
	
begin
	process(clock, reset)
		variable counter : integer := 0;
		--variable waiting_to_read : integer := 0;
	begin
	
		if reset = '1' then
			mem_value <= "11111111";
			empty <= '1';
			
		elsif clock'event and clock = '1' then -- and waiting_to_read = '0'
			--waiting_to_read <= '1';
			mem_value <= mem(counter); 	--gets the current memory value
			
			if mem_value = "11111111" then --checks if the value read is the stop one
				empty <= '1';
			else
				empty <= '0';
			end if;
			
			--if clock = '1' then
				if counter < 4 then
					counter := counter + 1; --increases counter by one
				end if;
			--end if;
			
		--elsif clock'event and  clock = '1' and waiting_to_read = '1' then
		--	waiting_to_read <= '0';
		end if;
		
	end process;
	
	valor <= mem_value; 			--sends the memory value read to the output
	vazia <= empty;
	--waiting_to_read <= waiting_to_read;
end Behavioral;

