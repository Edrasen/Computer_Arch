library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador is
    Port ( a,b : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout: out STD_LOGIC);
end sumador;

architecture Behavioral of sumador is
begin
process(a,b,cin)
variable p, g : std_logic_vector(7 downto 0);
variable aux1, aux2, aux3, auxd : std_logic;
variable c : std_logic_vector(8 downto 0);
    begin
    c(0) := cin;
    
    for i in 0 to 7 loop
        P(i) := a(i) xor b(i);
        G(i) := a(i) and b(i);
        s(i) <= P(i) xor c(i);
        
        aux1 := c(0);
        for j in 0 to i loop
            aux1 := P(j) and aux1;
        end loop;
        
        aux2 := '0';
        for k in 0 to i-1 loop
            aux3 := '1';
            for m in k+1 to i loop
                aux3 := aux3 and P(m);
            end loop;
            aux2 := aux2 or (aux3 and g(k));
        
        end loop;
        c(i+1) := aux2 or aux1 or g(i);
    end loop;
    cout <= c(8);
    end process;
end Behavioral;
