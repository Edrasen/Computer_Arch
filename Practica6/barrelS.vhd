-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrelSh is
    Port ( readData : in STD_LOGIC_VECTOR (15 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           dir : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (15 downto 0));
end barrelSh;

architecture Behavioral of barrelSh is

begin
    process(dir,shamt,readData)
    variable aux : std_logic_vector(15 downto 0);
    begin
    aux := readData
    if dir = '1' then
         
    end process;

end Behavioral;
