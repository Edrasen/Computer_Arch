library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
 Port ( aux : in  STD_LOGIC_VECTOR (6 downto 0);
           ec : in  STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end multiplexor;

architecture Behavioral of multiplexor is

constant guion : std_logic_vector(6 downto 0) := "1111110";

begin

	with ec select
		display <= guion when '0',
					aux when others;

end Behavioral;