library ieee;
use ieee.std_logic_1164.all;

entity tb_ctrlUnit is
end tb_ctrlUnit;

architecture tb of tb_ctrlUnit is

    component ctrlUnit
        port (clr : in std_logic;
              clk : in std_logic;
              ini : in std_logic;
              z   : in std_logic;
              a0  : in std_logic;
              la  : out std_logic;
              lb  : out std_logic;
              ea  : out std_logic;
              eb  : out std_logic;
              ec  : out std_logic);
    end component;

    signal clr : std_logic;
    signal clk : std_logic;
    signal ini : std_logic;
    signal z   : std_logic;
    signal a0  : std_logic;
    signal la  : std_logic;
    signal lb  : std_logic;
    signal ea  : std_logic;
    signal eb  : std_logic;
    signal ec  : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : ctrlUnit
    port map (clr => clr,
              clk => clk,
              ini => ini,
              z   => z,
              a0  => a0,
              la  => la,
              lb  => lb,
              ea  => ea,
              eb  => eb,
              ec  => ec);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        clr <= '0';
        ini <= '1';
        z <= '0';
        a0 <= '1';

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;