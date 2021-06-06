library ieee;
use ieee.std_logic_1164.all;

entity tb_cartaASM is
end tb_cartaASM;

architecture tb of tb_cartaASM is

    component cartaASM
        port (clr     : in std_logic;
              clk     : in std_logic;
              ini     : in std_logic;
              dato    : in std_logic_vector (8 downto 0);
              dato1   : out std_logic_vector (8 downto 0);
              display : out std_logic_vector (6 downto 0));
    end component;

    signal clr     : std_logic;
    signal clk     : std_logic;
    signal ini     : std_logic;
    signal dato    : std_logic_vector (8 downto 0);
    signal dato1   : std_logic_vector (8 downto 0);
    signal display : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : cartaASM
    port map (clr     => clr,
              clk     => clk,
              ini     => ini,
              dato    => dato,
              dato1   => dato1,
              display => display);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin

        ini <= '0';
        
        --dato <= "101101011";    --a
        --dato <= "000011101";    --b
        --dato <= "000010000";    --c
        --dato <= "100001000";    --d
        dato <= "000000000";    --e
        wait for 100ns;
        clr <= '0';
        ini <='1';
        
        

        -- EDIT Add stimuli here
        wait for 12 * TbPeriod;
        

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;