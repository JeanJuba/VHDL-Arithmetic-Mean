LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
PORT (	Reset, clock, result_ready, operation_end : IN STD_LOGIC;
		instruction_in : IN STD_LOGIC(7 DOWNTO 0);
		instruction_out : OUT STD_LOGIC(7 DOWNTO 0);
		mem_read : OUT STD_LOGIC);
END control_unit;

ARCHITECTURE estrutura OF control_unit IS
	TYPE state_type IS (READING, ADDING, DIVIDING, RESULT);
	SIGNAL state: state_type;
BEGIN
	-- Logica de proximo estado (e registrador de estado)
	PROCESS (clock, Reset, instruction, result_ready)
	BEGIN
		if(Reset = '1') THEN
			state <= READING;
		ELSIF (clock'EVENT AND clock = '1') THEN
			CASE state IS
				WHEN READING =>
					mem_read <= '1';
					instruction_out <= instruction_in
					IF (instruction = "11111111") THEN
						state <= DIVIDING;
					ELSE
						state <= ADDING;
					END IF;
				WHEN ADDING =>
					IF (result_ready = '1') THEN
						state <= RESULT;
					ELSE
						state <= READING;
				WHEN DIVIDING =>
					mem_read <= '0';
					IF (result_ready = '1') THEN
						state <= RESULT;
					ELSE
						state <= DIVIDING;
					END IF;
				WHEN RESULT =>
					state <= READING;
					result_ready <= '0';
					reset <= '1';
			END CASE;
		END IF;
	END PROCESS;
END estrutura;
