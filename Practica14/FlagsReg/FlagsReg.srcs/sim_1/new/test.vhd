library ieee;
use ieee.std_logic_1164.all;

entity tb_RegFlags is
end tb_RegFlags;

architecture tb of tb_RegFlags is

    component RegFlags
        port (OV     : in std_logic;
              N      : in std_logic;
              Z      : in std_logic;
              C      : in std_logic;
              LF     : in std_logic;
              clk    : in std_logic;
              clr    : in std_logic;
              OV_out : inout std_logic;
              N_out  : inout std_logic;
              Z_out  : inout std_logic;
              C_out  : inout std_logic);
    end component;

    signal OV     : std_logic;
    signal N      : std_logic;
    signal Z      : std_logic;
    signal C      : std_logic;
    signal LF     : std_logic;
    signal clk    : std_logic;
    signal clr    : std_logic;
    signal OV_out : std_logic;
    signal N_out  : std_logic;
    signal Z_out  : std_logic;
    signal C_out  : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : RegFlags
    port map (OV     => OV,
              N      => N,
              Z      => Z,
              C      => C,
              LF     => LF,
              clk    => clk,
              clr    => clr,
              OV_out => OV_out,
              N_out  => N_out,
              Z_out  => Z_out,
              C_out  => C_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        OV <= '0';
        N <= '0';
        Z <= '1';
        C <= '1';
        LF <= '1';
        clr <= '0';

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;