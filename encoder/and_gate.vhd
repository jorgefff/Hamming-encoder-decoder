LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and_gate IS
	PORT (a: IN  STD_LOGIC;
			b: IN  STD_LOGIC;
		   q: OUT STD_LOGIC);
END and_gate;

ARCHITECTURE logic of and_gate is
BEGIN
	
	q <= a and b;
		
END logic;