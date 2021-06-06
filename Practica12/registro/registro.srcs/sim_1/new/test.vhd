library ieee;
use ieee.std_logic_1164.all;

entity tb_arreglo is
end tb_arreglo;

architecture tb of tb_arreglo is

    component arreglo
        port (la    : in std_logic;
              ea    : in std_logic;
              clk   : in std_logic;
              clr   : in std_logic;
              dato  : in std_logic_vector (8 downto 0);
              salida : out std_logic_vector (8 downto 0);
              z     : out std_logic;
              a0    : out std_logic);
    end component;

    signal la    : std_logic;
    signal ea    : std_logic;
    signal clk   : std_logic;
    signal clr   : std_logic;
    signal dato  : std_logic_vector (8 downto 0);
    signal salida : std_logic_vector (8 downto 0);
    signal z     : std_logic;
    signal a0    : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : arreglo
    port map (la    => la,
              ea    => ea,
              clk   => clk,
              clr   => clr,
              dato  => dato,
              salida => salida,
              z     => z,
              a0    => a0);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
 	
            wait for 10 ns;
			dato<= "111111111";
			la <= '1';
			ea <= '0';
			clr<= '0';
			wait for 10 ns;
			clr <= '0';
			la<= '0';
			ea <= '1';
			wait for 10ns;
			la <= '0';
			ea <= '1';
			wait for 10ns;
			la <= '0';
			ea <= '1';
			wait for 10ns;
			la <= '0';
			ea <= '1';
			wait for 10ns;
        wait;
    end process;

end tb;