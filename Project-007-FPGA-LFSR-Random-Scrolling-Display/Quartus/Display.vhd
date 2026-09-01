LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Display IS
PORT ( D : IN std_logic_vector(3 downto 0);
       EN: IN std_logic;
S : OUT std_logic_vector(6 downto 0) );
END Display;
ARCHITECTURE behavior OF Display IS
Begin
		S <="1000000" when D="0000" AND EN = '1' else --0
		"1111001" when D="0001" AND EN = '1' else --1
		"0100100" when D="0010" AND EN = '1' else --2
		"0110000" when D="0011" AND EN = '1' else --3
		"0011001" when D="0100" AND EN = '1' else --4
		"0010010" when D="0101" AND EN = '1' else --5
		"0000010" when D="0110" AND EN = '1' else --6
		"1111000" when D="0111" AND EN = '1' else --7
		"0000000" when D="1000" AND EN = '1' else --8
		"0011000" when D="1001" AND EN = '1' else --9
		"0001000" when D="1010" AND EN = '1' else --A
		"0000011" when D="1011" AND EN = '1' else --b
		"1000110" when D="1100" AND EN = '1' else --C
		"0100001" when D="1101" AND EN = '1' else --d
		"0000110" when D="1110" AND EN = '1' else --E
		"0001110" when D="1111" AND EN = '1' else --F
		"1111111" ;
END behavior;
