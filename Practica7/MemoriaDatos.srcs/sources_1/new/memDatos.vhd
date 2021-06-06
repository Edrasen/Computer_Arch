    
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_arith.ALL;
    use IEEE.STD_LOGIC_unsigned.ALL;
    
    entity Arreglo is
        Port ( addrs: in STD_LOGIC_VECTOR (10 downto 0);
            dataIn : in STD_LOGIC_VECTOR (15 downto 0);
            clk, wd : in STD_LOGIC;
            dataOut : out STD_LOGIC_VECTOR (15 downto 0));
    end Arreglo;
    
    architecture Behavioral of Arreglo is
    type banco is array (0 to 2047) of std_logic_vector(15 downto 0);
    signal aux : banco;
    begin
    
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (wd = '1') then
                aux(conv_integer(addrs)) <= dataIn;
            end if;
        end if;
    end process;
    dataOut <= aux(conv_integer(addrs));
    
    
    end Behavioral;
