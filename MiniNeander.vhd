library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MiniNeander is
	PORT(
		CLK	: IN STD_LOGIC;
		RES: in STD_LOGIC;
		
		Z:   out STD_LOGIC_VECTOR(7 downto 0)
	);
end MiniNeander;

architecture behave of MiniNeander is

signal stateOut		: STD_LOGIC_VECTOR (1 DOWNTO 0);
signal UPCODECuOut	: STD_LOGIC_VECTOR (3 DOWNTO 0);

signal PCOut			: STD_LOGIC_VECTOR(3 downto 0);

signal X					: STD_LOGIC_VECTOR(7 downto 0);
signal ULAOut			: STD_LOGIC_VECTOR(7 downto 0);

signal DATA				: STD_LOGIC_VECTOR(15 downto 0);

signal UPCODE			: STD_LOGIC_VECTOR(7 downto 0);
signal OPERATOR		: STD_LOGIC_VECTOR(7 downto 0);

signal SIG 				: STD_LOGIC_VECTOR(6 downto 0);

signal INC 				: STD_LOGIC;
signal RES_PC			: STD_LOGIC;
signal LOAD				: STD_LOGIC;
signal SEL 				: STD_LOGIC_VECTOR(3 downto 0);


component ULA is
	PORT(
		X		: in STD_LOGIC_VECTOR(7 downto 0);
		Y		: in STD_LOGIC_VECTOR(7 downto 0);
		SEL	: in STD_LOGIC_VECTOR(3 downto 0);
		Z		: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component REG is
	PORT(
		D		: in STD_LOGIC_VECTOR(7 downto 0);
		ENA	: in STD_LOGIC;
		CLK	: in STD_LOGIC;
		Q		: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component PC is
	PORT(
		RES	: in STD_LOGIC;
		INC	: in STD_LOGIC;
		CLK	: IN STD_LOGIC;
		Z		: out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component Memory is
	PORT(
		ADDR	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		CLK	: IN STD_LOGIC;
		Q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;

component CU is
	PORT(
		CLK		: in STD_LOGIC;
		RES		: in STD_LOGIC;
		UPCODE	: in STD_LOGIC_VECTOR (7 DOWNTO 0);
		
		stateOut : out STD_LOGIC_VECTOR (1 DOWNTO 0);
		UPCODECuOut : out STD_LOGIC_VECTOR (3 DOWNTO 0);
		
		SIG		: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
end component;

begin

	u1: ULA port map(
		X		=> X,
		Y   	=> OPERATOR,
		SEL 	=> SEL,
		Z   	=> ULAOut
	);
	
	u2: REG port map(
		D		=> ULAOut,
		ENA 	=> LOAD,
		CLK 	=> CLK,
		Q		=> X
	);
	
	u3: PC port map(
		RES 	=> RES_PC,
		INC 	=> INC,
		CLK 	=> CLK,
		Z   	=> PCOut
	);
	
	u4: Memory port map(
		ADDR 	=> PCOut,
		CLK  	=> CLK,
		Q    	=> DATA
	);
	
	u5: CU port map(
		CLK 		=> CLK,
		RES		=> RES,
		UPCODE	=> UPCODE,
		stateOut	=> stateOut,
		UPCODECuOut => UPCODECuOut,
		SIG		=> SIG
	);
	
	UPCODE 	<= DATA(15 downto 8);
	OPERATOR <= DATA(7 downto 0);
	
	
	INC		<= SIG(6);
	RES_PC	<= SIG(5);
	LOAD		<= SIG(4);
	SEL		<= SIG(3 downto 0);
	
	Z			<= X;

end behave;
