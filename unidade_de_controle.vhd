LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY unidade_de_controle IS
PORT (Reset, clock, divisao_possivel : IN STD_LOGIC;
instrucao : IN STD_LOGIC(7 DOWNTO 0);
load_a, load_b, resultado_pronto : OUT STD_LOGIC);
END unidade_de_controle;

ARCHITECTURE estrutura OF unidade_de_controle IS
	TYPE state_type IS (LEITURA, SOMANDO, DIVIDINDO, RESULTADO);
	SIGNAL state: state_type;
BEGIN
	-- Logica de proximo estado (e registrador de estado)
	PROCESS (clock, Reset)
	BEGIN
		if(Reset = '1') THEN
			state <= LEITURA;
		ELSIF (clock'EVENT AND clock = '1') THEN
			CASE state IS
				WHEN LEITURA =>
				load_a <= '1';
					load_b <= '1';
					resultado_pronto <= '0';
					divisao_possivel <= '0';				-- é necessário informar todos os sinais a cada estado?
					IF (instrucao = '11111111') THEN
						state <= DIVIDINDO;
					ELSE
						state <= SOMANDO;
					END IF;
				WHEN SOMANDO =>
					state <= LEITURA;
				WHEN DIVIDINDO =>
					load_a <= '0';
					load_b <= '0';
					resultado_pronto <= '0';
					IF (divisao_possivel = '1') THEN
						state <= DIVIDINDO;
					ELSE
						resultado_pronto <= '1';
						state <= RESULTADO;
				WHEN RESULTADO =>
					state <= LEITURA;
					load_a <= '0';
					load_b <= '0';
					resultado_pronto <= '1';
					reset <= '1';
			END CASE;
		END IF;
	END PROCESS;
END estrutura;