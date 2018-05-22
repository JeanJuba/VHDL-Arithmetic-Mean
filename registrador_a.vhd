LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY registrador_a IS
	PORT (
		clock, load_registrador_a, reset : IN STD_LOGIC;
		dispatch : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		a : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END registrador_a;

ARCHITECTURE estrutura OF registrador_a IS
BEGIN
	PROCESS(clock, reset)
	BEGIN
		IF(reset = '1') THEN
			a <= "00000000";
		ELSIF(clock'EVENT AND clock = '1' AND load_registrador_a = '1') THEN
			a <= dispatch;
		END IF;
	END PROCESS;
END estrutura;