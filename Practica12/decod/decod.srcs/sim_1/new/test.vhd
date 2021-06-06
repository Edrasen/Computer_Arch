library ieee;
use ieee.std_logic_1164.all;

entity tb_Decodificador is
end tb_Decodificador;

architecture tb of tb_Decodificador is

    component Decodificador
        port (B   : in std_logic_vector (3 downto 0);
              aux : out std_logic_vector (6 downto 0));
    end component;

    signal B   : std_logic_vector (3 downto 0);
    signal aux : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Decodificador
    port map (B   => B,
              aux => aux);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        wait for 10ns;
        B <= "0010";
        wait for 10ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;