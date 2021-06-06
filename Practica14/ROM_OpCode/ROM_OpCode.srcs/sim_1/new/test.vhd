library ieee;
use ieee.std_logic_1164.all;

entity tb_CodOperROM is
end tb_CodOperROM;

architecture tb of tb_CodOperROM is

    component CodOperROM
        port (BusDir             : in std_logic_vector (4 downto 0);
              MicroInstruccionOP : out std_logic_vector (19 downto 0));
    end component;

    signal BusDir             : std_logic_vector (4 downto 0);
    signal MicroInstruccionOP : std_logic_vector (19 downto 0);

begin

    dut : CodOperROM
    port map (BusDir             => BusDir,
              MicroInstruccionOP => MicroInstruccionOP);

    stimuli : process
    begin
       BusDir <= "00011";
       wait for 100ns;
       BusDir <= "01010";
       wait for 100ns;
    end process;

end tb;