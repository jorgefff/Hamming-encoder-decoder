
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS
	PORT (y : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
		   m : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
END decoder;

ARCHITECTURE structure of decoder is
	SIGNAL s_err : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL s_errpos : STD_LOGIC_VECTOR(14 DOWNTO 0);
	
	COMPONENT xor_gate
		PORT (a: IN  STD_LOGIC;
				b: IN  STD_LOGIC;
				q: OUT STD_LOGIC);
	END COMPONENT;
	
	-- Detects errors and gives an error code
	COMPONENT error_detect 
		PORT (y   : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
				err : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;
	
	-- Translates the error code into a position in the message
	COMPONENT error_position
		PORT (e    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				epos : OUT STD_LOGIC_VECTOR(14 DOWNTO 0));
	END COMPONENT;
	
BEGIN
	
	-- Detects errors and gives an error code
	errdet: error_detect PORT MAP(y, s_err);
	-- Translates the error code into a position in the message
	errpos: error_position PORT MAP(s_err, s_errpos);
	-- Corrects the error
	m10: xor_gate PORT MAP(s_errpos(14), y(14), m(10));
	m9:  xor_gate PORT MAP(s_errpos(13), y(13), m(9));
	m8:  xor_gate PORT MAP(s_errpos(12), y(12), m(8));
	m7:  xor_gate PORT MAP(s_errpos(11), y(11), m(7));
	m6:  xor_gate PORT MAP(s_errpos(10), y(10), m(6));
	m5:  xor_gate PORT MAP(s_errpos(9),  y(9),  m(5));
	m4:  xor_gate PORT MAP(s_errpos(8),  y(8),  m(4));
	m3:  xor_gate PORT MAP(s_errpos(7),  y(7),  m(3));
	m2:  xor_gate PORT MAP(s_errpos(6),  y(6),  m(2));
	m1:  xor_gate PORT MAP(s_errpos(5),  y(5),  m(1));
	m0:  xor_gate PORT MAP(s_errpos(4),  y(4),  m(0));
	
END structure;