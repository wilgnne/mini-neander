library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Memory is
	PORT(
		ADDR	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		CLK	: IN STD_LOGIC  := '1';
		Q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
 
end Memory;

architecture Memory_Behave of Memory is

signal bank0	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
signal bank1	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000010100000010";
signal bank2	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000100000101";
signal bank3	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000100001000";
signal bank4	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000001000000101";
signal bank5	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000010000000000";
signal bank6	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000001000001111";
signal bank7	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000001100000100";
signal bank8	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000010110101010";
signal bank9	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000101000100";
signal bank10	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
signal bank11	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
signal bank12	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000011000000000";
signal bank13	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
signal bank14	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
signal bank15	: STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";

begin

	process (CLK)
	begin
		if (rising_edge(CLK)) then
			case ADDR is
				when "0000" =>
					Q <= bank0;
				when "0001" =>
					Q <= bank1;
				when "0010" =>
					Q <= bank2;
				when "0011" =>
					Q <= bank3;
				when "0100" =>
					Q <= bank4;
				when "0101" =>
					Q <= bank5;
				when "0110" =>
					Q <= bank6;
				when "0111" =>
					Q <= bank7;
				when "1000" =>
					Q <= bank8;
				when "1001" =>
					Q <= bank9;
				when "1010" =>
					Q <= bank10;
				when "1011" =>
					Q <= bank11;
				when "1100" =>
					Q <= bank12;
				when "1101" =>
					Q <= bank13;
				when "1110" =>
					Q <= bank14;
				when "1111" =>
					Q <= bank15;
				when OTHERS =>
					Q <= "0000000000000000";
			end case;
		end if;
	
	end process;

end Memory_Behave;
