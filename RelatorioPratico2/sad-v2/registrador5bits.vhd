LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registrador5bits IS

	PORT (R : IN STD_LOGIC_VECTOR(4 DOWNTO 0) ;
			Enable, Clock: IN STD_LOGIC ;
			Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) 
			) ;
	
END registrador5bits ;

ARCHITECTURE rtl OF registrador5bits IS
	BEGIN
	
		PROCESS
			BEGIN
			
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
				IF Enable = '1' THEN
					Q <= R ;
				
			END IF ;
	END PROCESS ;
END rtl;