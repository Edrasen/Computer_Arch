library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mypackage is
	
component Contador is
		 Port ( clk, clr : in  STD_LOGIC;
				  lb, eb : in  STD_LOGIC;
				  B : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component arreglo is
		 Port ( la, ea, clk, clr : in  STD_LOGIC;
				  dato : in  STD_LOGIC_VECTOR (8 downto 0);
				  dato1 : out  STD_LOGIC_VECTOR (8 downto 0);
				  z, a0 : out  STD_LOGIC);
	end component;
	
	component Decodificador is
		 Port ( B : in  STD_LOGIC_VECTOR (3 downto 0);
				  aux : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component ctrlUnit is
		 Port ( clr, clk : in  STD_LOGIC;
				  ini, a0, z : in  STD_LOGIC;
				  la, ea, eb, lb, ec : out  STD_LOGIC);
	end component;
	
	component multiplexor is
		 Port ( aux : in  STD_LOGIC_VECTOR (6 downto 0);
				  ec : in  STD_LOGIC;
				  display : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;

end mypackage;