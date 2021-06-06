library ieee;
use ieee.std_logic_1164.all;

entity tb_UC is
end tb_UC;

architecture tb of tb_UC is

    component UC
        port (TIPOR : in std_logic;
              BEQI  : in std_logic;
              BNEI  : in std_logic;
              BLTI  : in std_logic;
              BLETI : in std_logic;
              BGTI  : in std_logic;
              BGETI : in std_logic;
              NA    : in std_logic;
              EQ    : in std_logic;
              NEQ   : in std_logic;
              LT    : in std_logic;
              LET   : in std_logic;
              GT    : in std_logic;
              GET   : in std_logic;
              SDOPC : out std_logic;
              SM    : out std_logic);
    end component;

    signal TIPOR : std_logic;
    signal BEQI  : std_logic;
    signal BNEI  : std_logic;
    signal BLTI  : std_logic;
    signal BLETI : std_logic;
    signal BGTI  : std_logic;
    signal BGETI : std_logic;
    signal NA    : std_logic;
    signal EQ    : std_logic;
    signal NEQ   : std_logic;
    signal LT    : std_logic;
    signal LET   : std_logic;
    signal GT    : std_logic;
    signal GET   : std_logic;
    signal SDOPC : std_logic;
    signal SM    : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : UC
    port map (TIPOR => TIPOR,
              BEQI  => BEQI,
              BNEI  => BNEI,
              BLTI  => BLTI,
              BLETI => BLETI,
              BGTI  => BGTI,
              BGETI => BGETI,
              NA    => NA,
              EQ    => EQ,
              NEQ   => NEQ,
              LT    => LT,
              LET   => LET,
              GT    => GT,
              GET   => GET,
              SDOPC => SDOPC,
              SM    => SM);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        TIPOR <= '0';
        BEQI <= '1';
        BNEI <= '0';
        BLTI <= '0';
        BLETI <= '0';
        BGTI <= '0';
        BGETI <= '0';
        NA <= '0';
        EQ <= '1';
        NEQ <= '0';
        LT <= '0';
        LET <= '0';
        GT <= '0';
        GET <= '0';

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;
end tb;