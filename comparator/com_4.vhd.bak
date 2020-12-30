LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
ENTITY com_4 IS
	PORT(a,b: IN std_logic_vector(3 DOWNTO 0);
		y3,y2,y1: OUT std_logic);
END;
ARCHITECTURE ml OF com_4 IS
BEGIN
PROCESS(a,b)
	BEGIN
		IF a>b THEN y1<='1';y2<='0';y3<='0';
		   ELSIF a=b THEN y1<='0';y2<='1';y3<='0';
		   ELSE y1<='0';y2<='0';y3<='1';
		END IF;
	END PROCESS;
END;