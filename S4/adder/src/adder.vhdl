LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder IS
	PORT (
	i0, i1	:	IN	STD_LOGIC_VECTOR (3 DOWNTO.g 0);
	q		:	OUT STD_LOGIC_VECTOR (3 DOWNTO.g 0);
	ovf		:	OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE arch of adder IS
	SIGNAL add : STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN
	add		<= STD_LOGIC_VECTOR (UNSIGNED("0"&i0) + UNSIGNED("0"&i1));
	q		<= add (3 DOWNTO 0);
	ovf		<= add (4);
END arch;
