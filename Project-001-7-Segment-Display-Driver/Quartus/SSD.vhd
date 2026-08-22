LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY SSD IS
PORT ( D : IN std_logic_vector(3 downto 0);
   EN: IN std_logic;
S : OUT std_logic_vector(6 downto 0) );
END SSD;
ARCHITECTURE behavior OF SSD IS
Begin
  S<="1000000" when D="0000" AND EN = '1' else
     "1111001" when D="0001" AND EN = '1' else
	  "0100100" when D="0010" AND EN = '1' else
	  "0110000" when D="0011" AND EN = '1' else
	  "0011001" when D="0100" AND EN = '1' else
	  "1111111";
END behavior;
	  