-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 26.3.2020 06:41:41 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_Demux is
end tb_Demux;

architecture tb of tb_Demux is

    component Demux
        port (WR       : in std_logic;
              writeReg : in std_logic_vector (3 downto 0);
              Lout     : out std_logic_vector (15 downto 0));
    end component;

    signal WR       : std_logic;
    signal writeReg : std_logic_vector (3 downto 0);
    signal Lout     : std_logic_vector (15 downto 0);

begin

    dut : Demux
    port map (WR       => WR,
              writeReg => writeReg,
              Lout     => Lout);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        WR <= '0';
        writeReg <= "0000";
        wait for 100 ns;
        writeReg <= "0001";
        wait for 100 ns;
        writeReg <= "0010";
        wait for 100 ns;
        WR <= '1';
        writeReg <= "0011";
        wait for 100 ns;
        writeReg <= "0100";
        wait for 100 ns;
        writeReg <= "0101";
        wait for 100 ns;
        writeReg <= "0110";
        wait for 100 ns;
        writeReg <= "0111";
        wait for 100ns;
        WR <= '0';
        writeReg <= "1000";
        wait for 100 ns;
        writeReg <= "1001";
        wait for 100 ns;
        writeReg <= "1010";
        wait for 100 ns;
        writeReg <= "1011";
        wait for 100 ns;
        WR <= '1';
        writeReg <= "1100";
        wait for 100 ns;
        writeReg <= "1101";
        wait for 100 ns;
        writeReg <= "1110";
        wait for 100 ns;
        writeReg <= "1111";
        wait for 100 ns;
        
        
        wait;
    end process;

end tb;