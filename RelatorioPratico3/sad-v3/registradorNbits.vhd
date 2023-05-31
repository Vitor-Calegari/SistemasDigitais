LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registradorNbits IS
	GENERIC(N :INTEGER:= 14);
	PORT (R : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0) ;
			Enable, Clock: IN STD_LOGIC ;
			Q : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0) 
			) ;
	
END registradorNbits ;

ARCHITECTURE rtl OF registradorNbits IS
	BEGIN
	
		PROCESS
			BEGIN
			
				WAIT UNTIL Clock'EVENT AND Clock = '1' ;
				IF Enable = '1' THEN
					Q <= R ;
				
			END IF ;
	END PROCESS ;
END rtl;