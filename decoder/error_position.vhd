LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY error_position IS
	PORT (e    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);		-- Error code (in H matrix)
			epos : OUT STD_LOGIC_VECTOR(14 DOWNTO 0));	-- Error position (Position in message)
END error_position;

ARCHITECTURE logic of error_position is
	SIGNAL s_and : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	COMPONENT and_gate
		PORT (a : IN  STD_LOGIC;
				b : IN  STD_LOGIC;
				q : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
		
	and0:  and_gate PORT MAP(e(3), 		e(2), 		s_and(0));
	and1:  and_gate PORT MAP(e(1), 		e(0), 		s_and(1));
	and2:  and_gate PORT MAP(not(e(3)), e(2), 		s_and(2));
	and3:  and_gate PORT MAP(e(3), 		not(e(2)), 	s_and(3));
	and4:  and_gate PORT MAP(not(e(1)), e(0), 		s_and(4));
	and5:  and_gate PORT MAP(e(3), 		not(e(0)),	s_and(5));
	and6:  and_gate PORT MAP(e(2), 		e(1), 		s_and(6));
	and7:  and_gate PORT MAP(not(e(3)), not(e(2)), 	s_and(7));
	and8:  and_gate PORT MAP(e(2), 		e(0), 		s_and(8));
	and9:  and_gate PORT MAP(not(e(3)), not(e(1)), 	s_and(9));
	and10: and_gate PORT MAP(not(e(3)), not(e(0)), 	s_and(10));
	and11: and_gate PORT MAP(e(3), 		e(1), 		s_and(11));
	and12: and_gate PORT MAP(not(e(2)), not(e(0)), 	s_and(12));
	and13: and_gate PORT MAP(e(3), 		not(e(2)), 	s_and(13));
	and14: and_gate PORT MAP(not(e(1)), not(e(0)), 	s_and(14));
	and15: and_gate PORT MAP(not(e(3)), e(1), 		s_and(15));
	and16: and_gate PORT MAP(not(e(2)), not(e(1)), 	s_and(16));
	and17: and_gate PORT MAP(s_and(0), 	s_and(1), 	epos(14));
	and18: and_gate PORT MAP(s_and(1), 	s_and(2), 	epos(13));
	and19: and_gate PORT MAP(s_and(1), 	s_and(3), 	epos(12));
	and20: and_gate PORT MAP(s_and(0), 	s_and(4), 	epos(11));
	and21: and_gate PORT MAP(s_and(5), 	s_and(6), 	epos(10));
	and22: and_gate PORT MAP(s_and(1), 	s_and(7), 	epos(9));
	and23: and_gate PORT MAP(s_and(8), 	s_and(9), 	epos(8));
	and24: and_gate PORT MAP(s_and(6), 	s_and(10), 	epos(7));
	and25: and_gate PORT MAP(s_and(11), s_and(12), 	epos(6));
	and26: and_gate PORT MAP(s_and(4), 	s_and(13), 	epos(5));
	and27: and_gate PORT MAP(s_and(0), 	s_and(14), 	epos(4));
	and28: and_gate PORT MAP(s_and(13), s_and(14), 	epos(3));
	and29: and_gate PORT MAP(s_and(2), 	s_and(14), 	epos(2));
	and30: and_gate PORT MAP(s_and(12), s_and(15), 	epos(1));
	and31: and_gate PORT MAP(s_and(4), 	s_and(16), 	epos(0));
	
END logic;