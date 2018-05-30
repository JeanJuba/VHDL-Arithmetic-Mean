LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY adder IS
PORT (a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END adder;

ARCHITECTURE behavior OF adder IS
BEGIN
	s <= a + 1;
END behavior;