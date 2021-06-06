library ieee;
use ieee.std_logic_1164.all;

entity tb_CodFunROM is
end tb_CodFunROM;

architecture tb of tb_CodFunROM is

    component CodFunROM
        port (BusDir                  : in std_logic_vector (3 downto 0);
              MicroinstruccionFuncion : out std_logic_vector (19 downto 0));
    end component;

    signal BusDir                  : std_logic_vector (3 downto 0);
    signal MicroinstruccionFuncion : std_logic_vector (19 downto 0);

begin

    dut : CodFunROM
    port map (BusDir                  => BusDir,
              MicroinstruccionFuncion => MicroinstruccionFuncion);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
     
        
        BusDir <= "1010";
        
        wait for 100ns;
         
        BusDir <= "0101";
        
        wait for 100ns;
        -- EDIT Add stimuli here

    end process;

end tb;
