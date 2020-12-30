LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.std_logic_unsigned.ALL;
ENTITY counter10 IS

PORT(clk: IN std_logic;
	en: IN std_logic;
	rest: IN std_logic;
	cq: OUT std_logic_vector(3 DOWNTO 0);
	count: OUT std_logic);
END counter10;
ARCHITECTURE behav OF counter10 IS

BEGIN
	PROCESS(clk, rest, en)
	VARIABLE cqi: std_logic_vector(3 DOWNTO 0);
	
	BEGIN
		IF rest = '1' THEN cqi:= (OTHERS => '0');
		ELSIF clk 'EVENT AND clk = '1' THEN
			IF en='1' THEN
				IF cqi < 9 THEN cqi:= cqi + 1;
				ELSE cqi:= (OTHERS => '0');
				END IF;
				IF cqi = 9 THEN count <= '1';
				ELSE count <= '0';
				END IF;
			END IF;
		END IF;
		cq <= cqi;
	END PROCESS;
END behav;