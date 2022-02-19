library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	PORT(
		RES	: in STD_LOGIC;
		INC	: in STD_LOGIC;
		CLK	: IN STD_LOGIC;
		Z		: out STD_LOGIC_VECTOR(3 downto 0)
	);
 
end PC;

architecture PC_Behave of PC is

signal Zin: STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

	process (CLK, RES)
	begin
		if (RES = '1') then
			Zin <= "0000";
		elsif (rising_edge(CLK)) then
			if (INC = '1') then
				Zin <= Zin + '1';
			end if;
		end if;
		
	end process;
	
	Z <= Zin;

end PC_Behave;
