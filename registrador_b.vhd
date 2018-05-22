LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY registrador_b IS
	PORT (
		clock, load_registrador_b, reset : IN STD_LOGIC;
		dispatch : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		b : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END registrador_b;

ARCHITECTURE estrutura OF registrador_b IS
BEGIN
	PROCESS(clock, reset)
	BEGIN
		IF(reset = '1') THEN
			b <= "00000000";
		ELSIF(clock'EVENT AND clock = '1' AND load_registrador_b = '1') THEN
			b <= dispatch;
		END IF;
	END PROCESS;
END estrutura;