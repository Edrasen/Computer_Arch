-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 5.3.2020 02:16:47 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_alun is
end tb_alun;

architecture tb of tb_alun is

    component alun
        port (a   : in std_logic_vector (3 downto 0);
              b   : in std_logic_vector (3 downto 0);
              cn  : in std_logic_vector (3 downto 0);
              res : out std_logic_vector (3 downto 0);
              c   : out std_logic;
              n   : out std_logic;
              ov  : out std_logic;
              z   : out std_logic);
    end component;

    signal a   : std_logic_vector (3 downto 0);
    signal b   : std_logic_vector (3 downto 0);
    signal cn  : std_logic_vector (3 downto 0);
    signal res : std_logic_vector (3 downto 0);
    signal c   : std_logic;
    signal n   : std_logic;
    signal ov  : std_logic;
    signal z   : std_logic;

begin

    dut : alun
    port map (a   => a,
              b   => b,
              cn  => cn,
              res => res,
              c   => c,
              n   => n,
              ov  => ov,
              z   => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "0101";
        b <= "0101";
        cn <= "0111";
        wait for 500ns;
        cn <= "1101";
        wait;
    end process;

end tb;
