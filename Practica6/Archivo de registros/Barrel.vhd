---------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barrel is
    Port ( dato : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           s : in STD_LOGIC_VECTOR (2 downto 0));
end Barrel;

architecture Behavioral of Barrel is

begin
process(dato, s)
variable aux : std_logic_vector(7 downto 0);
begin
aux := dato;                
    for i in 0 to 2 loop
        for j in 7 downto 2**i loop     --el ciclo for para el corrimiento a la izquierda
            if s(i) = '0' then          --va del mas significativo al menos significativo
                aux(j) := aux(j);       --para que los bits se vayan arrastrando y que los ultimos 
            else                        --en actualizarse sean los de la derecha que es en donde se ingrean 
                aux(j) := aux(j-2**i);  --los 0s por el corrimiento, si lo recorremos a la inversa, se actualizaria
            end if;                     --primero el bit menos significativo y ese valor se replicaria en todo el vector
        end loop;                       --teniendo como resultado un vector lleno de 0s
        for j in 2**i-1 downto 0 loop   -- inviertan el for y verifiquen lo que les describi
            if s(i) = '0' then
                aux(j) := aux(j);
            else
                aux(j) := '0';
            end if;
        end loop;

    end loop;
    res <= aux;
end process;

end Behavioral;
