library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CU_tb is
end CU_tb;

architecture CU_Behave_tb of CU_tb is

component CU is
	PORT(
		CLK		: in STD_LOGIC;
		RES		: in STD_LOGIC;
		UPCODE	: in STD_LOGIC_VECTOR (7 DOWNTO 0);
		
		stateOut : out STD_LOGIC_VECTOR (3 DOWNTO 0);
		UPCODECuOut : out STD_LOGIC_VECTOR (3 DOWNTO 0);
		
		SIG		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

signal CLK    : STD_LOGIC := '0';
signal RES    : STD_LOGIC := '0';
signal UPCODE : STD_LOGIC_VECTOR(7 downto 0) := "00000001";	-- ADD

signal stateOut : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal UPCODECuOut : STD_LOGIC_VECTOR (3 DOWNTO 0);

signal SIG : STD_LOGIC_VECTOR(7 downto 0);

begin

	DUT: CU port map(CLK, RES, UPCODE, stateOut, UPCODECuOut, SIG);
	
	clock: process
	begin
		CLK <= '0';
		wait for 10 ns;
		
		CLK <= '1';
		wait for 10 ns;
	end process;

	-- proc: process
	-- begin
		
		
	-- end process;

end CU_Behave_tb;
