library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ULA is
	PORT(
		X:   in STD_LOGIC_VECTOR(7 downto 0);
		Y:   in STD_LOGIC_VECTOR(7 downto 0);
		SEL: in STD_LOGIC_VECTOR(3 downto 0);
		Z:   out STD_LOGIC_VECTOR(7 downto 0)
	);
 
end ULA;

architecture ULA_Behave of ULA is

begin

	process (X, Y, SEL)
	begin
	
		case SEL is
			when "0001" =>
				Z <= X + Y;
			when "0010" =>
				Z <= X AND Y;
			when "0011" =>
				Z <= X OR Y;
			when "0100" =>
				Z <= NOT X;
			when "0101" =>
				Z <= Y;
			when OTHERS =>
				Z <= "00000000";
		end case;
		
	end process;

end ULA_Behave;
