LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY encoder IS
	PORT (m: IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		   x: OUT STD_LOGIC_VECTOR(14 DOWNTO 0));
END encoder;

ARCHITECTURE structure of encoder is
	SIGNAL s_xor1,  s_xor2,  s_xor3,  s_xor4,
			 s_xor5,  s_xor6,  s_xor7,  s_xor8,  
			 s_xor9,  s_xor10, s_xor11, s_xor12,
			 s_xor13, s_xor14 : STD_LOGIC;
			 
	COMPONENT xor_gate
		PORT (a: IN  STD_LOGIC;
				b: IN  STD_LOGIC;
				q: OUT STD_LOGIC);
	END COMPONENT;

BEGIN
		
	xor1  : xor_gate PORT MAP (m(8),		m(10),	s_xor1);
	xor2  : xor_gate PORT MAP (m(6),		m(7),		s_xor2);
	xor3  : xor_gate PORT MAP (m(1),		m(2),		s_xor3);
	xor4  : xor_gate PORT MAP (m(4),		m(7),		s_xor4);
	xor5  : xor_gate PORT MAP (m(3),		m(6),		s_xor5);
	xor6  : xor_gate PORT MAP (m(9),		m(10),	s_xor6);
	xor7  : xor_gate PORT MAP (m(5), 	m(9),		s_xor7);
	xor8  : xor_gate PORT MAP (s_xor1,	s_xor2,	s_xor8);
	xor9  : xor_gate PORT MAP (m(0),		s_xor3, 	s_xor9);
	xor10 : xor_gate PORT MAP (s_xor4, 	s_xor5,	s_xor10);
	xor11 : xor_gate PORT MAP (m(0), 	s_xor6,	s_xor11);
	xor12 : xor_gate PORT MAP (s_xor1,	s_xor7,	s_xor12);
	xor13 : xor_gate PORT MAP (m(2), 	s_xor5,	s_xor13);
	xor14 : xor_gate PORT MAP (m(1),		s_xor4,	s_xor14);
	xor15 : xor_gate PORT MAP (s_xor8,	s_xor9, 	x(3));
	xor16 : xor_gate PORT MAP (s_xor10,	s_xor11, x(2));
	xor17 : xor_gate PORT MAP (s_xor12, s_xor13, x(1));
	xor18 : xor_gate PORT MAP (s_xor12, s_xor14, x(0));
	
	x(14 DOWNTO 4) <= m(10 DOWNTO 0);
		
END structure;