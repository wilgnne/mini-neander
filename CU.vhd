library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CU is
	PORT(
		CLK		: in STD_LOGIC;
		RES		: in STD_LOGIC;
		UPCODE	: in STD_LOGIC_VECTOR (7 DOWNTO 0);
		
		stateOut : out STD_LOGIC_VECTOR (1 DOWNTO 0);
		UPCODECuOut : out STD_LOGIC_VECTOR (3 DOWNTO 0);
		
		SIG		: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
 
end CU;

architecture CU_Behave of CU is

-- INC RES LOAD SEL SEL SEL SEL
signal SIGin : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";

-- X + Y		0000 0001
-- X and Y 	0000 0010
-- X or Y 	0000 0011
-- Not X 	0000 0100
-- Y 			0000 0101
-- HALT 		0000 0110

-- LOAD  > EXEC > INCR

constant LOAD		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
constant EXEC 		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "01";
constant INCR 		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "10";
constant HALT 		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "11";

signal state 		: STD_LOGIC_VECTOR (1 DOWNTO 0) := LOAD;

signal UPCODEin 	: STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

	process (CLK, RES)
	begin
		if (RES = '1') then
			state <= "00";
			SIGin <= "0100000";
		elsif (rising_edge(CLK)) then
			case state is
				when LOAD =>									-- BUSCA e DECODIFICA
					UPCODEin <= UPCODE(3 DOWNTO 0);
					state <= EXEC;
					SIGin <= "0000000";
				when EXEC =>									-- EXECUTA e Salva
					state <= INCR;
					SIGin <= "0000000";
					
					case UPCODEin is
						when "0001" 
							| "0010" 
							| "0011" 
							| "0100" 
							| "0101" =>	-- ULA
							SIGin <= "001" & UPCODEin;
						when "0110" =>								-- HALT
							state <= HALT;
						when OTHERS =>								-- NOP
							state <= INCR;
					end case;
					
				when INCR =>									-- INCR
					SIGin <= "1000000";
					state <= "00";
				when HALT =>
					state <= HALT;								-- HALT
					SIGin <= "0000000";
				when OTHERS =>
					SIGin <= "0100000";
					state <= "00";
					
			end case;
		end if;
		
	end process;
	
	SIG <= SIGin;
	stateOut <= state;
	UPCODECuOut <= UPCODEin;

end CU_Behave;
