LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registrador14bits IS

	PORT (R : IN STD_LOGIC_VECTOR(13 DOWNTO 0) ;
			Enable, Clock: IN STD_LOGIC ;
			Q : OUT STD_LOGIC_VECTOR(13 DOWNTO 0) 
			) ;
	
END registrador14bits ;

ARCHITECTURE rtl OF registrador14bits IS
	BEGIN
	
		PROCESS
			BEGIN
			
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
				IF Enable = '1' THEN
					Q <= R ;
				
			END IF ;
	END PROCESS ;
END rtl;