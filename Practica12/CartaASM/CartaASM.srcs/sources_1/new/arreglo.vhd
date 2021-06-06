
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arreglo is
Port ( la, ea, clk, clr : in  STD_LOGIC;
        dato : in  STD_LOGIC_VECTOR (8 downto 0);
		dato1 : out  STD_LOGIC_VECTOR (8 downto 0);
        z, a0 : out  STD_LOGIC);
end arreglo;

architecture Behavioral of arreglo is

signal a: STD_LOGIC_VECTOR (8 downto 0);
begin
	process (clk, clr)
		begin
			if (clr = '1') then
				a<="000000000";
			elsif (clk'event and clk = '1') then	
				if (la = '1' and ea = '0') then
					a <= dato;
				end if;
				if (la = '0' and ea = '1') then
					a <= to_stdlogicvector(to_bitvector(a) srl 1);
				end if;
			end if;
	end process;
	dato1 <= a;
	a0 <= a(0);
	z <= not(a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7) or a(8));


end Behavioral;

