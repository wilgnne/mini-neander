library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ULA_tb is
end ULA_tb;

architecture ULA_Behave_tb of ULA_tb is

component ULA is
	PORT(
		X:   in STD_LOGIC_VECTOR(7 downto 0);
		Y:   in STD_LOGIC_VECTOR(7 downto 0);
		SEL: in STD_LOGIC_VECTOR(3 downto 0);
		Z:   out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal X:   STD_LOGIC_VECTOR(7 downto 0);
signal Y:   STD_LOGIC_VECTOR(7 downto 0);
signal SEL:	STD_LOGIC_VECTOR(3 downto 0);
signal Z:   STD_LOGIC_VECTOR(7 downto 0);

begin

	DUT: ULA port map(X, Y, SEL, Z);

	proc: process
	begin
		wait for 10 ns;
		
		SEL <= "0001";			-- ADD = 00000100
		X   <= "00000011";
		y   <= "00000001";
		wait for 10 ns;
		
		SEL <= "0010";			-- AND = 01000010
		X   <= "01001010";
		y   <= "01010011";
		wait for 10 ns;
		
		SEL <= "0011";			-- OR  = 01010010
		X   <= "01000010";
		y   <= "01010000";
		wait for 10 ns;
		
		SEL <= "0100";			-- NOT  = 10111101
		X   <= "01000010";
		y   <= "01010000";
		wait for 10 ns;
		
		SEL <= "0101";			-- LOAD  = 01010000
		X   <= "01000010";
		y   <= "01010000";
		wait for 10 ns;
		
		SEL <= "1000";			-- OTHER  = 00000000
		X   <= "01010010";
		y   <= "01010010";
		wait for 10 ns;
		
		
	end process;

end ULA_Behave_tb;
