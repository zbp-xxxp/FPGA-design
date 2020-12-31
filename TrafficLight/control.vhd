LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY control IS
PORT (rst,clk: IN std_logic;
	r1,g1,y1,l1:OUT std_logic;
	timh1,timl1:OUT std_logic_vector(3 DOWNTO 0);
r2,g2,y2,l2: OUT std_logic;
timh2,timl2: OUT std_logic_vector(3 DOWNTO 0));
END;
ARCHITECTURE m1 OF control IS
COMPONENT cona IS 
PORT(rst,clk:IN std_logic;
r,g,y,l: OUT std_logic;
timh,timl: OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT ;
COMPONENT conb IS
PORT(rst,clk: IN std_logic;
r,g,y,l: OUT std_logic;
timh,timl: OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT;
BEGIN
u1:cona PORT MAP (rst=>rst,clk=>clk,r=>r1,g=>g1,
y=>y1,l=>l1,timh=>timh1,timl=>timl1);
u2:conb PORT MAP (rst=>rst,clk=>clk,r=>r2,g=>g2,
y=>y2,l=>l2,timh=>timh2,timl=>timl2);
END;