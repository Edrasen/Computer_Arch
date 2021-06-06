library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplexor is
end tb_multiplexor;

architecture tb of tb_multiplexor is

    component multiplexor
        port (aux     : in std_logic_vector (6 downto 0);
              ec      : in std_logic;
              display : out std_logic_vector (6 downto 0));
    end component;

    signal aux     : std_logic_vector (6 downto 0);
    signal ec      : std_logic;
    signal display : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : multiplexor
    port map (aux     => aux,
              ec      => ec,
              display => display);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
        wait for 10ns;
        aux <= "1001111";
        ec <= '0';
        wait for 10ns;
        ec <= '1';
        wait for 10ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;