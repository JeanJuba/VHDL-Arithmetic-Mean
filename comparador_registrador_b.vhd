LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY comparador_registrador_b IS
	PORT (
		b: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		zero : OUT STD_LOGIC
	);
END comparador_registrador_b;

ARCHITECTURE estrutura OF comparador_registrador_b IS
BEGIN
	zero <= '1' WHEN b = 0 ELSE '0';
END estrutura;