LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY conb IS
PORT( rst,clk :IN std_logic;
		r,g,y,l:OUT std_logic;
	timh,timl :OUT std_logic_vector(3 DOWNTO 0));
END conb;
ARCHITECTURE com_arc OF conb IS
	TYPE rgyl IS(green,yellow,red,left);
BEGIN
	PROCESS(clk)
	VARIABLE a:std_logic;
	VARIABLE th,tl:std_logic_vector(3 DOWNTO 0);
	VARIABLE state:rgyl;
	BEGIN
	IF rst='1'THEN
		state:=red;
		a:='0';
ELSIF clk 'EVENT AND clk='1' THEN
	CASE state IS
		WHEN red=>IF a='0' THEN
			th:="0100";tl:="1001";
			a:='1';
			g<='0';r<='1';y<='0';
		ELSE
			IF NOT (th="0000" AND tl="0001")
				THEN
			IF tl="0000" THEN
				tl:="1001";th:=th-1;
			ELSE
				tl:=tl-1;
		END IF;
	ELSE
		th:="0000";tl:="0000";
		a:='0';
		state:=left;
	END IF;
END IF;
WHEN left=>IF a='0' THEN
			th:="0010";tl:="0100";
			a:='1';
			g<='0';r<='0';y<='0';l<='1';
		ELSE
			IF NOT (th="0000" AND tl="0001")
				THEN
			IF tl="0000" THEN
				tl:="1001";th:=th-1;
			ELSE
				tl:=tl-1;
		END IF;
	ELSE
		th:="0000";tl:="0000";
		a:='0';
		state:=green;
	END IF;
END IF;
WHEN green=>IF a='0'THEN
	th:="0001";tl:="1001";
	a:='1';
	g<='1';r<='0';y<='0';l<='0';
	ELSE
	IF NOT (th="0000" AND tl="0001")
		THEN
	IF tl="0000" THEN
		tl:="1001";th:=th-1;
	ELSE
        tl:=tl-1;
	END IF;
	ELSE
		th:="0000";tl:="0000";
		a:='0';
		state:=yellow;
	END IF;
END IF;
WHEN yellow=>IF a='0'THEN
		th:="0000";tl:="0100";
		a:='1';
		g<='0';r<='0';y<='1';l<='0';
	ELSE
	IF NOT (th="0000" AND tl="0001")THEN
		IF tl="0000"THEN
			tl:="1001";th:=th-1;
		ELSE
			tl:=tl-1;
	END IF;
	ELSE
		th:="0000";tl:="0000";
		a:='0';
		state:=red;
		END IF;
	END IF;
WHEN OTHERS=>state:=red;
		a:='0';
		END CASE;
	END IF;
	timh<=th;
	timl<=tl;
END PROCESS;
END com_arc;