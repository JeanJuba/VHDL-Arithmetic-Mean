----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:16 05/26/2018 
-- Design Name: 
-- Module Name:    memoria - Behavioral 
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

entity memoria is
    Port ( clock, reset :in STD_LOGIC;
			  valor : out  STD_LOGIC_VECTOR(7 downto 0);
           vazia : out  STD_LOGIC);
end memoria;

architecture Behavioral of memoria is
	
	type ROM is array (0 to 4) of STD_LOGIC_VECTOR(7 downto 0); --Read only memory
	
	constant mem : ROM := (b"00000000", b"00000001", b"00000010", b"00000011", b"11111111"); --"11111111" is the stop value
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
	
		if reset = '1' then
			valor <= "11111111";
			vazia <= '1';
			
		elsif clock'event and clock = '1' then
			mem_value <= mem(counter); 	--gets the current memory value
			
			if mem_value = "11111111" then --checks if the value read is the stop one
				vazia <= '1';
			else
				vazia <= '0';
			end if;
			
			valor <= mem_value; 			--sends the memory value read to the output
			if counter < 4 then
				counter := counter + 1; --increases counter by one
			end if;
		else
			valor <= "11111111";
			vazia <= '0';
		end if;
	end process;
end Behavioral;

