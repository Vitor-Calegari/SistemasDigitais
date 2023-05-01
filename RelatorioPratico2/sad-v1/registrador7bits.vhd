LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registrador7bits IS

	PORT (R : IN STD_LOGIC_VECTOR(6 DOWNTO 0) ;
			Enable, Clock: IN STD_LOGIC ;
			Q : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
			) ;
	
END registrador7bits ;

ARCHITECTURE rtl OF registrador7bits IS
	BEGIN
	
		PROCESS
			BEGIN
			
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
				IF Enable = '1' THEN
					Q <= R ;
				
			END IF ;
	END PROCESS ;
END rtl;