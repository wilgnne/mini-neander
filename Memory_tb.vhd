library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Memory_tb is
end Memory_tb;

architecture Memory_Behave_tb of Memory_tb is

component Memory is
	PORT(
		ADDR	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		CLK	: IN STD_LOGIC;
		Q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;

signal RADDR : STD_LOGIC_VECTOR(3 downto 0);
signal CLK  : STD_LOGIC := '0';

signal Q   	: STD_LOGIC_VECTOR(15 downto 0);

begin

	DUT: Memory port map(ADDR => RADDR, CLK => CLK, Q => Q);

	proc: process
	begin
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0000";
		wait for 10 ns;
		
		CLK <= '0';
		RADDR <= "0111";
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0001";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0010";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0011";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0100";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0101";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0110";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "0111";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		
		CLK <= '1';
		RADDR <= "1000";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1001";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1010";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1011";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		
		CLK <= '1';
		RADDR <= "1100";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1101";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1110";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		RADDR <= "1111";
		wait for 10 ns;
		
		CLK <= '0';
		wait for 10 ns;
		
	end process;

end Memory_Behave_tb;
