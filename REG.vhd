library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity REG is
	PORT(
		D		: in STD_LOGIC_VECTOR(7 downto 0);
		ENA	: in STD_LOGIC;
		CLK	: in STD_LOGIC;
		Q		: out STD_LOGIC_VECTOR(7 downto 0)
	);
 
end REG;

architecture REG_Behave of REG is

begin

	process (CLK)
	begin
	
		if (rising_edge(CLK)) then
			if (ENA = '1') then
				Q <= D;
			end if;
		end if;
		
	end process;

end REG_Behave;
