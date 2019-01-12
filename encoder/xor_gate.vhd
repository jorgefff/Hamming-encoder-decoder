LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY xor_gate IS
	PORT (a: IN  STD_LOGIC;
			b: IN  STD_LOGIC;
		   q: OUT STD_LOGIC);
END xor_gate;

ARCHITECTURE logic of xor_gate is
BEGIN

	q <= (a nand b) and (a or b);
		
END logic;