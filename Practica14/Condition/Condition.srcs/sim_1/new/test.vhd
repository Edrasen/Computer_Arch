library ieee;
use ieee.std_logic_1164.all;

entity tb_VerifCond is
end tb_VerifCond;

architecture tb of tb_VerifCond is

    component VerifCond
        port (OV  : in std_logic;
              Z   : in std_logic;
              N   : in std_logic;
              C   : in std_logic;
              EQ  : out std_logic;
              NEQ : out std_logic;
              LT  : out std_logic;
              LET : out std_logic;
              GT  : out std_logic;
              GET : out std_logic);
    end component;

    signal OV  : std_logic;
    signal Z   : std_logic;
    signal N   : std_logic;
    signal C   : std_logic;
    signal EQ  : std_logic;
    signal NEQ : std_logic;
    signal LT  : std_logic;
    signal LET : std_logic;
    signal GT  : std_logic;
    signal GET : std_logic;

begin

    dut : VerifCond
    port map (OV  => OV,
              Z   => Z,
              N   => N,
              C   => C,
              EQ  => EQ,
              NEQ => NEQ,
              LT  => LT,
              LET => LET,
              GT  => GT,
              GET => GET);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        OV <= '0';
        Z <= '1';
        N <= '0';
        C <= '0';
        
        wait for 100ns;
        
        OV <= '1';
        Z <= '0';
        N <= '1';
        C <= '1';
        
        wait for 100ns;
    end process;

end tb;