library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC_tb is
end PC_tb;

architecture PC_Behave_tb of PC_tb is

component PC is
	PORT(
		RES: in STD_LOGIC;
		INC: in STD_LOGIC;
		CLK: in STD_LOGIC;
		Z:   out STD_LOGIC_VECTOR(4 downto 0)
	);
end component;

signal RES : STD_LOGIC := '0';
signal INC   :STD_LOGIC := '0';
signal CLK   :STD_LOGIC := '0';
signal Z   : STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin

	DUT: PC port map(RES, INC, CLK, Z);

	proc: process
	begin
		wait for 10 ns;
		
		CLK <= '1';
		INC <= '1';
		wait for 10 ns;
		
		CLK <= '0';
		INC <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		INC <= '0';
		wait for 10 ns;
		
		CLK <= '0';
		INC <= '1';
		wait for 10 ns;
		
		CLK <= '1';
		INC <= '1';
		wait for 10 ns;
		
		
		CLK <= '1';
		RES <= '1';
		INC <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RES <= '1';
		INC <= '1';
		wait for 10 ns;
		
		CLK <= '0';
		RES <= '0';
		INC <= '0';
		
	end process;

end PC_Behave_tb;
