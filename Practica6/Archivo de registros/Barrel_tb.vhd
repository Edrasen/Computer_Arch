library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barrel_tb is
--  Port ( );
end Barrel_tb;

architecture Behavioral of Barrel_tb is
component Barrel is
    Port ( dato : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0));
end component;

signal dato : STD_LOGIC_VECTOR (7 downto 0);
signal res :  STD_LOGIC_VECTOR (7 downto 0);
signal s :  STD_LOGIC_VECTOR (2 downto 0);

begin


u1 : Barrel 
    Port map ( 
        dato => dato,
        res  => res,
        s => s
        );
        
 simulacion : process
 begin
    dato <= "10010111";
    s <= "011";
    wait for 30 ns;
    dato <= "10010001";
    s <= "100";
    wait;
 
 
 end process;
        

end Behavioral;
