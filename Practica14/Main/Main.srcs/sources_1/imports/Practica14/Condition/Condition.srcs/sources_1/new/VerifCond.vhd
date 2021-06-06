
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VerifCond is
port
	(
		--Banderas de la ALU
		OV: in std_logic;
		Z: in std_logic;
		N: in std_logic;
		C: in std_logic;
		
		EQ: out std_logic;
		NEQ: out std_logic;
		LT: out std_logic;
		LET: out std_logic;
		GT: out std_logic;
		GET: out std_logic
	);
end VerifCond;

architecture Behavioral of VerifCond is
begin
		--Igualdad
		EQ<=Z;
		--Desigualdad
		NEQ<=(not Z);
		--Menor
		LT<=(not C);
		--Menor o igual
		LET<=(Z or (not C));
		--Mayor
		GT<=(C and (not Z));
		--Mayor o igual
		GET<=C;
end Behavioral;

