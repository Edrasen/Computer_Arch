
library IEEE;
library work;

use IEEE.STD_LOGIC_1164.ALL;
use work.mypackage.ALL;


entity cartaASM is
Port ( clr, clk : in  STD_LOGIC;
           ini : in  STD_LOGIC;
           dato : in  STD_LOGIC_VECTOR (8 downto 0);
		   dato1 : out  STD_LOGIC_VECTOR (8 downto 0);
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end cartaASM;

architecture Behavioral of cartaASM is

signal lb, eb, la, ea, ec, a0, z : STD_LOGIC;
signal B : STD_LOGIC_VECTOR (3 downto 0);
signal aux : STD_LOGIC_VECTOR (6 downto 0);
begin

	unic : ctrlUnit port map (
		clk => clk,
		clr => clr,
		ini => ini,
		a0 => a0,
		z => z,
		la => la,
		ea => ea,
		eb => eb,
		lb => lb,
		ec => ec
	);
	
	reg : arreglo port map (
		clk => clk,
		clr => clr,
		la => la,
		ea => ea,
		dato => dato,
		dato1 => dato1,
		z => z,
		a0 => a0
	);
	
	conta : Contador port map (
		clk => clk,
		clr => clr,
		lb => lb,
		eb => eb,
		B => B
	);
	
	deco : Decodificador port map (
		B => B,
		aux => aux
	);
	
	muxe : multiplexor port map (
		aux => aux,
		ec => ec,
		display => display
	);
	
end Behavioral;



