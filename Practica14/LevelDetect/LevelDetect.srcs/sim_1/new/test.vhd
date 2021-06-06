library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity DetectorNivel_tb is
end;

architecture bench of DetectorNivel_tb is

  component DetectorNivel
  port
  	(
  		clk: in std_logic;
  		clr: in std_logic;
  		NA: out std_logic
  	);
  end component;

  signal clk: std_logic;
  signal clr: std_logic;
  signal NA: std_logic ;
  
  signal nclk1: std_logic;
  signal pclk1: std_logic;

  constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
  signal TbClock : std_logic := '0';
  signal TbSimEnded : std_logic := '0';

begin

  uut: DetectorNivel port map ( clk => clk,
                                clr => clr,
                                NA  => NA   
                                );


    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;
  
  stimuli: process
  begin
    clr <= '0';
    wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
  end process;

end;