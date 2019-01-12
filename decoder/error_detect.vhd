
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY error_detect IS
	PORT (y	 : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
		   err : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END error_detect;

ARCHITECTURE structure of error_detect is
	SIGNAL s_xor : STD_LOGIC_VECTOR(17 DOWNTO 0);
	
	COMPONENT xor_gate
		PORT (a: IN  STD_LOGIC;
				b: IN  STD_LOGIC;
				q: OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	
	xor0:  xor_gate PORT MAP(y(11), 		y(14), 		s_xor(0));
	xor1:  xor_gate PORT MAP(y(4), 		y(10), 		s_xor(1));
	xor2:  xor_gate PORT MAP(y(3),		y(12),		s_xor(2));
	xor3:  xor_gate PORT MAP(y(5),		y(6),			s_xor(3));
	xor4:  xor_gate PORT MAP(y(2),		y(13),		s_xor(4));
	xor5:  xor_gate PORT MAP(y(7),		y(8),			s_xor(5));
	xor6:  xor_gate PORT MAP(y(13),		y(14),		s_xor(6));
	xor7:  xor_gate PORT MAP(y(9),		y(12),		s_xor(7));
	xor8:  xor_gate PORT MAP(y(7),		y(10),		s_xor(8));
	xor9:  xor_gate PORT MAP(y(1),		y(6),			s_xor(9));
	xor10: xor_gate PORT MAP(y(8),		y(11),		s_xor(10));
	xor11: xor_gate PORT MAP(y(0),		y(5),			s_xor(11));
	xor12: xor_gate PORT MAP(s_xor(0),	s_xor(1),	s_xor(12));
	xor13: xor_gate PORT MAP(s_xor(2),	s_xor(3),	s_xor(13));
	xor14: xor_gate PORT MAP(s_xor(4),	s_xor(5),	s_xor(14));
	xor15: xor_gate PORT MAP(s_xor(6),	s_xor(7),	s_xor(15));
	xor16: xor_gate PORT MAP(s_xor(8),	s_xor(9),	s_xor(16));
	xor17: xor_gate PORT MAP(s_xor(10),	s_xor(11),	s_xor(17));
	xor18: xor_gate PORT MAP(s_xor(12),	s_xor(13),	err(3));
	xor19: xor_gate PORT MAP(s_xor(12),	s_xor(14),	err(2));
	xor20: xor_gate PORT MAP(s_xor(15),	s_xor(16),	err(1));
	xor21: xor_gate PORT MAP(s_xor(15),	s_xor(17),	err(0));
		
END structure;