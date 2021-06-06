library ieee;
use ieee.std_logic_1164.all;

entity tb_Contador is
end tb_Contador;

architecture tb of tb_Contador is

    component Contador
        port (clk : in std_logic;
              clr : in std_logic;
              lb  : in std_logic;
              eb  : in std_logic;
              B   : inout std_logic_vector (3 downto 0));
    end component;

    signal clk : std_logic;
    signal clr : std_logic;
    signal lb  : std_logic;
    signal eb  : std_logic;
    signal B   : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Contador
    port map (clk => clk,
              clr => clr,
              lb  => lb,
              eb  => eb,
              B   => B);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        wait for 10ns;
        clr <= '0';
        wait for 100ns;
        lb <= '1';
        eb <= '0';
        wait for 100ns;
        lb <= '0';
        eb <= '1';
        wait for 100ns;
        lb <= '0';
        eb <= '0';
        wait for 100ns;
        lb <= '0';
        eb <= '1';
        wait for 200ns;
        lb <= '0';
        eb <= '0';
        wait for 100ns;
        
          
      
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;
