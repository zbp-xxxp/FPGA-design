LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
 ENTITY gate3_8 IS
  PORT(a0,a1,a2:IN std_logic;
		 y0,y1,y2,y3,y4,y5,y6,y7:OUT std_logic);
 END gate3_8;
 ARCHITECTURE ml OF gate3_8 IS
  BEGIN
  y0<=NOT a2 AND NOT a1 AND NOT a0;
  y1<=NOT a2 AND NOT a1 AND a0;
  y2<=NOT a2 AND a1 AND NOT a0;
  y3<=NOT a2 AND a1 AND a0;
  y4<=a2 AND NOT a1 AND NOT a0;
  y5<=a2 AND NOT a1 AND a0;
  y6<=a2 AND a1 AND NOT a0;
  y7<=a2 AND a1 AND a0;
END ml;