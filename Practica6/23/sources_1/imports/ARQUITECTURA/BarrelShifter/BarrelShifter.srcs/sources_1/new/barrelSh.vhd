
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrelSh is
    Port ( readData : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (3 downto 0);
           dir : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (15 downto 0));
end barrelSh;

architecture Behavioral of barrelSh is

begin
    process(dir,s,readData)
    variable aux : std_logic_vector(15 downto 0);
    begin
    aux := readData;
    if dir = '1' then
        for i in 0 to 3 loop
            for j in 15 downto 2**i loop
                if s(i) = '0' then
                    aux(j) := aux(j);
                else
                    aux(j) := aux(j-2**i);
                end if;
            end loop;
            for j in 2**i-1 downto 0 loop
                if s(i) = '0' then
                    aux(j) := aux(j);
                else
                    aux(j) := '0';
                end if;
            end loop;
        end loop;
    else
        for i in 0 to 3 loop
            for j in 0 to 15-2**i loop
                if s(i) = '0' then 
                    aux(j) := aux(j);
                else
                    aux(j) := aux(j+2**i);
                end if;
            end loop;
            for j in 15-2**i+1 to 15 loop
                if s(i) = '0' then
                    aux(j) := aux(j);
                else
                    aux(j) := '0';
                end if;
            end loop;
        end loop;
    end if;
    res <= aux;
    end process;

end Behavioral;
