library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity REG_tb is
end REG_tb;

architecture REG_Behave_tb of REG_tb is

component REG is
	PORT(
		D		: in STD_LOGIC_VECTOR(7 downto 0);
		ENA	: in STD_LOGIC;
		CLK	: in STD_LOGIC;
		Q		: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal CLK : STD_LOGIC := '0';
signal ENA : STD_LOGIC := '0';
signal D   : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal Q   : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin

	DUT: REG port map(D, ENA, CLK, Q);

	proc: process
	begin
		wait for 10 ns;
		
		CLK <= '1';
		ENA <= '1';
		D <= "00000010";
		wait for 10 ns;
		
		CLK <= '0';
		ENA <= '0';
		D <= "00000000";
		wait for 10 ns;
		
		CLK <= '1';
		ENA <= '0';
		D <= "01000000";
		wait for 10 ns;
		
		CLK <= '0';
		ENA <= '0';
		D <= "00000000";
		wait for 10 ns;
		
		CLK <= '1';
		ENA <= '1';
		D <= "01000000";
		wait for 10 ns;
		
	end process;

end REG_Behave_tb;
