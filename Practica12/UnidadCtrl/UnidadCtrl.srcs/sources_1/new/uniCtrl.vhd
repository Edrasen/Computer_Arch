
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ctrlUnit is
    Port(
    clr, clk: in std_logic;
    ini, z, a0: in std_logic;
    la, lb, ea,eb,ec : out std_logic);
end ctrlUnit;

architecture Behavioral of ctrlUnit is
type estados is(E0, E1, E2);
signal edo_act, edo_sig: estados;
begin
    process(clk, clr)
    begin
    if(clr = '1') then
        edo_act <= E0;
    elsif(rising_edge(clk)) then
    edo_act <= edo_sig;
    end if;
    end process;
    
    process(edo_act, ini,z, a0)
    begin
        la <= '0';
        lb <= '0';
        ea <= '0';
        eb <= '0';
        ec <= '0';
        case edo_act is
            
            when E0 =>
            lb <= '1';
            if(ini = '0') then
                la <= '1';
                edo_sig <= E0;
            else
                edo_sig <= E1;
            end if;
            
            when E1 =>
				ea <= '1';
				if (z = '0') then
					if (a0 = '0') then
						edo_sig <= E1;
					else
						eb <= '1';
						edo_sig <= E1;
					end if;
				else
					edo_sig <= E2;
				end if;
		    
		    when E2 =>
				ec <= '1';
				if (ini = '0') then
					edo_sig <= E0;
				else
					edo_sig <= E2;
				end if;
        end case;
    end process;
end Behavioral;
