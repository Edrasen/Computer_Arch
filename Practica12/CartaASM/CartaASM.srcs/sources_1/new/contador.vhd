
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador is
Port ( clk, clr : in  STD_LOGIC;
       lb, eb : in  STD_LOGIC;
       B : inout  STD_LOGIC_VECTOR (3 downto 0));
end Contador;

architecture Behavioral of Contador is

begin

	process(clk,clr)
		begin
			if(clr = '1' ) then
				B <= "0000";
			elsif(clk'event and clk = '1' ) then
				if(eb = '0' and lb = '1') then
					B <= "0000";
				elsif(eb = '1' and lb = '0' ) then
					B <= B + 1;
				end if;
			end if;
	end process;


end Behavioral;

